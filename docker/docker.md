Docker
======



### 安装

```shell
# 安装
curl -sSL https://get.docker.com/ | sh

#服务的启动，停止，重启
systemctl start docker.service
systemctl stop docker.service
```



运行一个nginx

> docker run -d --rm -p 80:80 --name webserver nginx "运行一个webserver"  
> docker stop webserver "停止webserver"  
> docker rm webserver "删除webserver"  



### 镜像Image

* docker search centos "搜索镜像"
* docker pull centos:lastst "下载最新Ubuntu"    
* docker run -it centos bash "启用Bash交互式操作"  
* docker exec -it centos bash "执行bash命令进行交互操作"
* docker images "列出已下载的镜像"
* docker images -a "列出所有镜像,包括中间层镜像"
* docker images -f dangling=true "列出`由于新旧镜像同名，旧镜像名称被取消，从而出现仓库名、标签 均为 <none> 的镜像`"
* docker rmi $(docker images -q -f dangling=true) "删除<none>的镜像"
* docker rmi $(docker images -q) "删除所有的镜像"
* docker rmi image_id|image_name  "删除镜像的标签,当没有标签指向这个镜像的时候,则删除镜像"



对镜像进行修改和提交(docker commit)

```shell
# 1.创建一个容器
docker run -d -p 80:80 --name webserver nginx

# 2.进入容器的shell交互
docker exec -it webserver bash 

# 3.对容器进行修改
echo 'hi,docker' > /usr/share/nginx/html/index.html

# 4.退出容器
exit

# 5.查看你对镜像的修改
docker diff webserver

# 6.提交你的修改,保存为新的镜像
# docker commit --author author_name --message commit_message container_name tag_name:tag_version
docker commit --author "xudong7930" --message "修改了首页" webserver nginx:v2 

# 7.查看镜像发现有新的镜像
docker images

# 8.查看镜像的修改历史
docker history nginx:v2

# 9.运行新的镜像
docker run --name webserver2 --rm -d -p 81:80 nginx:v2
```




### 使用Dockerfile定制镜像, 实例
* mkdir mynginx && cd mynginx  "创建项目目录"
* touch Dockerfile 添加如下内容:  

```bash
    FROM nginx
    RUN echo 'hello, docker' > /usr/share/nginx/html/index.html
```

> docker build -t nginx:v3 . ".表示上下文"  
> docker build https://github.com/twang2218/gitlab-ce-zh.git#:8.14 "从git中构建"  
> docker build http://server/context.tar.gz "从压缩包中构建"  
> cat Dockerfile | docker build - "从Dockerfile构建"  


## 从文件中构建镜像
> docker import http://download.openvz.org/template/precreated/ubuntu-14.04-x86_64-minimal.tar.gz  
> docker save alpine | gzip/bzip2 > alpine-latest.tar.gz "保存指定的镜像为压缩文件"  
> docker load -i alpine-latest.tar.gz "从文件中导入镜像"  



其它操作

```shell
# 创建一个指向source_image的新的tag
docker tag source_image:tag target_image:tag


```







### 容器Container

> docker ps "查看正在运行的容器"  
> docker ps -a "所有容器"  
> docker ps -l "最新创建的容器"  
> docker create -v /app/nginx:/etc/nginx --name webapp nginx "创建一个容器 "
> docker run -it ubuntu:14.04 /bin/bash "在容器里运行ubuntu,并进入bash, -it是交互"  
> docekr run -d ubuntu "后台运行容器"  
> docker start|stop|restart 容器名称  
> docker stop $(docker ps -a -q)"停止所有的容器"  
> docker export conatainer_id | gzip > ubuntu.tar.gz "导出容器"  
> cat ubuntu.tar.gz | docker import - xudong7930/ubuntu:v2 "导入容器"  
> docker import http://domain.com/ubuntu.tar.gz xudong7930/ubuntu:v2  
> docker rm conatainer_id "删除容器"  
> docker rm -f conatainer_id "强制删除容器"  
> docker rm $(docker ps -a -q)"清理所有容器"



进入容器	

```shell
# 方式1：进入容器后开启一个新的终端（常用）
docker exec -it container_name /bin/bash
# 方式2: 进入正在执行的终端,不开启新的进程
docker attach container_name
```



退出容器

```shell
# 方式1: 在容器中
exit

# 方式2: 快捷方式
ctrl + p + q

```



主机和容器的文件拷贝(无需容器启动)

```shell
#方式1：容器中的文件 拷贝到 主机
docker cp container_name:/usr/share/nginx/html/index.html ./

#方式2: 主机文件 拷贝到 容器
docker cp ./file.zip container_name:/root/ 
```



容器相关的命令:

```shell
# 暂停,取消暂停容器
docker pause|unpause container_name

# 查看容器运行的进程
docker top container_name

#显示活动容器的资源占用状态
docker stats

# 查看docker版本
docker version

# 查看docker统计信息
docker info

# 查看容器详情
docker inspect container_name

# 显示指定容器的端口映射
docker port container_name

# 容器重命名
docker rename old_container_name new_container_name
```





## Docker Hub仓库

* https://hub.docker.com xudong7930/abc123 "账号密码"
* docker login "登录到DockerHub"
* docker logout "退出登录"
* docker search centos "搜索镜像"
* docker pull centos "下载镜像到本地"


## 数据管理
> docker inspect 容器名称 "查看容器的详细信息"
> docker run -d -P --name webserver -v /src/webapp:/var/www/webapp -v /app/ngxin/conf:/etc/nginx/conf/ xudong7930/webserver "运行web服务器,并且挂载本地的/src/webapp目录到服务器/var/www/webshop目录"
> docker run -d -v /dbdata --name dbdata xudong7930/dbserver "创建一个数据库容器"
> docker run -d --volumes-from dbdata --name app1 xudong7930/webapp "创建一个app使用dbdata的数据卷"


# Docker网络
> docker run -d -p 8080:80 xudong7930/webapp "应用内部端口80映射到8080"  
> docker port  container_name "查看端口映射配置"  
> docker logs -f image_name "查看应用的日志"  

## 容器互联
> docker run -d --name db xudong7930/msyql "数据库"  
> docker run -d -P --name webapp --link db:alias_db xudong7930/webapp "定义容器的名称, 和db容器互联, db:alias_db是 name:alias, 在webapp中可以使用alias_db这个别名通讯"  
> docker inspect container "查看容器信息"  



