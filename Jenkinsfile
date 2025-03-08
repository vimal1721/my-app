pipeline {
    agent any
    tools {
    maven 'Maven'
}

    environment {
        SONARQUBE_URL = 'http://172.22.192.181:9000'
        SONARQUBE_AUTH = 'squ_cd935e4074945d343cbb7c40fd34fe4b2169c009'
        DOCKER_IMAGE = 'myapp'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
            git branch: 'main', 
                credentialsId: '0d368b67-8c74-4f51-90ac-df6cd2b8c37a', 
                url: 'git@github.com:vimal1721/my-app.git'
        }
        }

        
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
            }
        }

        stage('Deploy Using Docker Compose') {
            steps {
                sh 'docker-compose down || true'
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! Application is running on http://localhost:8080/myapp'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
