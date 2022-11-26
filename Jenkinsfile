pipeline {
    agent any


    stages {
        stage('Hello') {
            // agent {
            //     docker { image 'hashicorp/terraform:1.3.5' }
            // }  
            steps {
                sh '''
                sudo apt-get update
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
