pipeline {
    agent any
    tools {
    maven 'Maven'
}

    environment {
        SONARQUBE_URL = 'http://localhost:9000'
        SONARQUBE_AUTH = 'squ_9e0867ba59e770c8886747cb84d0252f92eb6d91'
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

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=myapp -Dsonar.host.url=$SONARQUBE_URL -Dsonar.login=$SONARQUBE_AUTH'
                }
            }
        }

        stage('Quality Gate Check') {
            steps {
                timeout(time: 1, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
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
