pipeline {
    agent any
    environment {
        IS_BUILD_OK = 'false'
    }
    parameters {
        //Default value for task only!!
        string(defaultValue: 'https://github.com/Hramatskiu/spark-wf-task.git', description: 'Git repository with project', name: 'gitRepository')
        string(defaultValue: '', description: 'Maven tool for building project', name: 'mavenTool')
    }
    stages {
        stage ('Clone') {
            steps {
                git branch: 'master', url: "${params.gitRepository}"
            }
        }

        stage ('Build') {
            tools {
                maven "${params.mavenTool}"
            }
            steps {
                sh "mvn -B -DskipTests clean package"
                env.IS_BUILD_OK = 'true'
             }
        }

        stage ('Test') {
            tools {
                maven "${params.mavenTool}"
            }
            when {
                environment name: 'IS_BUILD_OK', value: 'true'
            }

            steps {
                sh "mvn test"
            }

            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
}