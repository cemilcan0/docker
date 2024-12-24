pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t simple-chat-app .'
            }
        }
        stage('Test') {
            steps {
                script {
                    // requests modülünü yükle
                    sh 'sudo apt-get update && sudo apt-get install -y python3 python3-pip'  // Python ve pip yükle
                    sh 'sudo pip install requests'  // requests modülünü yükle
                    // Test scriptini çalıştır
                    sh 'python3 test_script.py'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 8080:80 simple-chat-app'
            }
        }
        stage('Rollback') {
            steps {
                script {
                    try {
                        sh 'docker run -d -p 8080:80 simple-chat-app'
                    } catch (Exception e) {
                        sh 'docker stop $(docker ps -q)'
                        sh 'docker run -d -p 8080:80 stable-simple-chat-app'
                    }
                }
            }
        }
    }
}
