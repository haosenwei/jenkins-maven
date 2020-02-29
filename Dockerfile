# using alpine-glibc instead of alpine  is mainly because JDK relies on glibc
FROM registry.cn-beijing.aliyuncs.com/haosenwei/g4m-tomcat8:latest
# author
MAINTAINER haosenwei
# A streamlined jre
ADD jenkins.war /g4m/tomcat/

EXPOSE 8080

# run container with base path:/opt
WORKDIR /g4m/tomcat
