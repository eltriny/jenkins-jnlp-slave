docker build --tag tfabric-jenkins-slave:v1 .

docker tag -f tfabric-jenkins-slave:v1 eltriny/jenkins-jnlp-slave

# docker push eltriny/jenkins:v1
