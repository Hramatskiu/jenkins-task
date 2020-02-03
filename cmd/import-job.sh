PASSWORD=${cat /var/jenkins_home/secrets/initialAdminPassword}
curl -s -XPOST 'http://localhost:8080/createItem?name=jn-task' -u admin:$PASSWORD --data-binary @task.xml -H "Content-Type:text/xml"