# redis基本的数据操作

要么同时成功，要么同时失败，具有原子性！

redis单条命令保证原子性，但是redis事务不保证原子性！

redis事务的本质：一组命令的集合！事务执行过程中，按照顺序执行!
一次性，顺序性，排它性（执行过程中不受其它影响）

所有的命令在事务中，并没有直接被执行，只有发起执行命令的时候才会执行

> redis的事务：

* 开启事务(multi)
* 命令入队列()
* 执行事务(exec)


```bash
# 实例1
127.0.0.1:6379> multi  #开启事务
OK
127.0.0.1:6379> set k1 v1 #一系列的命令
QUEUED
127.0.0.1:6379> set k2 v2 #一系列的命令
QUEUED
127.0.0.1:6379> get k2 #一系列的命令
QUEUED
127.0.0.1:6379> exec  #执行队列中的命令,执行后本次事务也没了
1) OK
2) OK
3) "v2"


# 实例2
127.0.0.1:6379> multi
OK
127.0.0.1:6379> set k1 v1
QUEUED
127.0.0.1:6379> set k2 v2
QUEUED
127.0.0.1:6379> set k3 v3
QUEUED
127.0.0.1:6379> discard  #取消事务，队列中的错误不会执行
OK
127.0.0.1:6379> get k3
(nil)
```


> 编译形错误（代码有错误，命令有问题），事务中的所有命令不会被执行
```bash
127.0.0.1:6379> multi
OK
127.0.0.1:6379> set k1 v1
QUEUED
127.0.0.1:6379> set k2 v2
QUEUED
127.0.0.1:6379> get k1 k2  #命令有错误
(error) ERR wrong number of arguments for 'get' command
127.0.0.1:6379> set k3 v3
QUEUED
127.0.0.1:6379> exec  #执行事务也会报错
(error) EXECABORT Transaction discarded because of previous errors.
127.0.0.1:6379> get k3 #队列中的其它命令不会被执行
(nil)
127.0.0.1:6379> get k1
(nil)
```


> 运行时异常，如果队列中存在语法错误（5/0），那执行的时候,其它的命令可以继续执行
```
127.0.0.1:6379> multi
OK
127.0.0.1:6379> set k1 "v1"
QUEUED
127.0.0.1:6379> incr k1  #k1自增报错，不影响后边的命令执行
QUEUED
127.0.0.1:6379> get k1
QUEUED
127.0.0.1:6379> set k2 v2
QUEUED
127.0.0.1:6379> exec
1) OK
2) (error) ERR value is not an integer or out of range
3) "v1"
4) OK
127.0.0.1:6379> get k1  #能获取
"v1"
127.0.0.1:6379> get k2 #能获取
"v2"
```