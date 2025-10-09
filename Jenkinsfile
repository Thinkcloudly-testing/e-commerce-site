pipeline {
    agent any
    tools { nodejs "node16" }

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

        stage('Deploy to EC2') {
            steps {
                sshagent (credentials: ['ec2-key']) {  // <- your Jenkins credentials ID for the PEM key
                    sh '''
                    scp -o StrictHostKeyChecking=no -r ./build ubuntu@ec2-3-140-192-13.us-east-2.compute.amazonaws.com:/home/ubuntu/app
                    ssh -o StrictHostKeyChecking=no ubuntu@ec2-3-140-192-13.us-east-2.compute.amazonaws.com "cd /home/ubuntu/app && pm2 delete ecommerce || true && pm2 serve ./ 3000 --name ecommerce"
                    '''
                }
            }
        }
    }
}
