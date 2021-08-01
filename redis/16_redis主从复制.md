# redis主从复制

redis的主从复制，是指将一台redis服务器的数据,复制到其它redis服务器,前者称为master，后者称为slaver。数据的复制是单向的，只能从主节点到从节点。master以写为主，slave以读为主。

默认每台redis都是主节点；一个主节点可以有多个从节点，一个从节点只能有一个主节点。

主从复制的优点：
  1.数据备份
  2.故障恢复
  3.负载均衡
  4.高可用

单台redis服务器最大内存不应该超过20G, redis内存推荐最大为物理内存的3/4


## 环境配置

命令行配置：

```bash
# 查看redis的角色
127.0.0.1:6379> info replication
# Replication
role:master #当前角色
connected_slaves:0  #从机数量
master_replid:71c67d31db2209260938d7231c8fc503d0b7cb82
master_replid2:0000000000000000000000000000000000000000
master_repl_offset:0
second_repl_offset:-1
repl_backlog_active:0
repl_backlog_size:1048576
repl_backlog_first_byte_offset:0
repl_backlog_histlen:0


# 在slave从机上设置
127.0.0.1:6379> slaveof 172.17.0.2 6379
OK

127.0.0.1:6379> info replication
# Replication
role:slave  #当前角色
master_host:172.17.0.2  #主机角色信息
master_port:6379
master_link_status:up
master_last_io_seconds_ago:9
master_sync_in_progress:0
slave_repl_offset:56
slave_priority:100
slave_read_only:1
connected_slaves:0
master_replid:b4d8d1330f2f3ad9fe4eb3e28cf24379b0b0c0e2
master_replid2:0000000000000000000000000000000000000000
master_repl_offset:56
second_repl_offset:-1
repl_backlog_active:1
repl_backlog_size:1048576
repl_backlog_first_byte_offset:1
repl_backlog_histlen:56


# 从机不能写入
127.0.0.1:6379> set c d
(error) READONLY You can't write against a read only replica.


```


配置文件配置：
  见14_redis.conf_配置文件详解.conf 274行左右



主机断开连接，从机不能写入，能读取，主机重新连接，从机继续连接。

slave从机重启后的数据复制过程 ：
  slave启动成功连接到master后发送sync命令。
  master收到sync命令，后台启动进程，收集所有接收的用于修改数据集的命令，完成后，master传送整个数据文件到slave，完成一次全部同步。


如果主机断开连接，使用slaveof no one 让自己变成主机（master），其它节点手动连接到这个主节点。


# sentinel(哨兵模式)

当主服务器宕机后，需要手动把一台服务器切换为主服务器，这就需要人工干预，费时实力，redis从2.8开始支持sentinel（哨兵模式）架构来解决此问题。

sentinel后台自动监控主机是否故障，如果故障了就自动投票决定主机（master）。
sentinel是一个独立的进程独立运行。原理是哨兵通过发送命令，等待redis服务器的响应，从而监控运行的多个redis实例。


配置sentinel

> 1.在redis.conf同级目录创建sentinel.conf文件
```bash
# sentinel monitor master_name master_host masert_port flag-bit
# 1-有2个sentinel统一认为master节点失联，那么就认为master节点失联了
sentinel monitor app_redis 127.0.0.1 6379 1

#监听端口
port 26379

#工作目录
dir /tmp

# 如果配置文件启用密码 requirepass foobar
# sentinel auth-pass master_name password
sentinel auth-pass app_redis 123456

# 指定多少秒master主节点无响应，则sentinel认为主机已失联,默认30秒
sentinel down-after-milliseconds app_redis 30000

# 指定发生failover（故障转移）时，同时多少个slave对master进行同步,默认是1
sentinel parallel-syncs app_redis 1

# 指定故障转移超时时间,默认3分钟
sentinel failover-timeout app_redis 180000

# 指定发送警告，错误等时执行的通知脚本
# sentinel notification-script app_redis /var/redis/notify.sh

# 指定主节点发生改变的时候，执行的脚本
# master_name, role, state, from_ip, from_port to_ip, to_port这些参数将传递给reconfig.sh脚本
# sentinel client-reconfig-script app_redis /var/redis/reconfig.sh

```

> 2.启动：
```bash
redis-sentinel sentinel.conf
```

优点：
1.哨兵集群，基于主从复制，主从复制的优点都有
2.主从可自动切换，故障转移，提高可用性

缺点：
1.集群容量达到一定上线，就补方便在线扩展
2.实现sentinel模式的配置比较麻烦，里面选择很多

