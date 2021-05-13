#!/bin/bash

# 1.hello,word
    echo "hello,bash";


# 2.定义变量
    ## 定义变量1：等号两边不能有空格
    name="dongcidaci";

    ## 定义变量2：使用执行命令的结果赋值变量
    # for file in `ls /etc`
    # for file in $(ls /etc)


# 3.使用变量
    echo $name;
    echo ${name};

    ## 变量重新赋值
    name="sbjsw"
    echo $name;

# 4.只读变量
    url="http://ehd4.f3322.net"
    readonly url

    url="2323" #报错

# 5.删除变量
    unset name #不能删除只读变量

# 6.变量的类型
# 1.局部变量：作用在一个脚本中的变量
# 2.环境变量：作用在所有脚本中的变量
# 3.shell变量




