

## 安装nodejs
yum -y install nodejs
node -v

npm install -g n
n stable 


## 安装js项目进程管理
npm install -g pm2
pm2 start app.js
pm2 list

## 通过nginx访问nodejs项目
```nginx
server {
	listen 80;
	server_name www.hsbc.com;
	location / {
		proxy_pass http://127.0.0.1:8081;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;  
		proxy_set_header Host $http_host; 
		proxy_set_header X-Nginx-Proxy true;
		proxy_redirect off;
	}
}
```

## nginx负载均衡
```nginx

upstream roots {
	server 45.32.77.118:8080;
	server 45.32.77.118:8081;
	server 45.32.77.118:8082;
}


server {
	listen 80;
	server_name www.hsbc.com;
	location / {
		proxy_pass http://roots;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;  
		proxy_set_header Host $http_host; 
		proxy_set_header X-Nginx-Proxy true;
		proxy_redirect off;
	}
}
```
