pipeline {
    agent any

    environment {
        IMAGE_NAME = "python-http-server"
        CONTAINER_NAME = "python-http-container"
        PORT = "8000"
        DOCKERFILE_DIR = "." // Adjust if Dockerfile is in a subfolder
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/sagar-rathod-devops/jenkins-docker-deploy.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}"
                sh "docker build -t ${IMAGE_NAME} ${DOCKERFILE_DIR}"
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Removing existing container if any..."
                sh "docker rm -f ${CONTAINER_NAME} || true"

                echo "Running new Docker container..."
                sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:${PORT} ${IMAGE_NAME}"
            }
        }

        // Optional: Uncomment this stage if you want to deploy to Kubernetes via `kubectl`
        
        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes cluster...'
                sh '''
                    kubectl apply -f deployment.yaml
                    kubectl apply -f service.yaml
                '''
            }
        }
        
    }

    post {
        success {
            echo '✅ Deployment completed successfully!'
        }
        failure {
            echo '❌ Deployment failed. Check the logs.'
        }
    }
}
