PASSWORD=$(cat /var/jenkins_home/secrets/initialAdminPassword)
echo $PASSWORD
#If CRSF disabled this header is unnecessary
CRUMB=$(curl --silent --cookie-jar /tmp/cookie 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)' -u admin:$PASSWORD)
#echo $CRUMB
curl -v --cookie /tmp/cookie -H "Content-Type:text/xml" -H "$CRUMB" -XPOST 'http://localhost:8080/createItem?name=jn-task' -u admin:$PASSWORD --data-binary @/cmd/task.xml
