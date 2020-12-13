redis命令行:
===========

#shell命令行
redis-cli -h 127.0.0.1 -p 6379 -a 123456

#redis命令行
ping 连通性测试
shutdown 关闭服务端
select 1 选择数据库[0-15]


# 
redis: 单线程+多路IO复用
memcahce:多线程+锁
阻塞IO: 给妹纸发送一个消息，说我来找你了，然后一直等待对方下楼，这期间除了等待不做其他事情
非阻塞IO: 给妹纸发消息，如果不回，则继续发，一直发到对方下楼，这期间除了发消息不做其他事情
IO多路复用: 请大妈帮你监视下楼的妹纸，这期间你可以做其它的事情。多路复用包括: select, poll, epoll
	select: 每个妹纸下楼都，大妈都一个个询问，最多一次询问1024个人
	poll: 不限制询问人数，每个下楼的女生大妈都会去询问
	epoll: 不限制询问人数，也不一个个去询问，将每个进入大楼的女生贴上标签，只要妹纸下楼，大妈就知道并且通知你

# 数据类型:
key + string 最多512M数据
key + list
key + set
key + zset
key + hash


# key的操作
keys * 所有键
exists <key>
type <key>
del <key>
get <key>
expire <key> <second> -1不过 -2已过期
ttl <key>  
dbsize 当前库key的数量
flushdb 清空当前库的所有key
flushall 清空所有库的所有key

# string类型数据操作
get <key> 查询key对应的值
set <key> <value> 添加键值对
append <key> <value> 追加
strlen <key> 值的长度
setnx <key> key不存在设置值
incre <key> 加1
decre <key> 减1
increby <key> <步长> 
decreby <key> <步长>
mset <key1> <value1> <key2> <value2>	
mget <key1> <key2>
msetnx <key1> <value1> <key2> <value2>




















