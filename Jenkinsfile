pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sagar-rathod-devops/jenkins-docker-deploy.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t python-http-server .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Stop old container and run new one
                sh '''
                    docker rm -f python-http-container || true
                    docker run -d --name python-http-container -p 8000:8000 python-http-server
                '''
            }
        }
    }
}
