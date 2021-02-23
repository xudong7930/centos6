# redis的发布订阅


redis的发布订阅是一种消息通信模式：发送者pub发送消息，订阅者sub接受消息。
redis客户端可以订阅任意数量的频道

```
# 订阅名称是c1的频道
127.0.0.1:6379> subscribe c1 
Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "c1"
3) (integer) 1

# 取消订阅
127.0.0.1:6379> unsubscribe c1 
1) "unsubscribe"
2) "c1"
3) (integer) 0

# 向c1的频道推送消息
127.0.0.1:6379> publish c1 "hello,world"
(integer) 1

```

通过subscribe命令订阅后，redis-server里维护了一个字典，字典的键就是一个个频道，字典的值则是一个链表，链表中保存链所有订阅这个channel的客户端。subscribe/unsubscribe的关键就是将客户端添加到给定channel的订阅链表中

通过publish命令向订阅者发布消息，redis-server会使用给定的频道作为key,在它维护的channel字典中查找记录链订阅这个频道的所有客户端链表,遍历这个链表，将消息发布给所有订阅者
