pipeline {
    agent any

    stages {
        stage('Hello') {
  
            steps {
                withCredentials([file(credentialsId: 'TF-PROVIDER', variable: 'TF-PROVIDER')]) {
                    dir ('terraform') {
                        bat "use $TF-PROVIDER"
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
