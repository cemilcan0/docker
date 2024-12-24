pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'color-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout from the Git repo
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    // Running the Docker build command
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Testing can be done inside the Docker container
                    sh 'docker run --rm $DOCKER_IMAGE apt-get update'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deployment process can be done here
                    echo "Deploying the application..."
                    // Deployment tasks can be added here
                }
            }
        }
    }

    post {
        always {
            // Cleanup tasks to be performed when the pipeline finishes
            echo 'Cleaning up...'
        }
    }
}
