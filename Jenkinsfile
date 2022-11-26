pipeline {
    agent any


    stages {
        stage('Hello') {

            steps {
                withCredentials([ file(credentialsId: '	provider', variable: 'provider')]){
                    sh "rm -rf terraform/provider.tf"


                    dir ('terraform') {
                        sh " cp \"${provider}\" \"provider.tf\" "

                        sh '''
                        
                        terraform init -upgrade
                        terraform plan
                        '''

                    }
                }
            }
            }
        }
    
}
