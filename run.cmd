@echo off
ECHO -------------------------------------------------JENKINS PIPELINE JOB----------------------------------------------
set OUT_LOG_LOCATION=logs/out.txt
set ERR_LOG_LOCATION=logs/err.txt
ECHO Starting airflow container
docker run --name jenkins -p 48080:8080 -p 50000:50000 -d jenkins/jenkins:lts >> %OUT_LOG_LOCATION% 2>> %ERR_LOG_LOCATION%
ECHO Use this password to login as admin:
docker exec -ti jenkins /bin/cat /var/jenkins_home/secrets/initialAdminPassword
ECHO Install default plugins and continue
PAUSE
ECHO Import pipeline
docker cp /jenkins-task/cmd jenkins:/ >> %OUT_LOG_LOCATION% 2>> %ERR_LOG_LOCATION%
docker exec -ti jenkins /bin/chmod -R 777 /cmd >> %OUT_LOG_LOCATION% 2>> %ERR_LOG_LOCATION%
docker exec -ti jenkins /bin/bash /cmd/import-job.sh >> %OUT_LOG_LOCATION% 2>> %ERR_LOG_LOCATION%
ECHO View pipeline on <DOCKER_IP>:48080/job/jn-task/
ECHO Cleanup cluster
::docker rm -f jenkins
PAUSE