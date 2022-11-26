pipeline {
    agent any


    stages {
        stage('Hello') {

            steps {
                withCredentials([ file(credentialsId: '	provider', variable: 'provider')]){
              
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
