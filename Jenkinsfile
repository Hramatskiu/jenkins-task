pipeline {
    agent any
    parameters {
        string(defaultValue: '', description: '', name: 'gitRepository')
    }
    tools {
        maven 'maven-3'
    }
    stages {
        stage ('Clone') {
            steps {
                git branch: 'master', url: "${params.gitRepository}"
            }
        }

        stage ('Build without tests') {
            steps {
                sh "mvn clean package -DskipTests"
             }
        }

        stage ('Run tests') {
            steps {
                sh "mvn test"
             }
        }
    }
}