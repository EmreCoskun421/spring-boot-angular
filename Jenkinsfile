pipeline {
    agent any


    stages {
        stage('Hello') {
             agent {
                 docker { image 'hashicorp/terraform' }
             }  
            steps {

              
                dir ('terraform') {
                    sh '''
                    terraform init
                    terraform plan
                    '''
                }
            }
            }
        }
    
}
