#IP访问排序
awk '{print $7}' /usr/local/nginx/logs/access.log | sort |uniq -c | sort -rn | head -n 10

#页面访问排序
awk '{print $1}' /usr/local/nginx/logs/access.log | sort -n |uniq -c | sort -rn | head -n 10


awk '{print $8}' /usr/local/nginx/logs/error.log | sort |uniq -c | sort -rn | head -n 10