OSX 命令行
=========


## 禁止mac睡眠等
> caffeinate -u -t 7232

## 加密/解密文件
> openssl enc -aes-256-cbc -e -in /data/file.txt -out /adta/encript.txt  
> openssl enc -aes-256-cbc -d -in /data/file.txt -out /adta/decript.txt  

## 截图
> defaults wripte.com.apple.screencapture type png|jpg|gif|pdf  
