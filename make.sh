#!/bin/sh
BUILD_ID=dontKillMe
echo "build $1:$2"
version=v$2
if test  'master' != $1
then
  version="$1-v$2"
fi
echo $version
docker build -t g4m-jenkins:${version} .
echo `docker images -a| grep g4m-jenkins | grep ${version} | awk '{print $3}' `
docker login --username=郝森伟 registry-vpc.cn-beijing.aliyuncs.com -p hao189108
docker tag `docker images -a| grep g4m-jenkins | grep ${version} | awk '{print $3}' ` registry-vpc.cn-beijing.aliyuncs.com/haosenwei/g4m-jenkins:${version}
docker push registry-vpc.cn-beijing.aliyuncs.com/haosenwei/g4m-jenkins:${version}
