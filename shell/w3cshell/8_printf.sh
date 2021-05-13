#!/bin/bash

# 语法：printf  format-string  [arguments...]
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876

# ％s 输出一个字符串
# %-10s 指一个宽度为 10 个字符

# ％d 整型输出
# ％c 输出一个字符

# ％f 输出小数
# %-4.2f 指格式化为小数，其中 .2 指保留2位小数


