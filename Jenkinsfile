pipeline {
    agent any

    stages {
        stage('Hello') {
  
            steps {
                bat '''
                cds terraform
                terraform init
                '''
            }
        }
    }
}
