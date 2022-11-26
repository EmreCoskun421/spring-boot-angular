pipeline {
    agent any


    stages {
        stage('Hello') {
            // agent {
            //     docker { image 'hashicorp/terraform:1.3.5' }
            // }  
            steps {
                sh '''
                 apt-get update
                 apt install apt-transport-https ca-certificates curl software-properties-common  -y
                '''
              
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
