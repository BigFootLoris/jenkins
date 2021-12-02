pipeline {
    agent {
        docker { image 'docker:20.10.11-dind' }
    }
    stages {
        stage('docker version') {
            steps {
                sh 'docker --version'
            }
        }
        stage('docker build') {
            steps {
                echo 'Start build docker image'

                script {
                    def customImage = docker.build("my-image:docker:20.10.11-dind")
                    customImage.push()
                }
            }
        }
    }
}