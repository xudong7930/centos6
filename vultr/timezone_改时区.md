1.查看当前时区命令
date -R

2.复制相应的时区文件，替换系统时区文件
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

3.然后使用下面的命令将更改写入bios。
hwclock
