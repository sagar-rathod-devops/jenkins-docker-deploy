pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning GitHub repository...'
                git branch: 'main', url: 'https://github.com/sagar-rathod-devops/jenkins-docker-deploy.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image from repo files...'
                sh 'docker build -t html-server .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container on port 8000...'
                // Stop previous container if running
                sh 'docker rm -f html-container || true'
                // Run new container
                sh 'docker run -d -p 8000:8000 --name html-container html-server'
            }
        }
    }

    post {
        success {
            echo 'App is running at http://localhost:8000'
        }
        failure {
            echo 'Build failed. Check logs.'
        }
    }
}
