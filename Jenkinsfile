pipeline {
    agent any
    parameters {
        //Default value for task only!!
        string(defaultValue: 'https://github.com/Hramatskiu/spark-wf-task.git', description: 'Git repository with project', name: 'gitRepository')
        string(defaultValue: 'maven-3', description: 'Git repository with project', name: 'mavenTool')
    }
    stages {
        stage ('Clone') {
            steps {
                git branch: 'master', url: "${params.gitRepository}"
            }
        }

        stage ('Build without tests') {
            tools {
                maven "${params.mavenTool}"
            }
            steps {
                sh "mvn clean package -DskipTests"
             }
        }

        stage ('Run tests') {
            tools {
                maven "${params.mavenTool}"
            }
            steps {
                sh "mvn test"
             }
        }
    }
}