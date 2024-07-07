FROM openjdk:17-alpine
EXPOSE 8081
ADD target/jenkins-docker-app.jar jenkins-docker-app.jar
ENTRYPOINT ["java", "-jar", "/jenkins-docker-app.jar"]