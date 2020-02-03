@echo off
ECHO -------------------------------------------------JENKINS PIPELINE JOB----------------------------------------------
set OUT_LOG_LOCATION=logs/out.txt
set ERR_LOG_LOCATION=logs/err.txt
ECHO Starting airflow container
docker run --name jenkins -p 48080:8080 -p 50000:50000 -d jenkins/jenkins:lts
ECHO Copying cmd and task_lib folders on cluster
docker exec -ti jenkins /bin/cat /var/jenkins_home/secrets/initialAdminPassword
docker cp Jenkinsfile jenkins:/ >> %OUT_LOG_LOCATION% 2>> %ERR_LOG_LOCATION%
docker cp task_lib sandbox-hdp:/ >> %OUT_LOG_LOCATION% 2>> %ERR_LOG_LOCATION%
docker cp airflow-cmd airflow:/ >> %OUT_LOG_LOCATION% 2>> %ERR_LOG_LOCATION%
docker exec -ti -u root airflow /bin/chmod -R 777 /airflow-cmd
ECHO Wait for a minute until airflow is starting
ping 127.0.0.1 -n 60 > nul
ECHO Starting script execution
docker exec -ti airflow /bin/bash /airflow-cmd/add-connection.sh >> %OUT_LOG_LOCATION% 2>> %ERR_LOG_LOCATION%
docker exec -ti airflow /bin/bash /airflow-cmd/start-airflow-dag.sh >> %OUT_LOG_LOCATION% 2>> %ERR_LOG_LOCATION%
ECHO Cleanup cluster
docker rm -f jenkins
PAUSE