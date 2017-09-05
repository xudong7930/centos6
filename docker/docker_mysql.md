docker mysql
====================

## make dir
mkdir -p /usr/local/mysqldb/my.cnf
mkdir -p /usr/local/mysqldb/logs
mkdir -p /usr/local/mysqldb/data

## download docker mysql image.
docker pull mysql:latest

## create mysql
docker run -d --rm -p 30021:3306 -v /usr/local/mysqldb/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysqlnd mysql 

## stop mysql
docker start|stop|restart mysqlnd
