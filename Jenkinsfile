pipeline {
    agent any

    stages {
        stage('Hello') {
  
            steps {
                withCredentials([file(credentialsId: 'TF-PROVIDER', variable: 'TF')]) {
                    echo "${env.TF}"
                    dir ('terraform') {
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
