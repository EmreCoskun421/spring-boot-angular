pipeline {
    agent any

    stages {
        stage('Hello') {
  
            steps {
                bat '''
                cd terraform
                terraform init
                '''
            }
        }
    }
}
