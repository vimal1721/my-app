FROM tomcat:9.0
COPY /target/myapp-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
