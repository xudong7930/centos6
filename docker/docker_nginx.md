## 创建目录
* 

## 下载
* docker pull nginx

## 启动
docker run -d --name app_nginx -p 80:80 -p 8080:8080 -v /Users/xudong7930/code:/usr/share/nginx/html -v /Users/xudong7930/docker_data/nginx118/logs:/var/log/nginx nginx:1.18.0
