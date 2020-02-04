pipeline {
    agent any
    parameters {
        //Default value for task only!!
        string(defaultValue: 'https://github.com/Hramatskiu/spark-wf-task.git', description: 'Git repository with project', name: 'gitRepository')
        //Use error branch for build incorrect code
        string(defaultValue: 'master', description: 'Git branch for build and test', name: 'gitBranch')
        string(defaultValue: '', description: 'Maven tool for building project', name: 'mavenTool')
    }
    stages {
        stage ('Clone') {
            steps {
                git branch: '${params.gitBranch}', url: "${params.gitRepository}"
            }
        }

        stage ('Build') {
            tools {
                maven "${params.mavenTool}"
            }

            steps {
                script {
                    try {
                        sh "mvn -B -DskipTests clean package"
                        currentBuild.result = 'SUCCESS'
                    }
                    //No error raising, just handling
                    catch (Exception e) {
                        echo "Build failed"
                        currentBuild.result = 'FAILURE'
                    }
                }
             }
        }

        stage ('Test') {
            tools {
                maven "${params.mavenTool}"
            }

            when {
              expression {
                currentBuild.result == 'SUCCESS'
              }
            }

            steps {
                sh "mvn test"
            }

            post {
                success {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
}