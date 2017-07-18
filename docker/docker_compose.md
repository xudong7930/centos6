docker compose
==============

Define and run multi-container applications with Docker.
[Docker Compose项目](https://github.com/docker/compose)

## 安装
```bash
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod a+x /usr/local/bin/docker-compose
```

## 常用命令
确保目录下有docker-compose.yml文件

* docker-compose up --scale web=2 redis=3 '创建和启动容器'
* docker-compose version '查看版本'
* docker-compose ps '列出所有的容器'
* docker-compose top '查看服务中每个容器的进程'
* docker-compose logs "yml文件中的服务名称"  "查看指定服务所在容器的日志"
* docker-compose start|stop|restart|kill|down '服务的start|stop|restart'
* docker-compose pause|unpause '暂停和取消暂停容器服务'
* docker-compose images '列出yml文件中用到的image'
* docker-compose exec 'yml文件中的服务名称' sh '在指定服务的容器中执行命令'
* docker-compose events 'yml文件中的服务名称' "实时接收来自容器的事件"
* docker-compose create 'yml文件中的服务名称' "仅创建指定的服务"
* docker-compose config "验证和查看yml文件的正确性"
* docker-compose build "构建or重新构建服务"
