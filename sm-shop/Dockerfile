FROM 545553504856.dkr.ecr.us-west-2.amazonaws.com/tomcat:latest

RUN SPRING_PROFILES_ACTIVE=docker

RUN rm -rf /usr/local/tomcat/webapps/*
RUN mkdir -p /usr/local/tomcat/files
COPY ./target/ROOT.war /usr/local/tomcat/webapps/ROOT.war
ADD ./SALESMANAGER.h2.db /usr/local/tomcat/
COPY ./files/ /usr/local/tomcat/files/
COPY ./codeguru-profiler-java-agent-standalone-1.2.1.jar /usr/local/
COPY ./credentials.json /usr/src/project/

RUN ls /usr/local/tomcat/files/
WORKDIR /usr/src/project




RUN apt-get update -y
RUN apt-get install jq -y
RUN AWS_ACCESS_KEY_ID="$(cat /usr/src/project/credentials.json | jq -r .access)"
RUN AWS_SECRET_ACCESS_KEY="$(cat /usr/src/project/credentials.json | jq -r .key)"


RUN chmod -R o+x /usr/local/

ENV JAVA_OPTS="-Xms1024m -Xmx1024m -XX:MaxPermSize=256m -javaagent:/usr/local/codeguru-profiler-java-agent-standalone-1.2.1.jar='profilingGroupName:shopizer,heapSummaryEnabled:true'"

CMD ["catalina.sh", "run"]

EXPOSE 8080
