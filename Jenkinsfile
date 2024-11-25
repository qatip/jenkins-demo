pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-credentials') // Use your Jenkins AWS credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-credentials')
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
                sh 'terraform init'
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
