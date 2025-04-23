pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/your-username/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("your-image-name")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-creds', url: '']) {
                    script {
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage('Deploy to Environment') {
            steps {
                echo "Deployment step here"
                // e.g., docker run -d your-image-name
            }
        }
    }
}
