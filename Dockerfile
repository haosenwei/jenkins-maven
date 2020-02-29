# using alpine-glibc instead of alpine  is mainly because JDK relies on glibc
FROM registry.cn-beijing.aliyuncs.com/haosenwei/g4m-jre8:latest
# author
MAINTAINER haosenwei
# A streamlined jre
ADD . /g4m/jenkins/

ENV MAVEN_HOME /g4m/jenkins/maven3/bin
EXPOSE 8080

# run container with base path:/opt
WORKDIR /g4m/jenkins
CMD ["sh","start.sh"]

