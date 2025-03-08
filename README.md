# Maven-Tomcat-SonarQube CI/CD Pipeline

## Overview
This project automates the CI/CD pipeline for a Java web application using:
- Jenkins
- SonarQube
- Docker & Docker Compose
- Tomcat

## Prerequisites
1. Install **Jenkins, Docker, and Maven**.
2. Install required Jenkins plugins:
   - SonarQube Scanner
   - Pipeline
   - Docker Pipeline
   - Maven Integration

## Run the Application
### Start SonarQube
```sh
docker-compose up -d
