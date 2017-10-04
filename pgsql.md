PostgreSQL
==========

## 简介
> [PostgreSQL官网](https://www.postgresql.org/download/linux/redhat/)是一个开放源码的关系数据库管理系统（DBMS），由世界各地的志愿者队伍开发。 PostgreSQL是不控制任何公司或其他私人实体和源代码是免费提供的

## 安装

```bash
- 安装相关软件
yum -y install readline readline-devel zlib zlib-devel

- 创建用户
useradd -s /sbin/nologin -d /usr/local/pgsql postgres

- 下载解压
wget https://ftp.postgresql.org/pub/source/v9.6.2/postgresql-9.6.2.tar.gz
tar -zfx postgresql-9.6.2.tar.gz
cd postgresql-9.6.2
./configure --prefix=/usr/local/pgsql
make && make install

- 安装第三方工具代码
cd contrib && make && make install

- 数据库目录
mkdir /usr/local/pgsql/data
mkdir /usr/local/pgsql/log

chown postgres:postgres /usr/local/pgsql/data
chown postgres:postgres /usr/local/pgsql/log

- 初始化数据库
su - postgres -c "/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data"

- 启动脚本
chmod +x contrib/start-scripts/linux
cp contrib/start-scripts/linux /usr/local/pgsql/pgsql
/usr/local/pgsql/pgsql start
```

## 允许远程访问
vim /usr/local/pgsql/data/pg_hba.conf
> 在文件的最下方加上下面的这句话  
> host    all         all         0.0.0.0/0             trust

vim /usr/local/pgsql/data/postgresql.conf 
> 修改为如下：  
> listen_addresses = '*' 

重启pgsql

## 设置pgsql的密码
远程配置:
> host    all         all         0.0.0.0/0             md5     

SQL:   
> alter user postgres with password 'new password';
