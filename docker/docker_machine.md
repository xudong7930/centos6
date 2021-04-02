docker machine
==============

Create and manage machines running Docker.
使用docker-machine在所有工作台上创建docker容器
[Docker Machine](https://github.com/docker/machine/releases)

## 常用命令
* docker-machine ls "列出已有machine"
* docker-machine version "查看版本"
* docker-machine config "查看machine的连接"
* docker-machine ip machine_name "查看指定machine的IP"
* docker-machine start|stop|restart|status|kill machine_name "查看指定machine的状态"
* docker-machine env machine_name "查看指定machine的环境变量"
* docker-machine url machine_name "查看指定machine的url地址"
* docker-machine upgrade machine_name "升级指定的machine Boot2Docker.iso"
* docker-machine ssh machine_name "登录到指定machine"
* docker-machine scp ./centos6/my.cnf default:/tmp "文件复制"
* docker-machine regenerate-certs machine_name "重新生成登录machien的密钥"
* docker-machine reprovision machine_name "重新上传密钥到双方的机子里"
* docker-machine rm machine_name "删除machine"
* docker-machine inspect machine_name "json显示machine的信息"

## 创建machine
* docker-machine create -d driver_name machine_name "使用boot2docker.iso创建"
* docker_machine create -d generic --generic-ip-address=203.0.113.81 --generic-ssh-key ~/.ssh/id_rsa --generic-ssh-user=root --generic-ssh-port=30011 mywebapp "使用现有的主机创建"

[支持的驱动](https://docs.docker.com/machine/drivers/):

* Amazon Web Services
* Microsoft Azure
* Digital Ocean
* Exoscale
* Google Compute Engine
* Generic
* Microsoft Hyper-V
* OpenStack
* Rackspace
* IBM Softlayer
* Oracle VirtualBox
* VMware vCloud Air
* VMware Fusion
* VMware vSphere
* VMware Workstation (unofficial plugin, not supported by Docker)
* Grid 5000 (unofficial plugin, not su

