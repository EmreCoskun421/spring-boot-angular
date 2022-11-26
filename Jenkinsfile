pipeline {
    agent any


    stages {
        stage('Hello') {

            steps {

              
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
