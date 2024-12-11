FROM maven:latest as build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:8.0.20-jre8
COPY --from=build /app/target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
CMD ["catalina.sh", "run"]
