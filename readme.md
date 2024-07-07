## Steps to use Jenkins Pipeline with Docker Image

# create a project using pring initializr 
# select maven project, java 17, depenedency spring-web

# add the required code
# you can find the code in src/main/java/com.jenkins_docker_app folder

## add jar filename in pom.xml to generate jar with given filename in build tag
<finalName>jenkins-docker-app</finalName>

## steps for Jenkins

# install jenkins from official site

# run the setup, also set the port here we set as 9191
# you can find the path for jenkins.xml and set --httpPort

# need to login with user and password. default 'admin' 
# password will find from initAdminPassword file.

# run the jenkins 

## steps for configuring project 

# you need to install below plugin
CloudBees Docker Custom Build Environment Plugin
Docker API Plugin
Docker Commons Plugin
docker-build-step

Git client plugin
GitHub API Plugin

Pipeline: Basic Steps
Pipeline Jobs

etc...

Note: you can find manage Jenkins  ->  plugin -> Available Plugin

# follow below steps
Add new job/pipeline

Enter the name of job/pipeline
select pipeline
add project description
add github repository url

poll SCM add below to schedule build 1 minute
* * * * *

select pipeline -> pipeline script

in script we can have below code

pipeline {
    agent any
    tools {
    maven '3.9.8'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/dipeshP7/jenkins-docker-app.git']]])
                bat 'mvn clean install'
            }
        }
        stage('build Docker image') {
            steps {
                script {
                    def jarFile = 'target/jenkins-docker-app.jar'
                    if (fileExists(jarFile)) {
                        echo "JAR file found: ${jarFile}"
                        bat "docker build -t jenkins-docker-app ."
                    } else {
                        error "JAR file not found: ${jarFile}"
                    }
                }
            }
        }
        stage('run container') {
            steps {
                script {
                    bat 'docker run -d -p 8080:8080 jenkins-docker-app'
                }
            }
        }
    }
}

## for maven '3.9.8' you need to add it in tools option of jenkins manage configure

## to get checkout script you can do following
# use pipeline syntax option below pipeline script
# select checkout : option
# add git repository url
# generate pipeline script

## Generate docker image using jenkins pipeline 

    bat "docker build -t jenkins-docker-app ."
this code will create image as bat using for windows
# make sure you have docker-desktop installed.

# to run the container 

    bat 'docker run -d -p 8080:8080 jenkins-docker-app'
above line can run the container


# note jenkins use groovy language. 

# following source, we have used for this project
https://www.youtube.com/watch?v=ZLaSuxzO1po

















