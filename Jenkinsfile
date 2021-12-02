pipeline {
    agent {
        docker { image 'node:14-alpine' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
        stage('docker version') {
            steps {
                sh 'docker --version'
            }
        }
    }
}