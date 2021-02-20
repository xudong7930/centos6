```conf
http {
  # 创建一个代理
  upstream proxy_name {
    server 127.0.0.1:8081 weight=1;
    server 127.0.0.1:8082 weight=1;
    server 127.0.0.1:8083 weight=1;
  }

  server {
    listen 80;
    server_name ehd4.f3322.net;
    location / {
      root /www;
      index index.html;

      # 访问的时候使用代理
      proxy_pass http://proxy_name;
    }
  }
}


```