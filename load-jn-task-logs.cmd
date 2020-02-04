@echo off
ECHO Loading pipeline logs delete jenkins container
docker exec -ti jenkins /bin/bash /cmd/cp-logs.sh
docker cp jenkins:/cmd/j_logs/ ./
PAUSE