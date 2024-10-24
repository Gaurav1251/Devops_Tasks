pipeline {
    
     agent any

    stages {
        stage('Code-Checkout') {
            steps {
              git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Gaurav1251/Insure_me'
            }
        }
        
        stage('Code-Build') {
            steps {
               sh 'mvn clean package'
            }
        }
        
        stage('Containerize the application'){
            steps { 
               echo 'Creating Docker image'
               sh "docker build -t insure ."
            }
        }
        stage('Deploy'){
            
            steps {
                sh 'docker run -d -p 8089:8081 insure'
            }
        }
            
        
    
   }
}

