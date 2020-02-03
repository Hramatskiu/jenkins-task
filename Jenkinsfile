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
                rtMavenRun (
                    tool: 'maven-3', // Tool name from Jenkins configuration
                    pom: 'spark-wf-task/pom.xml',
                    goals: 'clean package -DskipTests',
                    deployerId: "MAVEN_DEPLOYER",
                    resolverId: "MAVEN_RESOLVER"
                )
             }
        }
    }
}