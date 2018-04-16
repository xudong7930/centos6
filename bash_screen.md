screen
======

## 创建一个新的窗口会话
* screen
* screen -S 会话名称

在已有的窗口会话中再创建一个
> ctrl + a + c

暂时中断当前会话(detach)
> ctrl + a + d

列出中断的会话
> screen -ls
```
There is a screen on:
	14838.pts-4.wallet-zhang	(04/12/18 10:52:38)	(Detached)
1 Socket in /var/run/screen/S-xudong.
```

连接中断的会话(attach):
> screen -r 14838

## 快捷键
* 列出所有窗口列表: ctrl + a + w 
* 窗口切换: ctrl + a
* 下一个窗口: ctrl + a + n
* 上一个窗口: ctrl + a + p
* 切换到指定窗口: ctrl + a + [0-9]
* 创建新窗口: ctrl + a + c
* 暂时端口当前会话: ctrl + a + d
* 拷贝模式: ctrl + a + [

## 技能
* 启动一个初始状态断开的screen会话: screen -dmS neo dotnet /home/xudong/neo/neo-cli.dll /rpc /log
* 连接该会话: screen -r neo
