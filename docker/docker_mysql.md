docker mysql
====================

## make dir
mkdir -p /usr/local/mysqldb/conf.d
mkdir -p /usr/local/mysqldb/data
touch /usr/local/mysqldb/conf.d/my.cnf

## download docker mysql image.
docker pull mysql:latest

## create mysql 
* docker run -d -p 3306:3306 --name mysqlnd -v /usr/local/somedocker/mysql/conf.d:/etc/mysql/conf.d -v /usr/local/somedocker/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=a4z9s8i7 mysql:latest

## stop mysql
docker start|stop|restart mysqlnd
