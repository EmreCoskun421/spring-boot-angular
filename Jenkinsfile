pipeline {
    agent any

    stages {
        stage('Hello') {
  
            steps {
                withCredentials([file(credentialsId: 'TF-PROVIDER', variable: 'TF-PROVIDER')]) {
                    echo "This is the directory of the secret file ${TF-PROVIDER}"
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
