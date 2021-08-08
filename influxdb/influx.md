# influx


## 官网文档

> 英文文档: https://docs.influxdata.com/influxdb/v1.7/

> 中文文档: https://jasper-zhang1.gitbooks.io/influxdb/content/

## docker运行influx

```shell
#  for 2.0
docker run -d -p 8086:8086 --name influxdb2 -v /d/docker/influxdb2:/var/lib/influxdb2 influxdb:2.0

# for 1.7
docker run -d -p 8086:8086 --name influxdb -v /d/docker/influxdb:/var/lib/influxdb influxdb:1.7.11
```

## 命令行操作

进入交互shell, rfc3339格式:YYYY-MM-DDTHH:MM:SS.nnnnnnnnnZ
> influx -precision rfc3339

> influx -precision rfc3339 -database jdm

用户管理
```
#列出用户
show users

#创建一个管理员账户
create user "admin" with password '123456' with all privileges

#创建一个普通用户
create user "test" with password '123456'

#查看用户授权
show grants for test

#用户授权/取消授权: all, read, write
grant all privileges to admin
revoke all privileges from admin

# 授权vultr上read权限给test用户
grant read on vultr to test
revoke read on vultr from test

#修改密码
set password for "test" = 'abcd1234'

#删除
drop user "test"

```

数据库操作:
```shell
#查看DB
show databases

#创建DB
create database vultr 

#选择DB
use mydb 

#删除DB
drop database mydb
```

表measurment操作
```shell
#查看表
show measurements

#查看表数据, 默认的rp叫autogen
# select * from table_name1
# select * from db_name.table_name
# select * from db_name.retention_policy_name.table_name
# select * from NOAA_water_database.autogen.h2o_feet;

select * from "h2o_feet" order by time desc limit 1000;
select "time", "location", "water_level" from "h2o_feet" limit 1000;

#指定字段类型
select "level description"::field,"location"::tag,"water_level"::field from "h2o_feet"

# where条件: =, !=, >=, <=
##时间
SELECT * FROM "h2o_feet" WHERE time = '2016-07-31T20:07:00Z' OR time = '2016-07-31T23:07:17Z'
SELECT * FROM "h2o_feet" WHERE time > now() - 7d

##能计算
SELECT * FROM "h2o_feet" WHERE "water_level" + 2 > 11.9

# group by条件
SELECT MEAN("index") FROM "h2o_quality" GROUP BY location,randtag

# 时间单位: s, m, h, d, w;  fill(100|none|null|linear|previous)
SELECT COUNT("water_level") FROM "h2o_feet" GROUP BY time(12m) fill(0)


# into语法,将查询结果写入另一个表中


```

drop series from "measurment" where tag=tag_value


# 查看所有表

delete from measurment_name where tag=tag_value
delete from time < '2016-01-01'
drop measurment measurement_name


# shard
drop shard shard_id

# rp
drop retention policy rp_name on db_name


# 插入数据
# measurement是cpu, 
# tag是host和region, 
# field是value和value2, 
# 纳秒级别时间（可忽略）是1465839830100400200, 范围从1677-09-21T 00:12:43.145224194Z to 2262-04-11T23：47：16.854775806Z
insert cpu,host=vultr,region=us_la value=2.32,value2=0.17  1465839830100400200  

# 查看数据
select "host", "region", "value" from "cpu"
```




## 数据类型

1.浮点数(默认)
weather,location=shenzhen_luohu temperature=27.12

2.整数(加i表示整数存储)
class_sort,location=sz_shcoole value=32i

3.字符串
mobile,region=beijing value="iphone12 mini"

4.布尔值(true|false)
workplace,location=ibc_mall signed=true


## 数据采样(CQ)和保留策略(RP)

- 数据采样(CQ): 在数据库内部自动周期性跑着的一个InfluxQL的查询
- 保留策略(RP): influxdb比较cq查询的时间戳和本地时间戳，删除比rps中设置的duration更老的数据。一个数据库可以有多个rps, 但每个rps唯一



```shell

# 创建一个rp策略
# 策略名称：two_hours
# duration(过期时间): 2h 
# default表示作为food_data库的默认RP
# replication 表示复制分片,默认1
# default 表示作为默认RP
create retention poliy "two_hours" on "food_data" duration 2h replication 1 default

# 列出数据库的RP策略
show retention polices on db_name

# 创建一个cq采样
# cq_30m表示采样名称
# food_data表示作用的数据库
# mean函数表示平均值
# a_year表示RP策略名称
# down_orders表示table
# orders表示取数据库名称
# time(30m) 表示每隔30分钟跑一次之前30分钟的查询

create continues query "cq_30m" on "food_data" begin
  select mean("website") as "mean_website", mean("phone") as "mean_phone" into "a_year"."down_orders" from "orders" group by time(30m)
end

``` 


# 配置文件
- 配置文件路径
/etc/influxdb/influxdb.conf

- 配置文件启动
influxd -config /etc/influxdb/influxdb.conf


```
# 确保这些目录可写
[meta]
  dir = "/var/lib/influxdb/meta"   

[data]
  dir = "/var/lib/influxdb/data"   
  engine = "tsm1"
  wal-dir = "/var/lib/influxdb/wal"
```



[root@iZwz9b6lp6hgmpqkuxv3e4Z stock]# ./stock
2021/06/29 13:40:48 getExchange
2021/06/29 13:40:48 influx Connection...
2021/06/29 13:40:48 CREATE RETENTION POLICY "15_day" ON "jdm" DURATION 15d REPLICATION 1 
2021/06/29 13:40:48 Post "http://127.0.0.1:8086/query?db=jdm&params=null&q=CREATE+RETENTION+POLICY+%2215_day%22+ON+%22jdm%22+DURATION+15d+REPLICATION+1+": dial tcp 127.0.0.1:8086: connect: connection refused
2021/06/29 13:40:48 DROP CONTINUOUS QUERY "RT_PD_1m" ON "jdm"
2021/06/29 13:40:48 Post "http://127.0.0.1:8086/query?db=jdm&params=null&q=DROP+CONTINUOUS+QUERY+%22RT_PD_1m%22+ON+%22jdm%22": dial tcp 127.0.0.1:8086: connect: connection refused

2021/06/29 13:40:48 CREATE CONTINUOUS QUERY "RT_PD_1m" ON "jdm" RESAMPLE EVERY 2s FOR 4m  BEGIN SELECT  first(last) as open,last(last) as close,last(buy) as buy,last(sell) as sell,max(last) as high,min(last) as low , sum(volume) as volume  INTO "1m_RT_PD" FROM "15_day"."1s_RT_PD" GROUP BY time(1m),* END
2021/06/29 13:40:48 Post "http://127.0.0.1:8086/query?db=jdm&params=null&q=CREATE+CONTINUOUS+QUERY+%22RT_PD_1m%22+ON+%22jdm%22+RESAMPLE+EVERY+2s+FOR+4m++BEGIN+SELECT++first%28last%29+as+open%2Clast%28last%29+as+close%2Clast%28buy%29+as+buy%2Clast%28sell%29+as+sell%2Cmax%28last%29+as+high%2Cmin%28last%29+as+low+%2C+sum%28volume%29+as+volume++INTO+%221m_RT_PD%22+FROM+%2215_day%22.%221s_RT_PD%22+GROUP+BY+time%281m%29%2C%2A+END": dial tcp 127.0.0.1:8086: connect: connection refused
[root@iZwz9b6lp6hgmpqkuxv3e4Z stock]# 