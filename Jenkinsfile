pipeline {
    agent any
    stages {
        stage ('Clone') {
            steps {
                git branch: 'master', url: "https://github.com/Hramatskiu/spark-wf-task.git"
            }
        }

        stage ('Exec Maven') {
            steps {
                sh "mvn clean package -DskipTests"
             }
        }
    }
}