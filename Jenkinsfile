pipeline {
    agent any
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
                sh '''
                terraform apply -auto-approve
                '''
            }
        }
    }
}
