centos7_安装_使用_supervisor
==========================

# 1.安装和启动
yum -y install supervisor  

<!-- 加入service组 -->
systemctl enable supervisord.service

<!-- 启动supervisor -->
systemctl stop supervisord.service
systemctl start supervisord.service
systemctl restart supervisord.service


# 添加项目 
vim /etc/supervisord.d/laravel.ini 添加:
```bash
[program:laravel-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /usr/local/nginx/html/ding_liufei/artisan queue:work --tries=3 --timeout=500
autostart=true
autorestart=true
user=root
numprocs=2
redirect_stderr=true
stdout_logfile=/var/log/laravel_queue.log
```

> supervisord -c /etc/supervisord.conf  
> supervisorctl -c /etc/supervisord.conf
> supervisorctl restart all
> supervisorctl start all

step_1.读取可用的组
> supervisorctl reread  

step_2.更新
> supervisorctl update  

step_3.启动指定的worker
> supervisorctl start laravel-worker:* 
> supervisorctl restart all

