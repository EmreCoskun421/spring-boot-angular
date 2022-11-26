pipeline {
    agent any


    stages {
        stage('Hello') {

            steps {
                withCredentials([ file(credentialsId: '	provider', variable: 'provider')]){
                    sh " cp \"${provider}\" \"terraform/provider.tf\" "
                    sh "cat terraform/provider.tf"

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
