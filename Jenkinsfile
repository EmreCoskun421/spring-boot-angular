pipeline {
    agent any

    stages {
        stage('Hello') {
  
            steps {
                withCredentials([file(credentialsId: 'TF-PROVIDER', variable: 'TF-PROVIDER')]) {
                bat '''
                cd terraform
                terraform init
                terraform plan
                '''
            }
            }
        }
    }
}
