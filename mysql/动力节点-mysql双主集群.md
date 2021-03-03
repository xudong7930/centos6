# mysql集群——双主集群

4个mysql主机3006（主）, 3007（主）, 3308（从3306）, 3309（从3307）

## 在3306主机上配置(172.17.0.5)

my.cnf配置
```ini
server-id=3306
log-bin=mysql-bin
log-err=mysql-err
read-only=0

#主键自增步长
auto_increment_increment=2
#主键自增初始值
auto_increment_offset=1
#从master读取二进制日志文件是否记录
log-slave-updates
#事务提交几次后同步二进制日志文件，默认0由系统决定
sync_binlog=1

#忽略的数据库
binlog-ignore-db=mysql
binlog-ignore-db=information_schema
binlog-ignore-db=performance_schema
```

```sql
-- 创建同步账号
grant replication slave on *.* to `sync_user`@`%` identified by '123456';

flush privileges;

show master status;

-- 重置master到初始状态
reset master; 

-- 指定master
change master to master_host="172.17.0.4", master_user="sync_user",master_password="123456", master_port=3306, master_log_file="mysqlbin.000001", master_log_pos=120;
```


## 在3307主机上配置(172.17.0.4)

```ini
server-id=3307
log-bin=mysql-bin
log-err=mysql-err
read-only=0

#主键自增步长
auto_increment_increment=2
#主键自增初始值
auto_increment_offset=2
#从master读取二进制日志文件是否记录
log-slave-updates
#事务提交几次后同步二进制日志文件，默认0由系统决定
sync_binlog=1

#忽略的数据库
binlog-ignore-db=mysql
binlog-ignore-db=information_schema
binlog-ignore-db=performance_schema
```


```sql
-- 创建同步账号
grant replication slave on *.* to `sync_user`@`%` identified by '123456';

flush privileges;

show master status;

-- 重置master到初始状态
reset master; 

-- 指定master
change master to master_host="172.17.0.5", master_user="sync_user",master_password="123456", master_port=3306, master_log_file="mysqlbin.000002", master_log_pos=120;

```


## 在3308上(172.17.0.2)

my.cnf配置文件
```ini
server-id=3308
log-bin=mysql-bin
log-err=mysql-err
read-only=1
```

```sql
stop slave;
reset slave;

-- 指定master
change master to master_host="172.17.0.5", master_user="sync_user",master_password="123456", master_port=3306, master_log_file="mysqlbin.000002", master_log_pos=120;

start slave;

show slave status\G

```


## 在3309上(172.17.0.3)

my.cnf配置文件
```ini
server-id=3309
log-bin=mysql-bin
log-err=mysql-err
read-only=1
```

```sql
-- 指定master
change master to master_host="172.17.0.4", master_user="sync_user",master_password="123456", master_port=3306, master_log_file="mysqlbin.000001", master_log_pos=120;

reset slave;
start slave;

show slave status\G
```



## 测试
1.在3306上创建数据库，表，插入数据，在其它上查看是否同步

2.在3307上创建数据库，表，插入数据，在其它上查看是否同步

3.关闭3307，在3306上，创建数据库，表，插入数据，在其它上查看是否同步