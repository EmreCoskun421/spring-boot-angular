pipeline {
    agent any


    stages {
        stage('Hello') {

            steps {
                withCredentials([ file(credentialsId: '	provider', variable: 'provider')]){


                    dir ('terraform') {
                        sh "rm -rf terraform/provider.tf"
                        sh " mv \"${provider.tf}\" \"provider.tf\" "
                        sh "ls && dir"
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
