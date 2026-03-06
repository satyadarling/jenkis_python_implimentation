pipeline {
    agent any

    environment {
        SERVER_IP = "YOUR_SERVER_IP"
        SERVER_USER = "YOUR_USER"
        IMAGE_NAME = "satyaallumolu8/dockerrep:latest"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sshagent(['Docker-connection']) {
                    bat """
                    ssh %SERVER_USER%@%SERVER_IP% "
                    rm -rf jenkins_project &&
                    git clone https://github.com/satyadarling/jenkis_python_implimentation.git &&
                    cd jenkis_python_implimentation &&
                    docker build -t %IMAGE_NAME% .
                    "
                    """
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sshagent(['Docker-connection']) {
                    bat """
                    ssh %SERVER_USER%@%SERVER_IP% "
                    docker push %IMAGE_NAME%
                    "
                    """
                }
            }
        }

    }
}
