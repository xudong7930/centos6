## 基本操作

```sql
# 连接数据库
mysql -u root -p123456

# 刷新权限
mysql> flush privileges;

# 查看当前库的所有表
mysql> show tables;

# 查看表结构
mysql> desc students;

# 退出sql
mysql> exit;
```


## 数据库操作

操作数据库 -> 操作表 -> 操作数据

```sql
# 显示所有数据库
mysql> show databases;


# 创建数据库
mysql> create database if not exists project_a;
Query OK, 1 row affected (0.02 sec)


# 删除数据库
mysql> drop database if exists departments;
Query OK, 0 rows affected, 1 warning (0.00 sec)


# 选择数据库
mysql> use test;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
```


## 数据库列类型

数值:
  * tinyint 十分小的数据，1个字节
  * smallint 较小的数据,2个字节
  * int 标准的数据，4个字节
  * bigint 较大的数据, 8个字节
 
  * float  浮点数，4个字节
  * double 浮点数，8个字节

  * decimal 字符串形式的浮点数（金融计算的时候使用） 


字符串：
  * char  字符串长度固定，0-255
  * varchar 可变字符串，0-65535
  * tinytext 较小的文本 2^8-1
  * text     标准的文本 2^16-1
  * longtext 较大的文本 

时间日期
  * date yyyy-mm-dd,日期
  * time hh:mm:ss,时间
  * datetime yyyy-mm-dd hh:mm:ss 时间日期
  * timestamp 时间磋，1970.1.1到现在的秒数
  * year   年份

空null：
  * 没有值，未知
  * 不要使用null进行运算

*** 字段属性 ***
  * unsigned 没有负号
  * zerofill 0填充，长度不够使用0填充
  * auto_increment     自增主键，
  * not null 非空，
  * null 可以为空
  * default 默认值
  * comment 备注


每个表应该存在的字段
  * id 表id
  * version 版本
  * is_delete 软删除
  * create_at 创建日期
  * update_at 更新日期


## 建表
```sql
# 建表语句
CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '学生名称',
  `age` int(3) NOT NULL COMMENT '学生年龄',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '学生表';


# 查看建表语句
mysql> show create table students \G;


# 表重命名
mysql> alter table projects rename as projects2;
Query OK, 0 rows affected (0.03 sec)


# 表添加字段
mysql> alter table `projects2` add email varchar(60) not null COMMENT "email";


# 表字段重命名
alter table `projects2` change `email` `email2` varchar(30);


# 表修改字段属性
alter table `projects2` modify email varchar(30) not null comment "emails";


# 删除表 
drop table if exists `projects2`;
```

InnoDB: 支持事务，数据行锁定，支持外键约束，不支持全文索引，表空间较大约2倍，安全性更高
  * 在物理路径中只有一个*.frm文件，以及上级目录下的ibdata1文件

MyISAM: 不支持事务，不支持行锁定，不支持外键约束，支持全文索引，表空间较小
  * 在物理路径中 *.frm是表结构文件 *.myd是数据文件 *.myi是索引文件




## mysql数据管理

删除含有外键约束的表，先删除引用别人的表，再删除被引用的表。

一般不使用外键

***外键***
```sql

#建表语句带有外键约束
create table if not EXISTS `students2` (
	`id` bigint(20) unsigned auto_increment not null comment "",
	`name` varchar(50) not null comment "name",
	`pwd` varchar(20) not null default '123456' COMMENT 'pwd',
	`grade_id` bigint(20) unsigned not null COMMENT "grade_id",
	PRIMARY KEY(`id`),
	KEY `fk_grade_id` (`grade_id`),
	CONSTRAINT `fk_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`)
) engine=innodb default CHARSET=utf8mb4;

#单独添加外键，需保证 外键字段类型完全一致; fk_grade_id 是外键名
alter table `students` add CONSTRAINT `fk_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`);


# 删除外键约束, fk_grade_id 是外键名
alter table `students` drop FOREIGN KEY `fk_grade_id`;
```



```sql
# 内容添加
insert into `students` (`name`, `pwd`, `grade_id`) values("sbjsw", "abc123", 1),("teddy", "123456", 2);


# 内容修改
update `students` set `pwd`='123123', `name`='sbjswxd' where `name`='sbjsw';


# 删除数据
delete from students where id > 3;


# 清空表内容
truncate students; #重新设置自增，不影响事务(innodb)
delete from students;  #自增不改变(myisam)
```

where语句：
* = >= > < <= <> != !
* btween ... and ...
* and, or
* 模糊查询：is null, is not null, like, in, 

***查询***
```sql
select * from students;
select version();
select 5+1;
select CURRENT_TIMESTAMP;

# 别名as
select `name` as `student_name` from `students` as `s`;

select concat('name: ', `name`) as `student_name` from `students`;


# 去重distinct
select DISTINCT `name` from `students`;


# grade_id+1
select `name`, `grade_id` +1 as 'new_grade' from `students`;


# 模糊查询：like %表示0到任意个字符，_表示1个字符
select * from students where name like 'teddy%' and pwd like 'abc___';

select * from students where name is not null; # is null, is not null
```

# 联合查询 inner join，left join, right join

***SQL准备***
```sql
CREATE TABLE `runoob_tbl` (
  `runoob_id` int(11) NOT NULL AUTO_INCREMENT,
  `runoob_title` varchar(100) NOT NULL,
  `runoob_author` varchar(40) NOT NULL,
  `submission_date` date DEFAULT NULL,
  PRIMARY KEY (`runoob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


INSERT INTO `runoob_tbl` VALUES ('1', '学习 PHP', '菜鸟教程', '2017-04-12'), ('2', '学习 MySQL', '菜鸟教程', '2017-04-12'), ('3', '学习 Java', 'RUNOOB.COM', '2015-05-01'), ('4', '学习 Python', 'RUNOOB.COM', '2016-03-06'), ('5', '学习 C', 'FK', '2017-04-05');


CREATE TABLE `tcount_tbl` (
  `runoob_author` varchar(255) NOT NULL DEFAULT '',
  `runoob_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
INSERT INTO `tcount_tbl` VALUES ('菜鸟教程', '10'), ('RUNOOB.COM ', '20'), ('Google', '22');

```


```sql
#内连接(join，inner join)查询, runoob_author在a表和b表均存在
select a.runoob_id, a.runoob_author, b.runoob_count from runoob_tbl as a join tcount_tbl as b on a.runoob_author = b.runoob_author;

  等价于：
select a.runoob_id, a.runoob_author, b.runoob_count from runoob_tbl as a, tcount_tbl as b where a.runoob_author = b.runoob_author;


#左连接（left join）, 读取a表的所有记录，即使a表的runoob_author在b表中不存在
select a.runoob_id, a.runoob_author, b.runoob_count from runoob_tbl as a  left join tcount_tbl as b on a.runoob_author = b.runoob_author;

#右连接（right join）, 读取b表的所有记录，即使b表的runoob_author在a表中不存在
select a.runoob_id, a.runoob_author, b.runoob_count from runoob_tbl as a  right join tcount_tbl as b on a.runoob_author = b.runoob_author;


#自连接
CREATE TABLE `category` (
  `categoryid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(10) NOT NULL COMMENT 'pid',
  `categoryname` varchar(50) NOT NULL COMMENT 'name',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
INSERT INTO `category` (`categoryid`, `pid`, `categoryname`) VALUES ('2', '1', '信息技术'),('3', '1', '软件开发'),('4', '3', '数据库'),('5', '1', '美术设计'),('6', '3', 'web开发'),('7', '5', 'ps技术'),('8', '2', '办公信息');


select a.categoryname as pname, b.categoryname as name from category as a , category as b where a.categoryid = b.pid;


#分页和排序: order by field_name asc|desc; limit start_page page_size
select * from category order by categoryid asc limit 0,3;

#子查询
select * from category where categoryid in (select pid from category where pid < 3);


#mysql的函数和常量
#数学函数
select ABS(-1);
select CEILING(2.3);
select FLOOR(2.3);
select RAND(); //返回0-1的随机数
select SIGN(10); //返回-1,0,1
select round(10.5); //四舍五入

#字符串函数
select CHAR_LENGTH('sbjsw wfjefw'); //字符串长度
select CONCAT('sb', ' ', 'jsw'); // 字符串连接
select INSERT('波士顿的气候条件等于哈尔滨', 1,3, '昆士兰'); // 字符串替换
select UPPER('sbjsw');
select LOWER('SB');
select INSTR('sbjsw', 'hh'); //判断hh是否在sbjsw字符串中
select REPLACE('sbjsw', 'jsw', 'jsn'); // 字符串替换
select SUBSTR('sbjsw', 1,2); // 字符串截取,index从1开始, 2是长度
select REVERSE('sbjsw'); //字符串反转

#时间日期
select CURRENT_DATE; //2021-02-24
select CURRENT_TIMESTAMP; //2021-02-24 10:53:12
select now(); //2021-02-24 10:53:12
select user(); //root@127.0.0.1

#聚合函数
select min(pid),max(pid),sum(pid),avg(pid) from category;
select count(pid) from category; //忽略pid是null的值
select count(*) from category; //不忽略null的值, 本质是计算行数
select count(1) from category; // 不忽略null的值, 本质是计算行数
select md5('123');

#分组和过滤: group by , having


```

# mysql 事务

事务正确执行的4个要素：
* 原子性（要么都成功，要么都失败），
* 一致性（针对一个事务操作前后的状态一致）
* 隔离性（针对多个用户同时操作，排除其它事务对本次事务的影响）
* 持久性（事务结束后数据不随着外界原因而丢失）

脏读：指一个事务读取了另一个事务未提及的数据
不可重复读：指在一个事务内读取表中的某一行数据，多次读取的结果不同。
虚读：指在一个事务内读取到了别的事务插入的数据，导致前后读取不一致。

```sql

set autocommit = 0; // 关闭自动提交

start transaction; //开始事务

insert sql;
update sql;

commit; //成功就提交
rollback; //失败就回滚

savepoint point_name; //设置一个事务保存点
rollback to savepoint point_name; //回滚到指定保存点
release savepoint point_name; //删除指定保存点

set autocommit = 1; //事务结束，开启自动提交
```


# mysql索引

mysql索引（index）是帮助mysql高效获取数据的数据结构。

* 主键索引（primary key）
  主键唯一，不重复，只能有一个
  primary key ('id'),

* 唯一索引（unique key）
  避免重复的列，多个列可以做唯一索引

* 普通索引（key/index）
  * key index

* 全文索引（fulltext)
  * 在myisam中才有
  * 用于快速查询数据


索引的原则：
* 索引不是越多越好
* 不对经常变动的数据加索引
* 小数据了不需要加索引
* 索引一般创建常用的在查询的字段上

索引的算法类型:
* btree（b树索引算法）: innodb默认类型
* hash（hash索引算法）
* fulltext(全文索引算法)
* spatial（空间索引算法）

```sql
CREATE TABLE `app_user` (
	`id` BIGINT (20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) DEFAULT '' COMMENT '用户昵称',
	`email` VARCHAR(50) NOT NULL COMMENT '用户邮箱',
	`phone` VARCHAR(20) DEFAULT '' COMMENT '手机号',
	`gender` TINYINT (4) UNSIGNED DEFAULT '0' COMMENT '性别（0：男;1:女）',
	`password` VARCHAR(100) NOT NULL COMMENT '密码',
	`age` TINYINT (4) DEFAULT '0' COMMENT '年龄',
	`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT = 'app用户表'


#创建一个函数
DELIMITER $$

CREATE FUNCTION mock_data ()
RETURNS INT
BEGIN
	DECLARE num INT DEFAULT 1000000;
	DECLARE i INT DEFAULT 0;
	WHILE i<num DO
		INSERT INTO `app_user`(`name`,`email`,`phone`,`gender`)VALUES(CONCAT('用户',i),'19224305@qq.com','123456789',FLOOR(RAND()*2));
		SET i=i+1;
	END WHILE;
	RETURN i;
END;$$

DELIMITER ;

select mock_data();





#查看表的索引
show index from category;

#添加全文索引
alter table `category` add fulltext index index_categoryname (`categoryname`);

#添加普通索引
alter table `category` add index index_categoryname (`categoryname`);

#创建普通索引
create index `index_name` on `app_user` (`name`);

#删除索引
alter table `category` drop index index_categoryname;


#索引的力量
mysql> select * from app_user where name = '99999';
1 row in set (0.81 sec)
mysql> explain select * from app_user where name = '99999'; #查询了996043行

mysql> create index `index_name` on `app_user` (`name`); #为name列创建索引，耗时7.16秒
Query OK, 0 rows affected (7.16 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from app_user where name = '99999';
1 row in set (0.00 sec)

mysql> explain select * from app_user where name = '99999'; #查询了1行
```





# mysql权限管理

```sql
# 查看所有用户
select * from mysql.user;


# 创建用户
create user `sbjsw` identified by '123456';

# 修改密码
set password for `sbjsw` = password('123123');

# 重命名
rename user `sbjsw` to `sbjxd`;

# 权限
grant all privileges on *.* to `sbjxd`;
grant all privileges on *.* to `teddy` with grant option;
flush privileges;

show grants for `sbjxd`@`%`;; #查看权限

# 撤销权限
REVOKE all PRIVILEGES on *.* from teddy;
flush PRIVILEGES;

# 删除用户
drop user `teddy`;
```




# mysql备份

备份方式：
1.拷贝data
2.手动导出数据

命令行导出: 

```bash
mysqldump -hlocalhost -uroot -p123456 test category > ./category.sql #导test库中的category表

mysqldump -hlocalhost -uroot -p123456 test category user > ./category.sql #导test库中的category,user表
```

mysql中导入:
mysql> source category.sql;

命令行中导入：
mysql -uroot -p123456 test < category.sql




# 数据库的设计

* 节省空间
* 保证数据完整
* 方便开发系统

三大范式：
https://www.cnblogs.com/wsg25/p/9615100.html

* 第1范式：原子性，保证每一列不可再拆分！
* 第2范式：满足第1范式，保证每一列只跟主键相关（每张表只做一件事情）
* 第3范式：满足第1和第2范式，保证每一列跟主键直接相关

规范性和性能的问题：
* 数据库性能更加重要
* 故意给一些表增加冗余字段（订单表-商品id）
* 故意增加一些计算列（version字段）