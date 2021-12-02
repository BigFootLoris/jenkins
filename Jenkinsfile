pipeline {
    agent {
        docker { image 'docker:20.10.11-dind' }
    }
    stages {
        stage('build') {
            steps {
                sh 'docker --version'
            }
        }
    }
}