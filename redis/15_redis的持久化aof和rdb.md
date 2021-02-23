# redis的持久化

# rdb(redis database)
在指定的时间间隔内将内存中的数据集快照写入磁盘，恢复的时候将快照文件直接读到内存里。

过程：单独fork一个子进程，将内存内容写入临时rdb文件，待持久化结束了，在用临时文件替换上次持久化完成的文件。

rdb保存的文件是 dump.rdb

恢复rdb文件：将dump.rdb文件复制到redis启动目录即可

```bash
#查看dump.rdb保存目录
127.0.0.1:6379> config get dir
1) "dir"
2) "/data" #如果这个目录存在dump.rdb文件，启动时会自动恢复其中的数据
```

优点：
 1.适合大规模数据的恢复。
 2.对数据的完整性要求不高

缺点：
  1.需要一定的时间间隔进程操作，如果redis意外当机，这个最后一次修改的数据就没有了
  2.fork进程时会占用一定的内存空间


## aof(append only file)

将所有的命令都记录下来，恢复的时候就将文件中命令都执行一遍。

aof保存的文件是 appendonly.aof

启用aof: redis.conf中改appendonly yes,重启redis

```bash
# aof文件修复
redis-check-aof --fix appendonly.aof

```

优点：
  1.每次修改都同步，文件完整性更好
  2.每秒同步一次，可能丢失1秒都数据
  3.从不同步，效率最高！

缺点：
  1.比较数据文件，aof文件远大于rdb,修复速度也比rdb慢
  2.aof运行效率比rdb慢,所以redis默认使用rdb