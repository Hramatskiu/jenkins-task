pipeline {
    agent any
    parameters {
        //Default value for task only!!
        string(defaultValue: 'https://github.com/Hramatskiu/spark-wf-task.git', description: '', name: 'gitRepository')
        string(defaultValue: 'maven-3', description: '', name: 'mavenTool')
    }
    tools {
        maven '${params.mavenTool}'
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