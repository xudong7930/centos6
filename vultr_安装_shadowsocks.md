Vultr安装Shadowsocks
===================


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
- 启动：/etc/init.d/shadowsocks start
- 停止：/etc/init.d/shadowsocks stop
- 重启：/etc/init.d/shadowsocks restart
- 状态：/etc/init.d/shadowsocks status

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
