pipeline {
    agent any

    environment {
        IMAGE_NAME = 'priyadharshini06/devopsfp'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Priyadharshinis0612/devopsfp.git', credentialsId: '683aaea7-c17f-43b3-ba95-0cc123338553'
            }
        }

        // 🔁 Replaced Build Docker Image stage here
        stage('Build Docker Image') {
            agent {
                docker {
                    image 'docker:24.0.7' // Use Docker image with CLI tools
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}")
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
                echo "Deploying image: ${IMAGE_NAME}:latest"
                // Example: sh 'docker run -d --name my-app ${IMAGE_NAME}:latest'
            }
        }
    }
}
