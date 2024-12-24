pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'simple-chat-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Git repo'dan checkout yapılıyor
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    // Docker build komutu çalıştırılıyor
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Docker container'ı içinde test yapılabilir
                    sh 'docker run --rm $DOCKER_IMAGE apt-get update'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy işlemi yapılabilir
                    echo "Deploying the application..."
                    // Burada deploy işlemleri eklenebilir
                }
            }
        }
    }

    post {
        always {
            // Pipeline tamamlandığında yapılacak temizlik işlemleri
            echo 'Cleaning up...'
        }
    }
}
