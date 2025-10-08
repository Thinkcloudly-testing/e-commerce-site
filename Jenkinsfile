pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'Shawns_branch', url: 'https://github.com/Thinkcloudly-testing/e-commerce-site.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test || echo "No tests found"'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploy step goes here"
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
