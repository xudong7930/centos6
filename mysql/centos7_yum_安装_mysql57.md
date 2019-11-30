centos7_yum_安装_mysql5.6
========================

# 1.查询是否安装mysql
pkill -9 mysqld
rpm -qa|grep -i mysql

<!-- 依次删除mysql包 -->
yum -y remove mysql-community-client

<!-- 卸载不用的依赖 -->
rpm -ev

# 2.开始安装
cd /usr/local/src/
wget http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm
rpm -ivh mysql57-community-release-el7-8.noarch.rpm
yum -y install mysql-server

## 默认文件路径
配置文件：/etc/my.cnf
日志文件：/var/log/var/log/mysqld.log
服务启动脚本：/usr/lib/systemd/system/mysqld.service
Socket文件：/var/run/mysqld/mysqld.pid 

# 3.启动服务,并修改密码
service mysqld restart

<!-- 找到mysql初始密码 -->
grep "password" /var/log/mysqld.log 

<!-- 登录MYSQL -->
mysql -u root -p

<!-- 修改密码 -->
alter user 'root'@'localhost' identified by 'Root!!2018';flush privileges;

