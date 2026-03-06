pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                credentialsId: 'github-creds',
                url: 'https://github.com/satyadarling/jenkis_python_implimentation.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'pip install pytest selenium webdriver-manager pytest-html'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'pytest pages/test_e2e_flow.py --html=report.html'
            }
        }

    }
}
