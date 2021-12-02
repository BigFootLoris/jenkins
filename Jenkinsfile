pipeline {
    environment {
        registryCredential = 'DOCKERHUB_TOKEN'
    }
    agent any
    stages {
        stage('docker version') {
            steps {
                sh 'docker --version'
            }
        }
        stage('build') {
            steps {
                script {
                    def customImage = docker.build("bigfootloris/docker:${env.BUILD_ID}")
                }           
            }
        }
        stage('push') {
            when {
                branch "main"
            }

            steps {
                script {
                    docker.withRegistry('', 'DOCKERHUB_TOKEN')
                    dockerImage.push("bigfootloris/docker:${env.BUILD_ID}")
                }
            }
        }
    }
}