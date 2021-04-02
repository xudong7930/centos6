# swoole
swoole是PHP的异步，并行，高性能网络通信引擎，使用纯c编写，提供PHP语言的异步多线程服务器。
* 异步tcp/udp服务
* 异步mysql
* 异步redis
* 异步任务
* 消息队列
* 毫秒定时器
* 异步文件读写
* 异步dns
* 内置http，socket服务等




<!-- mac docker install -->
```s
docker run -d -p 9501:9501 -p 9502:9502 --name app_swoole -v /Users/xd/xudong/code/swoole:/var/www  phpswoole/swoole:4.5.11-php7.2
```