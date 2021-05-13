#!/bin/bash

# 1.数字比较 -eq -ne -gt -ge -lt -le

a=10;
b=20;
if test $[a] -eq $[b]
then
    echo "相等";
else
    echo "不等";
fi


# 2.字符串比较 = != -z字符串长度0 -n字符串长度非0
a="str1"
b="str2"
if test $a = $b
then
    echo "eq";
else
    echo "neq"
fi


# 3.文件测试
# -e 文件存在
# -r 文件存在可读
# -w 文件存在可写
# -x 文件存在可执行
# -d 目录存在
# -f 文件存在是普通文件
# -c 文件存在是特殊文件
# -b 文件存在是块文件
if test -e "./bash"
then
    echo "exist"
else
    echo "not exist"
fi