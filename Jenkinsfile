pipeline {
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
    }
}