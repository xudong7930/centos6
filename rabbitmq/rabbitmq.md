# rabitmq

## pull
> docker pull rabbitmq:3.8.14-management

## run 
> docker run -d --hostname app_rabbitmq --name app_rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.8.14-management


## web登陆
http://localost:15672
guest
guest







#### 命令后操作


添加用户：
> rabbitmqctl add_user admin admin

分配角色：
> rabbitmqctl set_user_tags admin administrator

```
administrator 全局管理员
monitoring 监控者
policymaker 策略制定者
managment 普通管理员
```

分配权限：
> rabbitmqctl.bat set_permissions -p / admin ".*" ".*" ".*"

删除用户：
> rabbitmqctl delete USER_NAME

查看用户列表：
> rabbitmqctl list_users

