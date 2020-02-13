centos免密登陆
============

## 1.在PC/MAC上生成密钥
> ssh-keygen -b 4096 -t rsa 

## 2.传到远程服务器中
- 假设生成的文件在~/.ssh目录下
- 假定远程的用户是root  
- 假定远程主机是vultr

将公钥文件id_rsa.pub内容拷贝到远程
> cat ~/.ssh/id_rsa2.pub | ssh root@vultr \`cat - >> ~/.ssh/authorized_keys\`

## 3. 登陆测试
> ssh -p 22 root@vultr -i ~/.ssh/id_rda2
