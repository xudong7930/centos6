Docker创建Mysql
====================

```shell
#创建指定目录
mkdir -p /usr/local/mysqldb/conf.d
mkdir -p /usr/local/mysqldb/data
touch /usr/local/mysqldb/conf.d/my.cnf

# 下载mysql镜像
docker pull mysql:latest

# 创建一个mysql容器
docker run -d -p 3306:3306 --name mysqlnd -v /usr/local/somedocker/mysql/conf.d:/etc/mysql/conf.d -v /usr/local/somedocker/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7

# 停止mysql
docker stop mysqlnd
```