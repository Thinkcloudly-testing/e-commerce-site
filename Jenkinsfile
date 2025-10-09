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
        sshagent (credentials: ['ec2-key']) {
            sh '''
            # Copy build folder to EC2
            scp -o StrictHostKeyChecking=no -r build ubuntu@ec2-3-140-192-13.us-east-2.compute.amazonaws.com:/home/ubuntu/app

            # SSH into EC2 and run with sudo + pm2 force restart
            ssh -o StrictHostKeyChecking=no ubuntu@ec2-3-140-192-13.us-east-2.compute.amazonaws.com "
                sudo npm install -g serve pm2 &&
                pm2 delete ecommerce || true &&
                pm2 serve /home/ubuntu/app 3000 --name ecommerce -f
            "
            '''
                }
            }
        }
    }
}
