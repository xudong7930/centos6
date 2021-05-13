#!/bin/bash

# 1.输出重定向, 输出重定向会覆盖文件内容
ls -l /etc > /dev/null

ls -l /etc >> ~/Desktop/etc.txt


ls -l /etc 2> /dev/null # 错误重定向
ls -l /etc 2>> /dev/null # 错误重定向追加

ls -l /etc > ~/Desktop/etc.log 2>&1 #标准输出和错误输出都重定向

# 2.输入重定向
wc -l ~/Desktop/etc.txt


# 3.here doc
wc -l << EOF
    欢迎来到
    菜鸟教程
    www.runoob.com
EOF

# 4.null重定向
ls -l > /dev/null 2>&1