#!/bin/bash

# 8.显示命令执行结果
echo `date`

# 6.显示结果定向至文件
echo "It is a test" > /dev/null

# 4.显示换行
echo -e "ok got it \n" # -e 开启转义

# 3.显示变量
name="fwefw"
echo "your name: ${name}"