pipeline {
    agent any

    environment {
        SERVER_IP = "56.228.41.170"
        SERVER_USER = "ec2-user"
        IMAGE_NAME = "satyaallumolu8/dockerrep:latest"
        PEM_PATH = "C:\\Users\\satya\\Downloads\\docker-Server-Key.pem"
    }

    stages {

        stage('Prepare Server') {
            steps {
                bat """
                ssh -i %PEM_PATH% -o StrictHostKeyChecking=no %SERVER_USER%@%SERVER_IP% "sudo zypper install -y git"
                """
            }
        }

        stage('Build Docker Image') {
            steps {
                bat """
                ssh -i %PEM_PATH% -o StrictHostKeyChecking=no %SERVER_USER%@%SERVER_IP% "rm -rf jenkis_python_implimentation && git clone https://github.com/satyadarling/jenkis_python_implimentation.git && cd jenkis_python_implimentation && docker build -t %IMAGE_NAME% ."
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                bat """
                ssh -i %PEM_PATH% -o StrictHostKeyChecking=no %SERVER_USER%@%SERVER_IP% "docker push %IMAGE_NAME%"
                """
            }
        }

    }
}
