#!/bin/sh
BUILD_ID=dontKillMe
echo "build $1:$2"
version=v$2
if test  'master' != $1
then
  version="$1-v$2"
fi
echo $version

docker login --username=郝森伟 registry.cn-beijing.aliyuncs.com -p hao189108

docker build -t g4m-tomcat:${version} .
echo `docker images -a| grep g4m-tomcat | grep ${version} | awk '{print $3}' `

docker tag g4m-tomcat:${version} registry.cn-beijing.aliyuncs.com/haosenwei/g4m-tomcat:${version}
docker push registry.cn-beijing.aliyuncs.com/haosenwei/g4m-tomcat:${version}

docker tag g4m-tomcat:${version} registry.cn-beijing.aliyuncs.com/haosenwei/g4m-tomcat:latest
docker push registry.cn-beijing.aliyuncs.com/haosenwei/g4m-tomcat:latest
