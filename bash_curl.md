Linux Curl用法
=============

## 包含header和内容
> curl -i http://ip-api.com/json


## 仅包含header
> curl -I http://ip-api.com/json


## 内容保持为文件
> curl -o ip.json http://ip-api.com/json 


## GET/POST/PUT/DELETE
* curl -X GET https://jsonplaceholder.typicode.com/posts/3
* curl -X POST -d "title=外星人专家质疑五角大楼的UFO证据&body=人家大老远赶了几十光年的路，只为了什么也不干？" https://jsonplaceholder.typicode.com/posts
* curl -X DELETE https://jsonplaceholder.typicode.com/posts/3
* curl -X PUT -d "title=外星人专家质疑五角大楼的UFO证据" https://jsonplaceholder.typicode.com/posts/3


## ftp上传和下载
> **上传:** curl -u user@10.2.20.45:password -T ./ip.json ftp://10.2.20.45/public  

> **下载:** curl -u user@10.2.20.45:password -O ftp://10.2.20.45/public/file.zip 

