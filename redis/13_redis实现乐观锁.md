# Redis实现乐观锁


悲观锁：
  * 很悲观，认为什么时候都会出现问题，无论做什么都会加锁！

乐观锁：
  * 很乐观，认为什么时候都不会出问题，所以不会上锁！更新数据的时候去判断一下在此期间是否有人修改过这个数据
  * 获取version 
  * 更新的时候比较version


```bash

set balance 100
set out 0

watch balance
multi
DECRBY balance 20
INCRBY out 20
exec #执行之前，balance被其它进程修改,exec将执行失败
unwatch

```
