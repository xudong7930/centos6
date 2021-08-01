
# 1. 查看试图暴力破解你的主机ip

> grep "Failed password for invalid user" /var/log/secure | awk '{print $13}' | sort | uniq -c | sort -nr

# 2.加入黑名单

> cat /var/log/secure |  grep "Failed password for invalid user" | awk '{print $13}' | sort | uniq -c | sort -n | tail -10 |awk '{print "sshd:"$2":deny"}' >> /etc/hosts.allow 

# 3.修改SSHD配置，禁止root直接登录

vim /etc/ssh/sshd_config

3-1.查找#PermitRootLogin yes，
将前面的#去掉，“Yes”改为“No”，并保存文件。
3-2.修改 PasswordAuthentication yes/no


# 4.重启sshd服务
systemctl restart sshd.service

