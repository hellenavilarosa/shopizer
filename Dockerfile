FROM public.ecr.aws/amazoncorretto/amazoncorretto:latest

ADD sm-core-model/pom.xml sm-core-model/pom.xml
ADD sm-core-modules/pom.xml sm-core-modules/pom.xml
ADD sm-core/pom.xml sm-core/pom.xml
ADD sm-shop-model/pom.xml sm-shop-model/pom.xml
ADD sm-shop/pom.xml sm-shop/pom.xml

RUN yum install wget -y
RUN wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
RUN sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
RUN yum install -y apache-maven
RUN yum install -y apache-maven
RUN yum install jq -y
RUN yum install unzip -y

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

COPY pom.xml .
RUN mvn dependency:go-offline
