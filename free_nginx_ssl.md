#Let's Encrypt官网
https://letsencrypt.org/

##克隆acme-tiny
yum -y install openssl
git clone https://github.com/diafygi/acme-tiny.git
cd acme-tiny

##创建Let's Encrypt私钥
openssl genrsa 4096 > account.key

##创建CSR文件
openssl genrsa 4096 > domain.key
openssl req -new -sha256 -key domain.key -subj "/" -reqexts SAN -config <(cat /etc/pki/tls/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:yoursite.com,DNS:www.yoursite.com")) > domain.csr

##证明你拥有该域名
mkdir -p /var/www/challenges

vim /usr/local/nginx/conf/nginx.conf #
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

##获取签名证书
chmod +x acme_tiny.py
python acme_tiny.py --account-key ./account.key --csr ./domain.csr --acme-dir /var/www/challenges/ > ./signed.crt


##安装证书
###for Nginx
wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
cat signed.crt intermediate.pem > chained.pem

vim nginx.conf #配置的Server
	server {
	  listen 443;
	  server_name yoursite.com www.yoursite.com;

	  ssl on;
	  ssl_certificate /path/to/chained.pem;
	  ssl_certificate_key /path/to/domain.key;
	  ssl_session_timeout 5m;
	  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
	  ssl_ciphers ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA;
	  ssl_session_cache shared:SSL:50m;
	  ssl_prefer_server_ciphers on;

	  #...你的其他配置
	}

/etc/init.d/nginx restart


###测试
https://www.yoursite.com


###定时更新证书
恭喜！你的网站已经使用上了HTTPS。 但Let's Encrypt 证书有效期只有90天, 所以需要定期更新
vim update_cert.sh #添加如下内容:
	#!/usr/bin/sh
	python /path/to/acme_tiny.py --account-key /path/to/account.key --csr /path/to/domain.csr --acme-dir /var/www/challenges/ > /tmp/signed.crt || exit
	wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
	cat /tmp/signed.crt intermediate.pem > /path/to/chained.pem
	service nginx reload
