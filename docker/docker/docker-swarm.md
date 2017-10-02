Docker Swarm
============

Swarm: a Docker-native clustering system
[Docker Swarm](https://github.com/docker/swarm)

## 常用命令 
* docker run --rm swarm -v "查看swarm版本"

#2个端口:
> Port 7946 TCP/UDP for container network discovery.  
> Port 4789 UDP for the container ingress network.  

# 搭建集群
manager: webapp1 192.168.99.100
node1: webapp2 192.168.99.102

## manger
> docker swarm init --advertise-addr 192.168.99.100 "创建一个swarm manager"
> docker info
> docker node ls "只能在manager上查看集群节点"

## node1
> docker swarm join --token SWMTKN-1-2v8gpz3nutg63gr9t92botvyag41j2654yrd26bx0vouevkmff-44fuz7t6ps7oa20bcrvn0nmsx 192.168.99.100:2377 "将node1加入manager集群"


# 部署集群服务

## manager
helloworld:
> docker service create --replicas 1 --name hellword alpine ping docker.com
> docker service ls "列出部署的服务"
> docker service inspect --pretty helloword "查看服务的信息"
> docker service ps helloword
> docker service scale helloword=5 "复制5个服务, 使用docker service ps helloword发现服务部署在不同的机子上了"
> docker service rm helloword "删除服务"

创建3个redis:
> docker service create --replicas 3 --name redis --update-delay 10s redis:3.0.6
> docker service update --image redis:3.2.9 redis "更新redis"
> docker service update --availability drain webapp2 "将分部在webapp2上的redis服务暂停下,由其他的节点部署,同时该节点不再进行任务部署"
> docker service update --availability active webapp2 "激活改节点,使其能够进行任务部署"


Nginx:

* docker service create --name myweb --publish 8080:80 --replicas 2 nginx



