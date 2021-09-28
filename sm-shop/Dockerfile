FROM public.ecr.aws/amazoncorretto/amazoncorretto:latest
COPY ./target/ROOT.war /usr/src/project/
ADD ./SALESMANAGER.h2.db /usr/src/project/
COPY ./files/ /usr/src/project/files/
COPY ./codeguru-profiler-java-agent-standalone-1.2.1.jar /usr/src/project/
WORKDIR /usr/src/project


FROM tomcat:9.0.10-jre8

RUN rm -rf /usr/local/tomcat/webapps/*
RUN mkdir -p /usr/local/tomcat/files

COPY --from=0 /usr/src/project/ROOT.war /usr/local/tomcat/webapps/ROOT.war
COPY --from=0 /usr/src/project/SALESMANAGER.h2.db /usr/local/tomcat/
COPY --from=0 /usr/src/project/files/ /usr/local/tomcat/files/
COPY --from=0 /usr/src/project/codeguru-profiler-java-agent-standalone-1.2.1.jar /usr/local/

RUN chmod -R o+x /usr/local/

ENV JAVA_OPTS="-Xmx1024m -javaagent:/usr/local/codeguru-profiler-java-agent-standalone-1.2.1.jar='profilingGroupName:shopizer,heapSummaryEnabled:true'"

CMD ["catalina.sh", "run"]


EXPOSE 8080
