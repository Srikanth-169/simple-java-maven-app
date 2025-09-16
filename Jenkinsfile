pipeline {
    agent any

    environment {
        IMAGE_NAME = 'myapp:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git "https://github.com/Srikanth-169/simple-java-maven-app.git"
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                docker stop myapp || true
                docker rm myapp || true
                docker run -itd -p 8081:8080 --name myapp $IMAGE_NAME
                '''
            }
        }
    }
}
