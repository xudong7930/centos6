#!/bin/bash

# 1.bash支持一维数组（不支持多维数组），并且没有限定数组的大小
os=("centos" "macos" "ubuneto" "windows")

lang=()
lang[0]="php"
lang[1]="jjs"
lang[2]="java"


# 2.读取数组
echo ${os[1]} #读取指定下标
echo ${lang[@]} #读取所有


# 3.数组长度
echo ${#lang[@]}
