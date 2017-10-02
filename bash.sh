kill -9 `ps -a | grep php71 | grep -v grep | awk '{print $1}'`
