FROM tomcat:9.0
COPY /var/lib/jenkins/workspace/MyApp/target/myapp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
