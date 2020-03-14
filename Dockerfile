# using alpine-glibc instead of alpine  is mainly because JDK relies on glibc
FROM registry.cn-beijing.aliyuncs.com/haosenwei/g4m-jdk:1.8
# author
MAINTAINER haosenwei
# A streamlined jre
ADD . /g4m/jenkins/
RUN apk install git
RUN cp -R /g4m/jenkins/maven3 /usr/local/bin
RUN export PATH=/usr/local/bin/maven3/bin:$PATH
RUN ln -s /usr/local/bin/maven3/bin/mvn /usr/local/bin/mvn
#RUN ls -l /usr/local/bin
RUN echo $PATH
RUN chmod a+x /usr/local/bin/mvn

EXPOSE 8080

# run container with base path:/opt
WORKDIR /g4m/jenkins
CMD ["sh","start.sh"]

