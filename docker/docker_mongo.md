docker mongodb
==============

## make dir
mkdir -p /usr/local/mongodb/data
touch /usr/local/mongodb/mongo.conf

## download
docker pull mongo:latest

## create container
docker run -d --rm -p 27017:27017 --name mongond -v /usr/local/somedocker/mongo/data:/data/db mongo:latest

## stop mysql
docker start|stop|restart mongond
