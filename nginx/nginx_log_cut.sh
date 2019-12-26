# /bin/bash

#time@2019年3月14日
#name@刘启明
#function@NGINX日志切割


#NGINX日志路径
base_path='/usr/local/nginx/logs'


#创建目录时间 当天时间 例如：2019-03-14
#log_path=$(date -d yesterday +"%Y%m%d") #该参数是创建前一天数据，如需要当天备份，可使用
log_path=$(date  +"%Y%m%d")


#日志创建时间 
#date=$(date -d yesterday +"%Y-%m-%d-%H")#该参数是创建前一天数据，如需要当天备份，可使用
date=$(date  +"%Y-%m-%d-%H")


#在NGINX日志路径下创建以当天时间命名的目录
mkdir -p $base_path/$log_path


#将备份日志
mv $base_path/access.log $base_path/$log_path/access_$date.log
mv $base_path/error.log $base_path/$log_path/error_$date.log

#NGINX日志重读
kill -USR1 `cat /usr/local/nginx/logs/nginx.pid`
