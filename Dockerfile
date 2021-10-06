FROM public.ecr.aws/amazoncorretto/amazoncorretto:latest

ADD sm-core-model/pom.xml sm-core-model/pom.xml
ADD sm-core-modules/pom.xml sm-core-modules/pom.xml
ADD sm-core/pom.xml sm-core/pom.xml
ADD sm-shop-model/pom.xml sm-shop-model/pom.xml
ADD sm-shop/pom.xml sm-shop/pom.xml

RUN yum install wget -y
RUN  wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
RUN sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
RUN yum install -y apache-maven
RUN yum install -y apache-maven

RUN  yum install jq -y

COPY pom.xml .
RUN mvn dependency:go-offline
