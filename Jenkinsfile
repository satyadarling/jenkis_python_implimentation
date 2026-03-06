pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git credentialsId: 'github-creds',
                url: 'https://github.com/satyadarling/jenkis_python_implimentation.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'pip install pytest selenium webdriver-manager'
            }
        }

        stage('Execute Test Script') {
            steps {
                bat 'pytest pages/test_e2e_flow.py'
            }
        }

    }
}
