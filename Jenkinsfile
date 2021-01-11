pipeline {
    /* insert Declarative Pipeline here */
    agent {
        label 'nuxbuilder'
    }
    stages {
        def app     
        stage('Clone repository') {                        
            checkout scm    
        }
        stage('Build image') {            
            app = docker.build("hanserf/esp32-toolchain")    
        }
        stage('Test image') {                       
            app.inside {                 
                 sh 'echo "Tests passed"'        
            }    
        }
        stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'git') {
                app.push("${env.BUILD_NUMBER}")            
                app.push("latest")        
            }    
        }
    }
}
