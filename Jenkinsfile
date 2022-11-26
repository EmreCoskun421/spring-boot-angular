pipeline {
    agent any


    stages {
        stage('Hello') {

            steps {
                withCredentials([ file(credentialsId: '	provider', variable: 'provider')]){
                    sh "rm -rf terraform/provider.tf"

                    sh " cp \"${provider}\" \"terraform/provider.tf\" "
                    sh " cat terraform/provider.tf"

                    dir ('terraform') {

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
