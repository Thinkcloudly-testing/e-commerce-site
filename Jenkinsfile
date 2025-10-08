pipeline {
    agent any
    tools { nodejs "node16" }   // <-- this tells Jenkins to use NodeJS tool you configured in Global Tools

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
