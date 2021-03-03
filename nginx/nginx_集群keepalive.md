两台nginx服务器：
  192.168.1.100(主)
  192.168.1.101（从）


# 在192.168.1.100上

yum -y install keepalived

vim /etc/keepalived/keepalived.conf

```s
# 全局配置
global_defs {
   notification_email {
     acassen@firewall.loc
     failover@firewall.loc
     sysadmin@firewall.loc
   }
   notification_email_from Alexandre.Cassen@firewall.loc
   smtp_server 192.168.200.1
   smtp_connect_timeout 30
   router_id LVS_DEVEL
   vrrp_skip_check_adv_addr
   vrrp_strict
   vrrp_garp_interval 0
   vrrp_gna_interval 0
}

vrrp_instance VI_1 {
    #主服务器上Master，从服务器上BACKUP
    state MASTER
    # 网卡
    interface eth0
    # 主机备用机上的ID必须一致
    virtual_router_id 51
    #优先级，主服务器上的优先级较大
    priority 100

    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        #虚拟地址，可多个
        192.168.200.16
    }
}
```
service nginx start
service keepalived start


# 在  192.168.1.101（从）上
yum -y install keepalived

vim /etc/keepalived/keepalived.conf
```s
```s
# 全局配置
global_defs {
   notification_email {
     acassen@firewall.loc
     failover@firewall.loc
     sysadmin@firewall.loc
   }
   notification_email_from Alexandre.Cassen@firewall.loc
   smtp_server 192.168.200.1
   smtp_connect_timeout 30
   router_id LVS_DEVEL
   vrrp_skip_check_adv_addr
   vrrp_strict
   vrrp_garp_interval 0
   vrrp_gna_interval 0
}

vrrp_instance VI_1 {
    state BACKUP
    # 网卡
    interface eth0
    # 主机备用机上的ID必须一致
    virtual_router_id 51
    #优先级，主服务器上的优先级较大
    priority 90

    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        #虚拟地址，可多个
        192.168.200.16
    }
}
```
service nginx start
service keepalived start


# 测试
1.访问虚拟地址：
http://192.168.200.16

2.断开一台机子再访问