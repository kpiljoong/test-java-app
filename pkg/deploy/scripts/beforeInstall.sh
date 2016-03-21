mkdir -p /tmp/oldapps/

if [ -f /var/lib/tomcat7/webapps/ROOT.war ];
then
    mv /var/lib/tomcat7/webapps/ROOT.war /tmp/oldapps/ROOT-$(date +%s).war
fi

