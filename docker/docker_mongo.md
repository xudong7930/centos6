docker mongodb
==============

## make dir
mkdir -p /usr/local/mongodb/data
touch /usr/local/mongodb/mongo.conf

## download
docker pull mongo:latest

## create container
docker run -d --rm -p 30019:27017 -v /usr/local/mongodb/data:/data/db --name mongond mongo 

## stop mysql
docker start|stop|restart mongond
