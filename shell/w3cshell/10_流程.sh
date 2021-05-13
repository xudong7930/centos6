#!/bin/bash

# 1.if
a=1
if [ $a -eq 1 ]; then
    echo "111"
fi

if true
then
    echo "222"
fi

# 2. if...else
if [ 2 -eq 1 ]
then
    echo "333"
else
    echo "444"
fi


# 3. if...elif..fi
if [ 2 -lt 3 ] ;then
    echo "555"
elif [ 2 -eq 3 ] ;then
    echo "666"
else
    echo "777"
fi



# 4.for
for file in $(ls /tmp)
do
    echo $file
done


# 5.while
int=1
while(( $int<=5 ))
do
    if [ $int == 2 ]; then
        continue
    fi

    echo $int

    if [ $int == 3 ]; then
        break
    fi
    let "int++"
done


# 6.case
site="runoob"
case "$site" in
   "runoob") echo "菜鸟教程"
   ;;
   "google") echo "Google 搜索"
   ;;
   "taobao") echo "淘宝网"
   ;;
   "*") echo "111"
    ;;
esac