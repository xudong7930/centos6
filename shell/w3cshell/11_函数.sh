#!/bin/bash

say(){
    echo "这是我的第一个 shell 函数!"
}

say

# 2.带有返回的函数
sing() {
    return 111; #函数return 整数
}
sing
sing_return=$?
echo $sing_return


# 3.函数穿参
funWithParam(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $10 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73