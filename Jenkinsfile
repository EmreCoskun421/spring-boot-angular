pipeline {
    agent any

    stages {
        stage('Hello') {
  
            steps {
                withCredentials([file(credentialsId: 'TF-PROVIDER', variable: 'TF-PROVIDER')]) {
                    echo "${env.TF-PROVIDER}"
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
