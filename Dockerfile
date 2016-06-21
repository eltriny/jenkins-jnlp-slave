FROM java:8-jdk

ENV HOME /home/jenkins

COPY jenkins-slave /usr/local/bin/jenkins-slave
COPY slave.jar /usr/share/jenkins/slave.jar

RUN useradd -c "Jenkins user" -d $HOME -m jenkins \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar \
  && apt-get update \ 
  && apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev \
  && apt-get install -y git \
  && apt-get install -y maven

VOLUME /home/jenkins
WORKDIR /home/jenkins
USER jenkins

ENTRYPOINT ["jenkins-slave"]
