# rabitmq

## pull
> docker pull rabbitmq:3.8.14-management

## run 
> docker run -d --hostname app_rabbitmq --name app_rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.8.14-management


## web登陆
http://localost:15672
guest
guest

## 用户管理
    添加用户：
    > rabbitmqctl add_user admin admin
    
    分配角色：administrator-全局管理员monitoring-监控者policymaker-策略制定者managment-普通管理员
    > rabbitmqctl set_user_tags admin administrator
    
    分配权限：
    > rabbitmqctl.bat set_permissions -p / admin ".*" ".*" ".*"
    
    删除用户：
    > rabbitmqctl delete USER_NAME
    
    查看用户列表：
    > rabbitmqctl list_users


## 命令行管理
    rabbitmqctl help
    
    # 列出队列
    rabbitmqctl list_queues

## 插件管理

    列出插件
    > rabbitmq-plugins list
    
    启用,禁用插件
    > rabbitmq-plugins enable plugin_name
    > rabbitmq-plugins disable plugin_name