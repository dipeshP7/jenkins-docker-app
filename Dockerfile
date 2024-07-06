FROM openjdk:17-alpine
EXPOSE 8081
ADD target/jenkins-docker-app jenkins-docker-app
ENTRYPOINT ["java", "-jar", "/jenkins-docker-app"]