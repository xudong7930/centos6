Nginx使用免费的SSL
=================


## 1.安装相关软件, 生成公钥和私钥 ##
	#安装openssl
	yum -y install openssl

	#下载acme-tiny项目
	git clone https://github.com/diafygi/acme-tiny.git
	cd acme-tiny

	#创建Let's Encrypt私钥
	openssl genrsa 4096 > account.key 
	openssl dhparam 1024 > domain.dhparam

	#创建CSR文件
	openssl genrsa 4096 > domain.key

	#2个域名
	openssl req -new -sha256 -key domain.key -subj "/" -reqexts SAN -config <(cat /etc/pki/tls/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:health-woman.com,DNS:www.health-woman.com")) > domain.csr
		
	#单个域名
	openssl req -new -sha256 -key domain.key -subj "/CN=zufang.f3322.net" > domain.csr

## 2.证明你拥有该域名 ##
	#创建目录
	mkdir -p /var/www/acme-challenges
	
	#编辑nginx.conf文件
	server {
	  	listen  80;

	  	server_name www.yoursite.com;

		if ( $request_uri !~ "/.well-known/acme-challenge/*") {
			return 301 https://www.yoursite.com$request_uri;
		}

		location /.well-known/acme-challenge/ {
			alias /var/www/challenges/;
			try_files $uri =404;
		}

		#你的其他配置
	}

## 3.获取签名证书 ##
	#添加执行权限
	chmod +x acme_tiny.py

	#生成signed.crt文件
	python acme_tiny.py --account-key ./account.key --csr ./domain.csr --acme-dir /var/www/acme-challenge/ > ./signed.crt


## 4.安装证书 ##
	#下载文件
	wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
	
	#合并文件
	cat signed.crt intermediate.pem > chained.pem
	
	# 编辑nginx.conf启用SSL
	server {
	  	listen 443;
	  	server_name yoursite.com www.yoursite.com;
		
		# 启用HSTS
		add_header Strict-Transport-Security "max-age=300; includeSubdomains; preload";

		# 确保不会嵌入到frame 或 iframe
		add_header X-Frame-Options "DENY";

	  	ssl on;
	  	ssl_certificate /root/acme-tiny/chained.pem;
	  	ssl_certificate_key /root/acme-tiny/domain.key;
	  	ssl_session_timeout 5m;
	  	ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
	  	ssl_ciphers ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA;
	  	ssl_session_cache shared:SSL:50m;
	  	ssl_prefer_server_ciphers on;

	  	#...你的其他配置
	}
	
	#重启你的Nginx
	/etc/init.d/nginx restart


### 5.试用https访问你的网站 ###
	https://www.yoursite.com


### 6.定时更新证书 ###
恭喜！你的网站已经使用上了HTTPS。 但[Let's Encrypt官网](https://letsencrypt.org/) 证书有效期只有90天, 所以需要定期更新

新建文件**update_cert.sh**
	
	#!/usr/bin/sh
	
	python /path/to/acme_tiny.py --account-key /path/to/account.key --csr /path/to/domain.csr --acme-dir /var/www/challenges/ > /tmp/signed.crt || exit
	
	#下载
	wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
	
	#合并
	cat /tmp/signed.crt intermediate.pem > /path/to/chained.pem
	
	#重启
	service nginx reload
