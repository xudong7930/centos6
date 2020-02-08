centos 安装htop
==============


# 安装依赖
> yum -y install ncurses-devel

# 下载安装
```
wget -c http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz

tar -zxf htop-2.2.0.tar.gz

cd htop-2.2.0

./configure --prefix=/usr/local/htop 

make && make install

ln -s /usr/local/htop/bin/* /usr/local/bin/

cd ../ && rm -fr htop-2.2.0*
```