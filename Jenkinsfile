pipeline {
    agent any


    stages {
        stage('Cloud Setup') {

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
   stages {
        stage('WM Setup') {

            steps {
             


                dir ('Ansible') {
                    sh '''
                        
                   ansible --version

                    '''

                    }
                }
            }
         
        }    
}
