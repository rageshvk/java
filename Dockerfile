FROM tomcat:9.0

WORKDIR /usr/local/tomcat/webapps/

COPY /home/ubuntu/jenkins1/workspace/java/target/*.war ROOT.war

EXPOSE 8090

CMD ["catalina.sh", "run"]


