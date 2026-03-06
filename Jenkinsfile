pipeline {
    agent any

    environment {
        SERVER_IP = "56.228.41.170"
        SERVER_USER = "ec2-user"
        IMAGE_NAME = "satyaallumolu8/dockerrep:latest"
        REPO = "https://github.com/satyadarling/jenkis_python_implimentation.git"
        KEY_PATH = "C:\\Users\\satya\\Downloads\\docker-Server-Key.pem"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                bat """
                ssh -i %KEY_PATH% -o StrictHostKeyChecking=no %SERVER_USER%@%SERVER_IP% ^
                "rm -rf jenkis_python_implimentation && ^
                git clone %REPO% && ^
                cd jenkis_python_implimentation && ^
                docker build -t %IMAGE_NAME% ."
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                bat """
                ssh -i %KEY_PATH% -o StrictHostKeyChecking=no %SERVER_USER%@%SERVER_IP% ^
                "docker push %IMAGE_NAME%"
                """
            }
        }

    }
}
