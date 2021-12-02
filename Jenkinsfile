pipeline {
    agent {
        docker { image 'docker:20.10.11-dind' }
    }
    stages {
        stage('version') {
            steps {
                sh 'docker --version'
            }
        stage('build') {
            steps {
                docker {
                    image 'docker:20.10.11-dind'
                }
            }
        }
    }
}