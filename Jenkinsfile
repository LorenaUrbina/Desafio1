pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    dir("terraform") {
                        git "https://github.com/LorenaUrbina/Desafio1.git"
                    }
                }
            }
        }

        stage('Plan') {
            steps {
                dir("terraform") {
                    script {
                        sh '''
                            terraform init
                            terraform plan -out=tfplan
                            terraform show -no-color tfplan > tfplan.txt
                        '''
                    }
                }
            }
        }

        stage('Apply') {
            steps {
                dir("terraform") {
                    sh 'terraform apply -input=false tfplan'
                }
            }
        }
    }
}
