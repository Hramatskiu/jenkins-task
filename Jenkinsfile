def boolean isBuildOk = true
pipeline {
    agent any
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
                isBuildOk = maven "${params.mavenTool}"
            }
            steps {
                sh "mvn -B -DskipTests clean package"
             }
        }

        stage ('Test') {
            tools {
                maven "${params.mavenTool}"
            }
            when {
                isBuildOk == true
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