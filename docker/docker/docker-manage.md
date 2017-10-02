Docker Cluster Manage
=====================

## container


## image    
docker image ls "列出所有的镜像"
docker image inspect nginx "查看指定镜像的详情"
docker image history nginx "查看指定镜像的历史"
docker image build . "使用Dockerfile构建镜像"
docker image save nginx -o nginx.tar.gz "导出指定的镜像"
docker image load -i nginx.tar.gz  "从压缩文件中导入镜像"
docker image prune "删除prune镜像"
docker image pull nginx:1.9.1 "下载指定的镜像"
docker image push xudong7930/anothernginx "将指定的镜像推送到dockerhub上"
docker image rm nginx "删除镜像"
docker image tag source_image:tag target_image:tag "创建一个指向source_image的新的tag"

## network  


## plugin   


## secret   


## service  


## system   


## volume   



## stack
* docker stack deploy -c docker-compose.yml stackname "部署一个新的stack, 执行前先执行: docker swarm init"
* docker stack ls "列出所有的stack"
* docekr stack ps stackname
* docker stac rm stackname
* docker stack services getstartedlab "列出stack中包含的service"


## swarm 集群管理
* docker swarm init --advertise-addr='192.168.99.100:2377' "启用集群管理模式,将本机作为manager, 2377用于加入集群使用"
* docker swarm join --token oidweoruourqwoeu 192.168.99.100:2377 "将本机加入swarm集群"
* docker swarm leave "离开当前的集群节点"
* docker swarm join-token manager "查看加入manager的token"


## node 节点
* docker node ls "列出所有的节点"
* docker node inspect default "查看一个节点的具体信息"
* docker node ps default "查看指定节点的运行的任务"
* docker node rm default "移除节点worker"
* docker node update default "更新一个节点"
