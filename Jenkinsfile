pipeline {
    agent any


    stages {
        stage('Hello') {

            steps {
                withCredentials([string(credentialsId: 'client_secret', variable: 'client_secret')]) {


                    dir ('terraform') {
                        sh '''
                        
                        terraform init -upgrade
                        terraform plan -var client_secret=$client_secret
                        terraform apply  -var client_secret=$client_secret   -auto-approve
                        '''

                    }
                }
            }
            }
        }
    
}
