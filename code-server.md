

# docker安装
docker run -itd --name my-code -u root -p 80:8080 -v /root/coder:/home/coder/project -e PASSWORD=123456 codercom/code-server:latest --auth password

