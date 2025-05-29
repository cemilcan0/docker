pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'color-app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'docker run --rm $DOCKER_IMAGE apt-get update'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deploying the application..."
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
    }
}
