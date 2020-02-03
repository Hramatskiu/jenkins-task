PASSWORD=$(cat /var/jenkins_home/secrets/initialAdminPassword)
echo $PASSWORD
#CRUMB=$(curl --silent 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)' -u admin:$PASSWORD)
#echo $CRUMB
curl --silent -H "Content-Type:text/xml" -XPOST 'http://localhost:8080/createItem?name=jn-task' -u admin:$PASSWORD --data-binary @/cmd/task.xml