##nginx负载均衡的策略

1.轮询（默认）
每个请求按照时间顺序逐一分配到后段服务器，如果后段服务器down了，能自动剔除

2.权重（weight）
weight代表权重，默认1，值越大被分配的客户越多

```conf
  upstream proxy_name {
    server 127.0.0.1:8081 weight=1;
    server 127.0.0.1:8082 weight=1;
    server 127.0.0.1:8083 weight=1;
  }
```

3.ip_hash
每个请求按访问ip的hash结果分配

upstream server_pool {
  ip_hash
  server 127.0.0.1:80;
}

4.fair
按后段服务器的响应时间来分配请求，响应时间短的优先分配
upstream server_pool {
  fair
  server 127.0.0.1:80;
}


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
      # 访问的时候使用代理
      proxy_pass http://proxy_name;

      index index.html;
    }
  }
}


```