## 创建目录
* 

## 下载
docker pull nginx:1.18.0

## 启动
docker run -d --name app_nginx -p 80:80 -p 8080:8080 -v /Users/xudong7930/code:/usr/share/nginx/html -v /Users/xudong7930/docker_data/nginx118/logs:/var/log/nginx nginx:1.18.0


<!-- formac -->
docker run -d --name app_nginx -p 80:80 -p 8080:8080 -v /Users/xd/xudong/code:/usr/share/nginx/html -v /Users/xd/xudong/docker/nginx/logs:/var/log/nginx -v /Users/xd/xudong/docker/nginx/conf.d:/etc/nginx/conf.d nginx:1.18.0
