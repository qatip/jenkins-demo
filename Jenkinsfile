pipeline {
    agent any
    environment {
        AWS_CREDENTIALS_ID = ('aws-creds') // Use your Jenkins AWS credentials ID
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
                withAWS(credentials: "${AWS_CREDENTIALS_ID}") {
                    sh 'terraform init'
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
