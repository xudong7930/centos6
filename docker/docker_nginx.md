## 创建目录
* 

## 下载
* docker pull nginx

## 启动
* docker run -d --name nginxnd -p 80:80 -v /usr/local/www:/usr/local/www -v /usr/local/somedocker/nginx/nginx.conf:/etc/nginx/nginx.conf:ro nginx:latest nginx-debug -g "daemon off;"
