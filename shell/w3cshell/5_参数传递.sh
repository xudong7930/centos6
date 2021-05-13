#!/bin/bash

echo "Shell 传递参数实例！";
echo "执行的文件名：$0";
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo "第三个参数为：$3";
echo "参数个数：$#";
echo "脚本参数：$*" #以字符串显示所有向脚本传递的参数
echo "进程ID：$$" #当前进程ID号
echo "最后一个后台进程ID：$!" #后台运行的最后一个进程的ID号
echo "选项：$-" #显示Shell使用的当前选项
echo "最后一个命令退出状态：$?" #最后命令的退出状态。0表示没有错误，其他任何值表明有错误。


:<<EOF
➜  w3cshell ./5_参数传递.sh one two three
Shell 传递参数实例！
执行的文件名：./5_参数传递.sh
第一个参数为：one
第二个参数为：two
第三个参数为：three
EOF