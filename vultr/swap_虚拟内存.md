添加虚拟内存
==========

##  增加虚拟内存
```
dd if=/dev/zero of=/var/swap_1g bs=1024 count=1024000
mkswap /var/swap_1g
mkswap -f /var/swap_1g
chmod 0600 /var/swap_1g
swapon /var/swap_1g
```

## 开机自动挂载
```
vim /etc/fstab 

#添加一行
/var/swap_1g swap swap defaults 0 0
```

## 清除设置
```
//1.取消
swapoff /var/swap_1g

//2.去掉
删除/etc/fstab文件里上次添加的
```
