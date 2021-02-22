# zset类型详解

在set的基础上，增加了一个值, 
  SET: set k1 v1;  
  ZSET: zset k1 score1 v1

```
# 添加一个有序集合
127.0.0.1:6379> zadd salary 6000 ergou 
(integer) 1
127.0.0.1:6379> zadd salary 45000 sbsjw
(integer) 1
127.0.0.1:6379> zadd salary 9800 teddy   # 有序集合添加值
(integer) 1


# 查看集合所有元素
127.0.0.1:6379> zrange salary 0 -1 withscores
127.0.0.1:6379> zrange salary 0 -1

127.0.0.1:6379> zrevrange salary 0 -1 withscores  # 降序排列
1) "sbsjw"
2) "45000"
3) "sbjsw"
4) "5000"
5) "huergou"
6) "5000"


# 查询元素个数
127.0.0.1:6379> zcard salary  
(integer) 3


# 按得分排序
127.0.0.1:6379> zrangebyscore salary -inf +inf  # 有序集合按值获取
1) "ergou" // 6000
2) "teddy" // 45000
3) "sbsjw" // 98000


127.0.0.1:6379> zrangebyscore salary -inf +inf withscores  # 有序集合按值获取，并显示值
1) "ergou"
2) "6000"
3) "teddy"
4) "9800"
5) "sbsjw"
6) "45000"


# 小于8000得分的集合
127.0.0.1:6379> zrangebyscore salary -inf 8000  
1) "ergou"



#移除有序集合中的指定值
127.0.0.1:6379> zrem salary ergou teddy sbjsw  
(integer) 2
127.0.0.1:6379> zrange salary 0 -1
1) "sbsjw"


#指定得分范围内数量
127.0.0.1:6379> zcount salary 0 6000  
(integer) 2

```

> zset的应用场景
班机成绩表
工资表排序
消息权重