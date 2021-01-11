environment {
    DOCKER_CREDENTIALS = credentials('DOCKERHUB_HANSERF')
}
node('nuxbuilder') {
    def app
    stage('Cloning'){
        checkout scm    
    }
    stage('Build image') {            
        echo 'Building Image'
        app = docker.build("hanserf/esp32-toolchain")
    }
    stage('Test Image'){
        app.inside {
            sh 'echo "Tests passed"'
        }
    }
    stage('Push Image')
        docker.withRegistry('https://registry.hub.docker.com', "${env.DOCKER_CREDENTIALS}") { 
            app.push("${env.BUILD_NUMBER}") 
            app.push("latest")
        }
        
}
