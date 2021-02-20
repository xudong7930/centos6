#IP访问排序
awk '{print $7}' /usr/local/nginx/logs/access.log | sort |uniq -c | sort -rn | head -n 10

#页面访问排序
awk '{print $1}' /usr/local/nginx/logs/access.log | sort -n |uniq -c | sort -rn | head -n 10


awk '{print $8}' /usr/local/nginx/logs/error.log | sort |uniq -c | sort -rn | head -n 10


# 隐藏服务器信息
修改 php.ini 文件 设置 expose_php = Off;
修改nginx.conf  在http里面设置 server_tokens off;

# nginx常用命令
./nginx 启动
./nginx -s stop 停止
./nginx -s quit 安全退出
./nginx -s reload 重新加载配置文件
./nginx -t 检查文件语法


