
> kill -9 `ps -a | grep php71 | grep -v grep | awk '{print $1}'`

或者

> ps -a | grep php71 | grep -v grep | awk '{print $1}' | xargs kill -9


linux杀掉tty终端
* 1.取得终端名称: w -s
* 2.取得指定终端的进程号: ps -t /dev/pts/10
* 3.干掉终端: kill -9 进程ID
