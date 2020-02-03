pipeline {
    agent any
    parameters {
        //Default value for task only!!
        string(defaultValue: 'https://github.com/Hramatskiu/jenkins-task.git', description: '', name: 'gitRepository')
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