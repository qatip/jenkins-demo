pipeline {
    agent any
    environment {
        AWS_CREDENTIALS_ID = 'aws_creds' // Replace with the ID of your AWS credentials in Jenkins
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/qatip/testrepo.git'
            }
        }
        stage('Install Terraform') {
            steps {
                sh '''
                wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
                unzip -o terraform_1.5.6_linux_amd64.zip
                sudo mv terraform /usr/local/bin/
                terraform --version
                '''
            }
        }
        stage('Terraform Init') {
            steps {
                withAWS(credentials: AWS_CREDENTIALS_ID, region: 'us-west-1') {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                withAWS(credentials: AWS_CREDENTIALS_ID, region: 'us-west-1') {
                    sh 'terraform plan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                withAWS(credentials: AWS_CREDENTIALS_ID, region: 'us-west-1') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
