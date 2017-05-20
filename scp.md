scp
===

##目录拷贝
> scp -r -P 22 /tmp/dir root@10.1.1.2/:/tmp/

##文件拷贝
> scp -P 22 /tmp/file.tar.gz root@10.1.1.2/:/tmp/

##免密拷贝
> scp -P 22 -i ~/.ssh/id_rsa /tmp/file.tar.gz root@10.1.1.2:/tmp

##expect配合
```bash
hosts="192.168.1.101###22###root###abc123";
host=(${hosts//###/ })
expect -c "
	spawn scp -r -P ${host[1]} /tmp/dir ${host[2]}@${host[0]}:/tmp/
	expect {
		\"*assword:*\" {
			send \"${host[3]}\r\"
			exp_continue
		}
		\"*es/no)?*\" {
			send \"yes\r\"
			exp_continue	
		}
	}
"
```
