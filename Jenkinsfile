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
                 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
                 add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" 
                 apt-cache policy docker-ce -y
                 apt install docker-ce  -y
                 systemctl status docker 
                 usermod -aG docker Jenkins
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
