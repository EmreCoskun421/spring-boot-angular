pipeline {
    agent any

    stages {
        stage('Hello') {
  
            steps {
                withCredentials([file(credentialsId: 'TF-PROVIDER', variable: 'TF')]) {
                    dir ('terraform') {
                        bat 'use $FTF'
                        bat '''
                   
                        terraform init
                        terraform plan
                        '''
                    }
            }
            }
        }
    }
}
