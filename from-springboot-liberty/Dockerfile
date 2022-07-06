FROM websphere-liberty:22.0.0.6-kernel-java8-ibmjava

EXPOSE 9090

MAINTAINER Akhil Gupta

COPY target/audit-api-v1-0.0.1.jar /opt/ibm/wlp/usr/servers/defaultServer/apps/app.jar

COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/server.xml

WORKDIR /opt/ibm/wlp

RUN ["bin/installUtility", "install", "defaultServer"]

ENTRYPOINT ["bin/server","run","defaultServer"]