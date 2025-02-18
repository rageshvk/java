FROM tomcat:9.0

WORKDIR /usr/local/tomcat/webapps/

COPY target/*.war ROOT.war

EXPOSE 8090

CMD ["catalina.sh", "run"]


