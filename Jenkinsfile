pipeline {
    agent any

    stages {
        stage('Hello') {
            agent {
                docker { image 'maven:3.8.1-adoptopenjdk-11' }
            }            
            steps {
                bat '''
                mvn -version
                '''
            }
        }
    }
}
