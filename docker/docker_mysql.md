Docker创建Mysql
====================


<!-- linxu安装 -->
```shell
#创建指定目录
mkdir -p /usr/local/mysqldb/conf.d
mkdir -p /usr/local/mysqldb/data
touch /usr/local/mysqldb/conf.d/my.cnf

# 下载mysql镜像
docker pull mysql:5.7
docker pull mysql:5.6

# 创建一个mysql容器
docker run -d -p 3307:3306 --name app_mysql57 -v /Users/xudong7930/docker_data/mysql57/conf.d:/etc/mysql/conf.d -v /Users/xudong7930/docker_data/mysql57/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7

# 停止mysql
docker stop app_mysql57
docker start app_mysql57
```

<!-- mac安装 -->
mkdir -p /Users/xd/xudong/docker/mysql/conf.d
mkdir -p /Users/xd/xudong/docker/mysql/data
touch /usr/local/mysqldb/conf.d/my.cnf

docker run -d -p 3306:3306 --name app_mysql -v /Users/xd/xudong/docker/mysql/conf.d:/etc/mysql/conf.d -v /Users/xd/xudong/docker/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:5.6

docker start app_mysql
docker stop app_mysql
