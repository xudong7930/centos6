SQLite3
======

## 安装
```bash
tar zxvf sqlite-3.3.8.tar.gz
cd sqlite-3.3.8
./configure --prefix=/usr/local/sqlite3
make && make install
ln -s /usr/local/sqlite3/bin/* /usr/local/bin/
```

## 命令行内
```
    连接：sqlite3 DataStore.sqlite
    退出: .exit  .quit
    查看当前数据库下所有表: .tables
    查看所有数据库: .databases
    帮助: .help
    查询某表下的数据: select * from TABLE_NAME;
    查看当前显示格式配置: .show
    查看数据库结构(所有表的结构): .schema
                              .schema 表名称
    使用column模式查看数据:
        .mode column //(列模式)推荐
        .mode csv //csv模式
        .mode list //list模式(默认)
        SQL: selectg * from table;

    自定义分隔符:
        .separator ~~ //设置分隔符为~~ ,默认是;

    显示标题栏:
        .headers on|off

    创建表:
        create table Tech(
            id integer PRIMARY EKY,
            name text NOT NULL,
            Age integer CHECK(Age>0),
            Country text DEFAULT 'CHINA'
        );
    插入数据: insert into Tech values(1,'Alice', 25, "USA");
    修改数据: update Tech set age=27 where id=1
    删除数据: delte from Tech where id=1;

    导入数据:
            1.新建文件db.sql:
                --表Cars
                BEGIN TRANSACTION;

                CREATE TABLE Cars(Id integer PRIMARY KEY, Name text, Cost integer);

                INSERT INTO Cars VALUES(1,'Audi',52642);

                COMMIT;

                --表Orders
                BEGIN TRANSACTION;

                CREATE TABLE Orders(Id integer PRIMARY KEY,

                OrderPrice integer CHECK(OrderPrice>0),Customer text);

                INSERT INTO Orders(OrderPrice, Customer) VALUES(1200, "Williamson");
                COMMIT;

            2.执行导入
            .read db.sql
```

## 命令行外
```
    查看版本: sqlite3 -version
    创建数据库: sqlite3 test.sqlite //test.sqlite文件不存在
    打开已有数据库: sqlite3 DataStore.sqlite //DataStore.sqlite文件存在

    SQLite存储类型:
        INTEGER: 整数
        REAL: 浮点数
        TEXT: 字符串
        BLOB: 二进制数

    SQLite约束:
        PRIMARY KEY --主键
        NOT NULL --非空
        CHECK --条件检查
        DEFAULT --默认值
```
