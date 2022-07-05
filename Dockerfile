FROM ibmjava:8-jre-alpine

EXPOSE 8080

MAINTAINER akhil.gupta16@wipro.com

ARG JAR_FILE=target/audit-message-producer-0.0.1-jar-with-dependencies.jar

WORKDIR /opt/app

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/opt/app/app.jar"]