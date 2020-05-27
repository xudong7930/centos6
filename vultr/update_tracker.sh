#!/bin/bash
cd /tmp
list=`wget -qO- https://trackerslist.com/all_aria2.txt`
sed -i "s@bt-tracker=.*@bt-tracker=$list@g" /etc/aria2/aria2.conf
rm -fr /tmp/all_aria2.txt
