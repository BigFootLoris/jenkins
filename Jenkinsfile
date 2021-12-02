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
        stage('build') {
            steps {
                sh 'docker build -t bigfootloris/docker:20.10.8'
                }
            }
        }
    }
}