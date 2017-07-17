# FROM: 所有Dockerfile都必须以FROM命令开始。 FROM命令会指定镜像基于哪个基础镜像创建，接下来的命令也会基于这个基础镜像
FROM nginx

# MAINTAINER: 设置该镜像的作者
MAINTAINER "xudong7930<xudong7930@gmail.com>"

## WORKDIR: 指定容器中RUN、CMD与ENTRYPOINT命令的工作目录, 较少使用
# WORKDIR /tmp

# ARG: 指定构建Image的参数
ARG TIME_ZONE="Asia/Shanghai"

# ENV: 设置环境变量
ENV VERSION="1.0" DEBUG=ON TZ=${TIME_ZONE}

# RUN: 在基础镜像中执行的命令
# 方式1: RUN <一长串的shell命令>
# 方式2: RUN ["deploy.sh", "参数1", "参数2"...]
RUN "apt-get install gcc gcc-c++ cmake autoconf && echo $TZ"

## ENTRYPOINT: 类似RUN的功能. Dockerfile只允许使用一次ENTRYPOINT指令。 使用多个ENTRYPOINT会抵消之前所有的指令，只有最后一个指令生效
# 如下: 使用ENTRYPOINT后, docker run webapp -i, -i参数将会传递给curl命令
# docker run laradock_redis redis, redis参数将会传递进去,可以使用$0,$1接收此参数
ENTRYPOINT ['curl', "-s", "http://ip.cn"]

## COPY: 文件复制, 从Dockerfile所在的目录复制到镜像中
COPY nginx.conf /etc/nginx/conf/nginx.conf

## ADD: 文件复制,如果是压缩文件,则自动解压到镜像中
ADD nginx.conf /etc/nginx/conf/nginx.conf2

## VOLUME: 匿名卷挂载, 在 Dockerfile 中，我们可以事先指定某些目录挂载为匿名卷，这 样在运行时如果用户不指定挂载，其应用也可以正常运行，不会向容器存储层写入 大量数据
VOLUME ["/data/mysql"]

## USER: 指定容器中的当前用户, 比如安装完软件后,使用root用户启动软件,那么此时就需要USER指令
USER root

## CMD: 容器启动的时候在容器内执行的命令. Dockerfile只允许使用一次CMD指令。 使用多个CMD会抵消之前所有的指令，只有最后一个指令生效
# 方式1: CMD <一长串的shell命令>
# 方式2: CMD ["nginx", "-g", "daemon off;"]
CMD echo $HOME

## EXPOSE: 声明该容器打开了哪些端口
EXPOSE 80 443

# 构建镜像: docker build -t "nginx:v2" .
