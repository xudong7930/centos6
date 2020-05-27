centos免密登陆
============

## 1.在PC/MAC上生成密钥
> ssh-keygen -b 1024 -t rsa 

## 2.传到远程服务器中
- 假设生成的文件在~/.ssh目录下
- 假定远程的用户是root  
- 假定远程主机是vultr

将公钥文件id_rsa.pub内容拷贝到远程
> cat ~/.ssh/id_rsa2.pub | ssh root@vultr \`cat - >> ~/.ssh/authorized_keys\`

## 3. 登陆测试
> ssh -p 22 root@vultr -i ~/.ssh/id_rda2


ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYxy3JH1Mwb7v+zo/WBF9xpFt5Jj/xy+aYXfiHjEBasiskfxbVAEHXiFP2XDCk8UJ+aNMIOr7H/+aJ89OQmOlleoKJEkg08rlSkqurjLB520uZtJv5xs7IsytB0HxlcleWzcXAQsjEBSE5A6ChZmj3MZho+b/hBU2kKwY+2T0PJfQ9LjVOZtVYC7qSrkwLVb5G2ov4JlXI5Q0ufdK76tOHFJKYAQSRslhsl3crhqN+rjw798LGJdpo3LS9bFtzPH8QfIAbBt/Qclot+VyaoksVNdKCwMD6CKZsneU5iFu8nXkc16SI/Oj3fQp+rEg4ed1LTbr78DNFG9+h0imhImwEZ/LqQVwZekgHtu+d5khuOoevdLCMN633w9JKCxQm0yz+hCWuW4jB4FQcvfPHf5V0iwCR2JtBLTLFnlviDykcvhaqlC/49olNxADO2PmYJfoN/DtiCakqTifVtRvHHkDHsmdKt40jbKHuZvyeXgJ/ajtTwZO8hgLe51T38KUULH3mMwFV9JEcEaOAMq+lQDZafdvRoSR5XaJxuH8hGDS9eD2HWhhGTRWILmHZpXykvrL29b9sH1RBnxjaQczl6h46sAsup244acfGjdzG32KtUHg0sxp0C1Z4riIy7IZh2JlUGidNotopKf/lDes/PrZAuOHSPr6+uOoKu7eMfm191w== xudong7930@gmail.com
