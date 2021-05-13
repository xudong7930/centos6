#!/bin/bash

# 1.shell字符串
your_name="sbjsw" #双引号中的变量会被解析
your_father='sfwefw' #单引号原样输出


# 2.字符串拼接
great="hi,${your_name} good"
great2='hi,'${your_name}' good'

echo $great;
echo $great2;

# 3.字符串长度
dong="abcdefg"
echo ${#dong} #7

# 4.字符串截取： ${变量名:起始:长度}
string="ok,got it"
echo ${string:1:3} #从第2个字符开始，截取3个字符
echo ${string:2}

# 5.字符串查找
strA="helloworld"
strB="l2ow"
if [[ $strA =~ $strB ]]
then
    echo "包含"
else
    echo "不包含"
fi
