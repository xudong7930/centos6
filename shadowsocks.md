shadowsocks
===========


## 1.使用root执行
```bash
wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-go.sh
chmod +x shadowsocks-go.sh
./shadowsocks-go.sh 2>&1 | tee shadowsocks-go.log
```
- 输入密码
- 输入端口

## 2.卸载
```bash
./shadowsocks-go.sh uninstall
```

## 3.启动
- 启动： /etc/init.d/shadowsocks start
- 停止： /etc/init.d/shadowsocks stop
- 重启： /etc/init.d/shadowsocks restart
- 状态： /etc/init.d/shadowsocks status

## 4.多端口
```json
{
    "server":"0.0.0.0",
    "port_password": {
        "8989": "pass1",
        "8990": "pass2",
    },
    "local_port":1080,
    "method":"aes-256-cfb",
    "timeout":600
}
```


## 自定义user-rule.txt规则
符号: | 
功能: 匹配地址开始和结尾
例子: 
    |http://example.com 匹配以http://example.com开始的地址
    example.com| 匹配以example.com结束的地址

符号: ||
功能: 多地址匹配
例子: 
    ||example.com 表示http|https|ftp://example.com等地址都满足条件

符号: !
功能: 注释
例子: 
    !我是注释

符号: @@
功能: 例外规则
例子:
    @@*.example.com 所有满足*.example.com规则的地址不适用代理
