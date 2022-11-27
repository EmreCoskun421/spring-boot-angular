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
        stage('WM Setup') {

            steps {
             
                withCredentials([string(credentialsId: 'sudopass', variable: 'sudopass')]) {


                    dir ('Ansible') {
                        sh '''
                            
                    ansible --version
                    ansible-playbook  tools.yaml -e "ansible_become_password=$sudopass"
                        '''

                        }
                }        
            }
            }            

        stage('Backend Package') {

            steps {
             
               

                dir ('server') {
                    sh '''
                        
                    mvn clean package
                    '''

                    }
                       
            }
            }       

        stage('Frontend Package') {

            steps {
             
               

                dir ('client') {
                    sh '''
                        
                    npm install 
                    npm run build
                    cd dist
                    ls
                    dir
                    '''

                    }
                       
            }
            }       












        }


         
           
}
