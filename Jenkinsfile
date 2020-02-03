pipeline {
    agent any
    tools {
        maven 'maven-3'
    }
    stages {
        stage ('Clone') {
            steps {
                git branch: 'master', url: "https://github.com/Hramatskiu/spark-wf-task.git"
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