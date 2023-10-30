 pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Test') {
            steps {
                script {
                    def appName = 'my-vite-react-app'
                    def dockerImage = "$appName:latest"
                    
                    // Build Vite (React) application
                    sh "npm install"
                    sh "npm run build"
                    
                    // Build Docker image
                    docker.build(dockerImage, "--build-arg VITE_APP_NAME=$appName .")
                    
                    // Run tests (if applicable)
                    // sh "npm test"
                }
            }
        }

        stage('Dockerize and Publish') {
            steps {
                script {
                    def dockerImage = 'my-vite-react-app:latest'
                    def dockerHubCredentials = credentials('docker-hub-credentials')

                    // Push Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', dockerHubCredentials) {
                        docker.image(dockerImage).push()
                    }
                }
            }
        }
    }
}
