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
                    '''

                    }
                       
            }
            }       

        stage('Backend Build') {

            steps {
             
               

                dir ('server') {
                    sh '''
                    docker build . -t registryemretechstarter.azurecr.io/javaapp
                    '''

                    }
                       
            }
            }     

        stage('Frontend Build') {

            steps {
             
               

                dir ('client') {
                    sh '''
                    docker build . -t registryemretechstarter.azurecr.io/angularapp

                    '''

                    }
                       
            }
            }       


       stage('Backend Push') {

            steps {
             
               
                withCredentials([string(credentialsId: 'docker-admin', variable: 'dockeradmin')]) {

                    dir ('server') {
                        sh '''
                        docker login registryemretechstarter.azurecr.io  -u registryEmreTechstarter -p  $dockeradmin
                        docker push registryemretechstarter.azurecr.io/javaapp
                        '''
                        }
                }        
                       
            }
            }     


        stage('Frontend Push') {

            steps {
             
               
                withCredentials([string(credentialsId: 'docker-admin', variable: 'dockeradmin')]) {

                    dir ('client') {
                        sh '''
                            docker login registryemretechstarter.azurecr.io  -u registryEmreTechstarter -p  $dockeradmin
                            docker push registryemretechstarter.azurecr.io/angularapp
                        '''

                        }
                }    
                       
            }
            }     






        }


         
           
}
