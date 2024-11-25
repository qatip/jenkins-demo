pipeline {
    agent any
    environment {
        AWS_CREDENTIALS_ID = 'aws-creds' // Replace with your Jenkins AWS credentials ID
        AWS_REGION = 'us-east-1'        // Replace with your desired AWS region
    }
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        stage('Install Terraform') {
            steps {
                sh '''
                wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
                rm -f terraform
                unzip -o terraform_1.5.6_linux_amd64.zip
                sudo mv terraform /usr/local/bin/
                '''
            }
        }
        stage('Terraform Init') {
            steps {
                withAWS(credentials: "${AWS_CREDENTIALS_ID}", region: "${AWS_REGION}") {
                    sh '''
                    terraform init \
                    -backend-config="bucket=<your-s3-bucket-name>" \
                    -backend-config="key=terraform/statefile" \
                    -backend-config="region=${AWS_REGION}"
                    '''
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
