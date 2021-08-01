# 尚硅谷-mysql高级


```sql
# 查看字符集
show variables like "%char%";
```

## mysql的配置文件
* 二进制日志：log-bin ，主要用于主从复制，默认关闭
  [mysqld]
  log-bin=/var/lib/mysql/mysqlbin

* 错误日志: log-error,默认关闭，用于记录严重的错误和警告
  [mysqld]
  log-err=/var/lib/mysql/mysql_error

* 查询日志：log，记录sql的查询语句，也会降低性能
* 数据文件：table.frm(表结构文件) table.myd(数据文件) table.myi(索引文件)



## mysql的存储引擎
```sql
show engines;
show variables like '%storage_engine%';
```

## mysql的性能优化分析

* 性能下降，sql慢，执行时间长，等待时间长
  1.查询sql写的烂
  2.索引失效：单列索引，多列索引
  3.关联查询太多join（设计缺陷或不得已等需求）
  4.服务器各个参数设置（缓存，线程数等）

* join查询

手写sql：
  select distinct <select_list>
  from <left_table> <join_type>
  join <right_table> on <join_condtion>
  where <where_condition>
  group by <group_list>
  having <having_condition>
  order by <order_by_condition>
  limit <limit number>

机读sql：

```sql
并集：
select * from a inner join b on a.id=b.id;  

左连接（全a）：
select * from a left join b on a.id=b.id;

右连接（全b）：
select * from a right join b on a.id=b.id;

左连接（无公共部分）
select * from a left join b on a.id=b.id where b.id is null;

右连接（无公共部分）：
select * from a right join b on a.id=b.id where a.id is null;

全连接(union自带去重)
select * from a left join b on a.id = b.id
union
select * from a right join b on a.id=b.id;


全连接（无公共部分）
select * from a left join b on a.id = b.id where b.id is null
union
select * from a right join b on a.id=b.id where a.id is null;
```

* 索引（index）
定义: mysql索引是帮助mysql高效获取数据的数据结构。

用于解决where后的条件，order by后的条件

数据本身之外，数据库还维护者一个满足特定查找算法的数据结构，这些数据结构以某种方式指向数据，这样就可以在这些数据结构的基础上实现高级查找算法，这种数据结构就是索引。

索引本身也很大，不会全部保存在内存中，因此索引一般以文件的形式保存在磁盘上


优点：
  1.提高了数据的查询效率，降低磁盘IO 
  2.降低数据排序的成本，降低了cpu的消耗

缺点：
  1.索引也是一张保存了主键与索引字段并指向是体表的记录，占用空间 
  2.索引提高了查询速度，也降低了表更新的速度
  3.需要花时间建立最优秀的索引

索引分类：
  * 单列索引：一个表可以又多个单列索引
  * 多列索引：包含多列的索引
  * 唯一索引：索引值必须唯一，但允许值为空
  * 主键索引，全文索引

```sql
# 创建普通索引
create index index_name on table_name(coloumn1, column2...);
alter table_name add index index_name on (coloumn1, column2...);
alter table_name add primary key (column); #添加主键,唯一，不是null


# 创建唯一索引
create unique index index_name on table_name(coloumn1, column2...);
alter table_name add unique index index_name on (coloumn1, column2...);

# 创建全文索引
alter table_name add fulltext index_name (column1...);

# 删除索引
drop index index_name on table_name;

# 查看索引
show index from table_name;

```

索引结构分类：
  * Btree（大部分索引类型使用此算法）
      见图片：尚学堂—b+tree查找数据的方式.png
  * Hash
  * Fulltext
  * Spatial（空间索引）


需要创建索引的地方：
  1.主键自动创建索引
  2.频繁作为查询条件的字段应该创建索引
  3.查询中与其它表有关连的字段，外键关系的应该创建索引
  4.频繁更新的字段不适合创建索引
  5.where条件中用不到的字段不创建索引
  6.单列或多列索引的选择（高并发中最好是多列索引）
  7.查询中排序的字段应该创建索引
  8.查询中统计或分组的字段应该创建索引

不需要创建索引的地方：
  1.数据量不是很大
  2.经常增删改的表（对表进行insert,update,delete的时候不仅要保存数据，还要维护索引文件）
  3.数据重复且分布不均的表字段（创建索引后没太大的效果，应该且经常查询和排序的数据创建索引）

* 性能分析
1.mysql查询优化器：针对开发者输入的sql进行优化，并分析出最佳的执行方式

2.mysql常见瓶颈
  cpu瓶颈：数据装入内存 或 从磁盘上读取数据的时候
  磁盘io瓶颈：装入数据量远大于可用内存的时候
  服务器硬件性能瓶颈：htop

3.explain
使用explain可以模拟优化器执行sql查询语句，从而知道mysql是如何处理你的sql语句的。

mysql> explain select * from app_user where name="9999"\G;
*************************** 1. row ***************************
          id(查询序号): 1 
            #表示查询中执行select子句或操作表的顺序，
            多个id时候：
              * id相同则执行顺序由上到下
              * id不同，id的序号会递增，id值越大优先级越高，先被执行。
              * id相同，不同都有：值越大的先执行，然后按序执行


          select_type(查询类型): SIMPLE
            #表示查询类型，用于区分普通查询，联合查询，子查询等复杂查询
            * simple： 简单的select查询，查询中不包含子查询和union
            * primary：如果查询中包含复杂的子部分，最外层则标记为primary·
            * subquery：在select或where后包含子查询
            * derived（衍生）：from后的表是子查询 将被标记为derived，mysql会递归执行这些自查询，将结果放入临时表中
            * union：第二个select在union后，则标记为union；union包含在from子句的查询中，外层的select标记为derived
            * union result：union查询，两个结果合并的这种标记为union result

         table(表名称): app_user
         type(访问类型): ref
            #表示访问类型列，显示查询使用列哪种类型：
              *system（最好） > const > eq_ref > ref > range(良好) > index > all(最差，表示全表扫描)
              
              *sytem: 表只有一条记录（等于系统表）
              
              *const: 通过索引一次就找到了，一般在primarykey 或 unique 查询中出现，mysql自动将该查询转为一个常量
                explain select * from (select * from app_user where id=1) t1;

              *eq_ref: 唯一索引扫描，对于每个索引键，表中只有一条记录匹配

              *ref: 非唯一性索引扫描，返回匹配某个值对所有列。
                explain select * from users where name="sbjsw"; //name创建列普通索引，有多个人叫sbjsw
              
              *range: where中有 >,<,in,between的时候
              
              * index: 全索引扫描的时候（全索引扫描比全表扫描快，因为索引文件比表文件小）
                EXPLAIN select id from runoob_tbl; //id是主键索引

              * all: 全表扫描的时候
                EXPLAIN select * from runoob_tbl;

        possible_keys(可能用到的索引): index_name
            #指查询时可能用到的索引，一个或多个

          key(实际用到到索引): index_name
            #指查询时实际用到到索引，null表示未使用索引 或者 查询中使用了覆盖索引，索引仅出现在key中（possible_keys是null）

      key_len(): 153
            #指索引中使用的字节数，可通过该列计算查询中使用的索引长度（最大可能长度，并非实际长度），越短越好。


          ref(): const
            #指索引的哪一列被使用了，如果可能的话，是一个常数，哪些列或常量被用于查找索引列上的指；
            无索引的话就是null

         rows(): 1
            #根据表统计信息和索引的选用情况，估算出找到所需记录需要读取的行数。越小越好 

        Extra(): Using index condition
            #显示额外的重要信息
            
            * using filesort: mysql会对数据使用一个外部的索引排序，叫做“文件排序”
              explain select * from app_user where name="sbjsw" order by email;//按email排序
            
            * using temporary: 使用临时表保存中间结果，mysql在对查询结果排序时使用临时表，常见于order by和group by
              group by，order by对顺序最好跟索引一致

            * using index: 表示select查询使用了覆盖索引，避免访问表对数据行，运行效果不错！如果出现了using where,表明索引用阿里读取数据而非查找
              索引覆盖（covering index）指select查询对数据列只用从索引中就能获得，不用读取数据行。select时指定字段，不能用select *

            * using where: 使用了where条件

            * using join buffer: 使用了连接缓存池

            * impossible where: where条件不成立
              explain select * from users where name="sb" and name="qq";
            
            * select tables optimized away: 没有groupby的时候，基于索引优化了min/max操作 或 对myisam的引擎优化了count(*)操作， 查询执行计划生成时就完成了优化。

            * distinct：优化了distinct操作，找到第一匹配的数据后立即停止查找同的数据。
      id,type,key,rows,extra

1 row in set (0.00 sec)


* 索引优化
见 索引优化案例.md


1.尽可能减少join语句中的nestedloop循环总次数，”永远用小的结果集起驱动大的结果集“， 部门表department 驱动 员工表users; select * from department left join users...

2.优先优化nestedloop的内层循环
3.保证join语句中被驱动表上的join字段已经索引
4.如果无法保证被驱动表的字段是否索引，那么可以增大joinbuffer的配置




## 索引失效对情况
1.多列索引需要顺序一致才能生效

2.最佳左前缀法则：如果索引多列，查询从索引的最左侧列开始并且不跳过索引中的列！
```sql
例如：create index idx_name_age_pos on staff(name,age,pos);
select * from staff where name="sb" and age=25; //使用索引
select * from staff where name="sb" and age=25 and pos="dev"; //使用索引,但更精确，代价更大
select * from staff where age=23 and pos="dev"; //全表扫描，无法使用索引
select * from staff where name="sb" and pos="dev"; //全表扫描，使用部分索引
select * from staff where pos="dev"; //全表扫描，无法使用索引
```

3.不在索引列上做任何操作（计算，函数，自动或手动类型转换），会导致索引失效而转向全表扫描
```sql
select * from staff where left(name, 4)="sbjs"; #索引失效
```

4.存储引擎不能使用索引中范围条件右边对列
```sql
select * from staff where name="sb" and age>34 and pos="dev";
-- name的索引被使用，age是范围查询，age后的条件查询索引失效
```

5.尽量使用覆盖索引（只访问索引对查询（索引列和查询列一致）），减少select *
```sql
select * from staff;
select name,age from staff; (好)
```

6.mysql在使用不等于（!=）的时候无法使用索引，会导致全表扫描
```sql
select * from book where card <> 16;
```

7.is null, is not null也无法使用索引
```sql
explain select * from book where card is not null;
```

8.like通配符%开头 也会导致索引失效 变成全表扫描
```sql
explain select * from class where card like "sb%"; (good)
explain select * from class where card like "%sb%"; 
explain select name,age from class where card like "%sb%"; //使用覆盖索引查询索引不会失效
explain select name,age,email from class where card like "%sb%"; //email没在索引内，索引会失效！
```

9.字符串不加单引号索引会失效
```sql
select * from staff where name=2000; #自动转换2000为字符串，索引将失效
select * from staff where name='2000'; 
```

10.少用or，用它来连接时索引会失效
```sql
select * from staff where name="sb" or name="ql";
```


## 索引优化的建议
group by 基本上都需要进行排序，会产生临时表
固定值，范围或者排序，order by会有范围

* 对于单列索引，尽量选择针对当前query过滤性好的索引
* 对于多列索引，当前query中过滤性最好的字段在索引字段顺序中，位置越靠前越好
* 在选择组合索引的时候，尽量选择可以能够包含当前query中where中更多字段的索引
* 尽可能通过分析统计信息 和 调整query的写法来达到选择合适索引的目的






## 查询截取分析


--分析---
1.观察，至少跑1天，看看生成服务器的sql情况
2.开启慢查询日志，设置阈值，比如超过5秒就记录sql
3.使用explain+sql分析
4.show profile
5.进行sql数据库服务器对参数调优


## 查询优化
1.永远使用小表驱动大表
```sql
当departments表数据集小于users表时，用in优于exists：
select * from users where did in (select id from departments);

当users表数据集小于departments表时，用exist优于in：
-- 将主查询的数据，放到子查询中验证，子查询返回true｜false决定数据是否保留
select * from users where exists (select 1 from departments where users.did=departments.id);
```

2.使用order by优化

mysql支持index 和 filesort两种方式排序；index效率高，filesort效率低

orderby满足2中情况会使用index排序：
1.order by语句使用索引最左前列
2.使用where和order by子语句条件组合满足索引最左前列

如果排序不在索引列上，filesort使用单路和双路算法排序：
1.mysql4.1之前使用双路排序，就是两次扫描磁盘，最终得到数据。读取行指针和orderby列，对他们进行排序，然后扫描
已经排序好的列表，按照列表中的值重新从列表中读取对应的数据输出
从磁盘取排序字段，在buffer中进行排序，再从磁盘取其它字段。2次磁盘扫描IO操作耗时

2.mysql4.1后使用单路排序，从磁盘中读取查询需要的所有列，按照order by列在buffer中对他们进行排序，然后扫描排序后对列表进行输出，它的效率更快一些，避免列第二次读取数据。并且把随机IO变成列顺序IO，但他会使用更多的内存空间！

单路排序总体优于双路排序，但是如果把所有的字段都取出，可能超过sort_buffer的容量，这要就需要多次取出数据，进行排序（创建临时文件，多路合并），解决思路就是：增大sort_buffer_size,max_length_for_sort_data这两个参数

3.少写不使用select *


不能使用索引排序的sql：
index_a_b_c(a,b,c);

order by a asc, b desc, c desc;//排序不一致
where g=const order by b ,c ;//丢失索引a
where a=const order by c; //丢失索引b
where a=const order by a,d // d不是索引的一部分
where a in (...) order by b,c //in也是范围查询


## group by的优化
1.group by实质是先排序后进行分组，遵照索引建的最佳左前缀
2.当无法使用索引列，增大max_length_for_sort_data和sort_buffer_size参数的设置
3.where高于having，能写在where中的条件就不要写在having中



## 慢查询
mysql慢查询日志指在mysql中响应时间超过long_query_time（默认10秒）设置的语句，并记录到慢查询日志文件中。

慢查询默认未开启，仅在调优过程中开启。

```sql
#查看是否开启
mysql> show variables like "%slow_query_log%";
+---------------------+--------------------------------------+
| Variable_name       | Value                                |
+---------------------+--------------------------------------+
| slow_query_log      | OFF                                  |
| slow_query_log_file | /var/lib/mysql/b936a9c957a0-slow.log |
+---------------------+--------------------------------------+
2 rows in set (0.00 sec)

#sql中开启,只针对当前数据库生效
mysql> set global slow_query_log=1;

#慢查询时间
show variables like "%long_query_time%";

#设置慢查询时间
set global long_query_time=3;

#查看慢查询的sql数量
show global status like "%slow_queries%";

#
select sleep(4);
```

#在配置文件中开启
```ini
[mysqld]
slow_query_log=1
slow_query_log_file=/var/lib/mysql/mysql-slow.log
long_query_time=3
log_output=file
```

## mysql日志分析工具mysqldumpslow
mysqldumpslow -s r -t 10 -g "left join" /var/lib/mysql/host-slow.log | more
-t 10 取10条
-s 排序
    al: average lock time
    ar: average rows sent
    at: average query time
    c: count
    l: lock time
    r: rows sent
    t: query time  

-g "left join" 搜索含left join的sql


## 数据批量插入
```sql
create table departments (
  id int unsigned not null auto_increment,
  no bigint unsigned not null,
  name varchar(50) not null,
  location varchar(50) not null
);

create table staffs (
  id int unsigned not null auto_increment,
  staff_no int not null default 0,
  staff_name varchar(50) not null,
  job varchar(50) not null,
  hire_date date not null,
  salary decimal(7,2) unsigned not null,
  did int unsigned not null default 0,
  primary key(id)
)

#批量数据到staffs表
CREATE PROCEDURE `insert_to_staffs`(in start_num int(10), in max_num int(10))
begin
	declare i int default 0;
	set autocommit = 0;
	
	repeat
	set i = i+1;
	insert into staffs(staff_no, staff_name, job, hire_date, salary, did) values(
		start_num+i, rand_string(6), 'salesman', curdate(), 2000, rand_num()
	);
	until i=max_num
	end repeat;
	commit;
end

#批量数据到departments表
CREATE PROCEDURE `insert_to_departments`(in start_num int(10), in max_num int(10))
begin 
	DECLARE i int DEFAULT 0;
	set autocommit=0;
	
	repeat
	set i = i+1;
	insert into departments(`no`, `name`, `location`) values(
		start_num+i, rand_string(10), rand_string(8)
	);
	until i =max_num
	end repeat;
	commit;
end

#随机数字函数
CREATE FUNCTION `rand_num`() RETURNS int(5)
begin
	DECLARE i int default 0;
	set i = floor(100+rand()*10);
	return i;
end

#随机字符串函数
CREATE FUNCTION `rand_string`(n int) RETURNS varchar(255) CHARSET utf8mb4
begin
	DECLARE chars varchar(100) default 'abcdefghijklmnpqrstuvwxyz';
	DECLARE return_str varchar(255) default '';
	DECLARE i int DEFAULT 0;
	
	WHILE i < n DO
		set return_str = CONCAT(return_str, SUBSTRING(chars, floor(1+rand()*25), 1));
		set i = i+1;	
	end WHILE;

	RETURN return_str;
end

show variables like "%log_bin_trust_function_creators";
set global log_bin_trust_function_creators = 1;

#调用存储过程
call insert_to_departments(100, 10);
call insert_to_staffs(100001,500000); //149s
```



## show profile
mysql提供到可用来分析当前会话中语句执行到资源消耗情况。用于sql到调优测量。
默认关闭，并保存最近15次到运行结果。

```sql
mysql> show variables like "profiling";
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| profiling     | OFF   |
+---------------+-------+
1 row in set (0.00 sec)

mysql> set profiling=on
Query OK, 0 rows affected, 1 warning (0.00 sec)


#查看最近运行的sql运行效率
mysql> show profiles;
+----------+------------+--------------------------------------------------+
| Query_ID | Duration   | Query                                            |
+----------+------------+--------------------------------------------------+
|        1 | 0.00090250 | show variables like "profile"                    |
|        2 | 0.00072800 | show variables like "profiling"                  |
|        3 | 0.00012975 | select * from staffs gorup by id%10 order by 5   |
|        4 | 0.00061500 | SELECT DATABASE()                                |
|        5 | 0.02608475 | show databases                                   |
|        6 | 0.00129875 | show tables                                      |
|        7 | 0.00010425 | select * from staffs gorup by id%10 order by 5   |
|        8 | 0.00011000 | select * from staffs gorup by id%10 limit 150000 |
|        9 | 0.62707350 | select * from staffs group by id%10 limit 150000 |
+----------+------------+--------------------------------------------------+
9 rows in set, 1 warning (0.00 sec)


#查看指定sql的cpu和磁盘消耗记录
mysql> show profile cpu, block io for query 9;
参数有：
  all 全部开销信息
  block io 块IO开销
  context switches, 上下文切换开销
  cpu , cpu开销
  ipc, 发送和接收的开销
  memory, 内存开销
  page faults,错误页面开销
  source, source_function, source_file
  swaps, 交换次数开销

+----------------------+----------+----------+------------+--------------+---------------+
| Status               | Duration | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------------+----------+----------+------------+--------------+---------------+
| starting             | 0.000087 | 0.000033 |   0.000052 |            0 |             0 |
| checking permissions | 0.000040 | 0.000015 |   0.000024 |            0 |             0 |
| Opening tables       | 0.000044 | 0.000018 |   0.000028 |            0 |             0 |
| init                 | 0.000108 | 0.000042 |   0.000066 |            0 |             0 |
| System lock          | 0.000061 | 0.000023 |   0.000037 |            0 |             0 |
| optimizing           | 0.000016 | 0.000006 |   0.000010 |            0 |             0 |
| statistics           | 0.000033 | 0.000013 |   0.000020 |            0 |             0 |
| preparing            | 0.000025 | 0.000009 |   0.000015 |            0 |             0 |
| Creating tmp table   | 0.000054 | 0.000022 |   0.000034 |            0 |             0 |
| Sorting result       | 0.000015 | 0.000005 |   0.000008 |            0 |             0 |
| executing            | 0.000014 | 0.000009 |   0.000014 |            0 |             0 |
| Sending data         | 0.626315 | 0.623903 |   0.000000 |            0 |             0 |
| Creating sort index  | 0.000058 | 0.000057 |   0.000000 |            0 |             0 |
| end                  | 0.000014 | 0.000013 |   0.000000 |            0 |             0 |
| removing tmp table   | 0.000017 | 0.000017 |   0.000000 |            0 |             0 |
| end                  | 0.000014 | 0.000014 |   0.000000 |            0 |             0 |
| query end            | 0.000015 | 0.000015 |   0.000000 |            0 |             0 |
| closing tables       | 0.000020 | 0.000020 |   0.000000 |            0 |             0 |
| freeing items        | 0.000075 | 0.000078 |   0.000000 |            0 |             0 |
| cleaning up          | 0.000051 | 0.000123 |   0.000000 |            0 |             0 |
+----------------------+----------+----------+------------+--------------+---------------+
20 rows in set, 1 warning (0.00 sec)
```

converting HEAP to myisam; 查询结果太大，内存不够用往磁盘上存储
create tmp table; 拷贝数据到临时表，用完再删除
copying to tmp table on disk; 把内存中的临时表复制到磁盘，危险！
locked;


## 全局日志
```ini
my.cnf配置：
general_log=1
general_log_file=/var/lib/mysql/logfile
log_output=file
```

```sql
set global general_log=1;
set global log_output='table'; #临时开启后，所有sql语句将会保存到general_log中
select * from mysql.general_log;
```





# mysql锁

锁是计算机协调多个进程或线程并发访问某一资源的机制。

在数据库中，数据也是一种供用户共享的资源，如何保证数据并发访问的一致性，有效性是所有数据库必须要解决的一个问题，
锁冲突也是影响数据库性能的重要因素。从这个角度说，锁对数据库更为重要，也更复杂。


按操作类型分类：
1.读锁（共享锁）: 针对同一份数据，多个读操作可以同时进行不会相互影响
2.写锁（排它锁）：当前写操作没有完成前，它会阻断其它写锁和读锁

按对数据操作的颗粒分类：
1.表锁（读）：
  特点就是：偏myisam存储引擎，开销小，加锁快，无死锁，锁定颗粒度大，发生锁冲突的概率最高，并发度最低

```sql
#1.创建一个表
CREATE TABLE `table_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

#2.加入数据
INSERT INTO `table_block` (`id`, `name`) VALUES('1', 'a'),('2', 'b'),('3', 'c'),('4', 'd');

# 查看表占用情况·
show open tables where in_use > 0;

#session1:加读锁
lock table table_block read;
select * from table_block; #只可以读锁定读表

mysql> select * from class; #不可以读其他表
ERROR 1100 (HY000): Table 'class' was not locked with LOCK TABLES

mysql> update table_block set name="aa" where id=1; #不可以改本表
ERROR 1099 (HY000): Table 'table_block' was locked with a READ lock and cant be updated

#session2:
select * from table_block; #可以
update table_block set name="aa" where id=1; #只有session1释放锁的时候才能更新

select * from class;#可以读其他表
update class set card=22 where id=2; #可以改其他表
```


2.行锁（写）：

```sql
#1.加写锁
lock table table_block write;    
select * from table_block; #可以

mysql> update table_block set name="aaa" where id=1; #更新本表可以
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from class; #读其它表不可以
ERROR 1100 (HY000): Table 'class' was not locked with LOCK TABLES

mysql> update class set card=111 where id=1; #更新其它表不可以
ERROR 1100 (HY000): Table 'class' was not locked with LOCK TABLES

#session2
select * from table_block; #阻塞中
update table_block set name="aaa" where id=1; #阻塞中

select * from class; #读其它表可以
update class set card=44 where id=7; #更新其它表，可以

```

myisam执行select自动给自动加读锁，在更改操作前自动加写锁。

* myisam的读操作，不会阻塞其它进程对同一个表对读请求，但会阻塞对同一个表对写请求。只有读锁释放后，其它进程才能进行写操作。

* myisam的写操作，会阻塞其它进程对同一表对读和写，只有写锁释放后，才会执行其它进程的读写操作。


结论：myisam读写锁优先调度写操作，所以myisam不适合做写为主表的引擎，因为写锁后，其它进程不能进行任何操作，加大了其它进程的阻塞。

```sql
mysql> show status like "table%"; #查看锁表统计
+----------------------------+-------+
| Variable_name              | Value |
+----------------------------+-------+
| Table_locks_immediate      | 78    |  # 出现锁的次数
| Table_locks_waited         | 0     |  # 出现锁争抢而等待的次数
| Table_open_cache_hits      | 11    |
| Table_open_cache_misses    | 0     |
| Table_open_cache_overflows | 0     |
+----------------------------+-------+
5 rows in set (0.00 sec)
```




# 行锁
行锁偏向innodb存储引擎，开销大，加锁慢，会出现死锁；锁定颗粒度小，发生锁冲突的概率低，并发度也最高
（innodb与myisam最大不同：一是支持事务，二是采用行锁）；


事务是由一组sql语句组成的罗技处理单元，事务正确执行的4个要素(ACID)：
* 原子性atomicity（要么都成功，要么都失败），
* 一致性consistent（针对一个事务操作前后的状态一致）
* 隔离性isolation（针对多个用户同时操作，排除其它事务对本次事务的影响）
* 持久性durable（事务结束后数据不随着外界原因而丢失）

由于行锁也支持事务，并发处理会带来问题：
1.更新丢失（update lost）: 多个事务操作同一行数据，由于每个事务不知道其它事务的存在，就会发生最后的更新覆盖了其它更新

2.脏读（dirty read）：事务a读取了事务b已修改但尚未提交的数据，还在这个数据上做了修改，此时如果B回滚，a读取的数据就无效了，不符合一致性要求了

3.不可重复度（non-repeatable read mysql默认）：事务a读取到了事务B已提交的修改数据，不符合隔离性

4.幻读（phantom read）：事务a读取到了事务b提交的新增数据，不符合隔离性


数据库的隔离级别：
1.未提交读 read uncommitted   最低级别，只保证不读取损坏的数据
2.已提交读 read committed     语句级别
3.可重复度 repeatable read    事务级别
4.可序列号 serializable       最高级别，事务级别


#查看事务的隔离级别
show variables like 'tx_isolation';


```sql
create table table_block2(
  a int(11),
  b varchar(16)
) engine=innodb;

insert into table_block2(a, b) values(1, 'b2'),(3, '3'),(4, '4000'),(5, '5000'),(9, '9000');
create index idx_a on table_block2(a);
create index idx_b on table_block2(b);



#session-1
set autocommit=0;

第1步
update table_block2 set b=4001 where a=4;
select * from table_block2; //4001;
commit;
select * from table_block2; //4001;

第2步
update table_block2 set b=4002 where a=4;
commit;

第3步
update table_block2 set b=4004 where a=4;
commit;

第4步：无索引行锁升级表锁
update table_block2 set a=23 where b=4004; #b是索引，它的类型是字符串，此处发生了数据转换导致表锁
commit;

第5步：间歇锁
当使用条件范围请求共享锁或拍他锁时，innodb给符合条件的已有数据记录的索引加锁；对于在条件范围内但不存在但记录，叫做间隙（gap），innodb也会对这个间隙加锁
update table_block2 set b='3007' where a > 6;
commit;

#session-2
第1步
select * from table_block2; //4000
select * from table_block2; //commit后 4001 


第2步
update table_block2 set b=4002 where a=4; #阻塞直到commit

第3步
update table_block2 set b=9001 where a=9; #可以


第4步：
update table_block2 set b=9002 where a=9; #表锁阻塞

第5步：间歇锁
insert into table_block2(a,b) values(10, '1001');
```



##锁定一行
```sql
#session-1
set autocommit=0;
begin;
select * from table_block2 where a=9 for update;
commit;

#session-2
update table_block2 set b='9003' where a=9; #阻塞
```


##分析行锁
```sql
show status like "innodb_row_lock%";
+-------------------------------+-------+
| Variable_name                 | Value |
+-------------------------------+-------+
| Innodb_row_lock_current_waits | 0     | #当前正等待锁定对数量
| Innodb_row_lock_time          | 30988 | #从系统启动到现在锁定总时间
| Innodb_row_lock_time_avg      | 7747  |
| Innodb_row_lock_time_max      | 10381 |
| Innodb_row_lock_waits         | 4     | #从系统启动到现在等待次数
+-------------------------------+-------+
5 rows in set (0.00 sec)
```


# 页锁
开销和加锁时间介于表锁和行锁之间，会出现死锁；锁定到颗粒度介于表锁和行锁之间。








# mysql主从复制
slave从master读取binlog进行数据同步：
  1.master主机将数据变更记录到二进制日志（binary log）
  2.slave将master到二进制日志拷贝到它到中继日志（relay log）
  3.slave重做中继日志中的事件，将改变应用到自己的数据库中，mysql复制是异步窜行的

每个slave只有一个master
每个slave只有一个唯一服务器id
每个master可有多个slave

缺点是：延迟导致数据不一致


第1步：mysql主从版本一致

第2步：配置
```ini
master配置：
#主从复制配置
server-id=1
log-bin=/var/lib/mysql/mysqlbin
log-err=/var/lib/mysql/mysqlerr
tmpdir=/tmp

#master是否可读可写
read-only=0 

#忽略的数据库
binlog-ignore-db=mysql
binlog-ignore-db=information_schema
binlog-ignore-db=performance_schema


slave配置：
server-id=2
log-bin=mysqlbin
log-err=mysqlerr
```

第3步：在master上创建同步账户并授权
```sql
grant replication slave on *.* to `sync_user`@`%` identified by '123456';

flush PRIVILEGES;

#查看master状态
show master status; 
```

第4步：在slave上

```sql
change master to master_host="172.17.0.2",
master_user="sync_user",
master_password="123456",
master_port=3306,
master_log_file="mysqlbin.000001",
master_log_pos=394;


#查看slave状态
show slave status\G

# 启动和停止
start slave;
stop slave;

第5步：在master上添加数据库，创建表，插入数据，将会同步的到slave上
``` 