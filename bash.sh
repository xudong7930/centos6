
> kill -9 `ps -a | grep php71 | grep -v grep | awk '{print $1}'`

或者

> ps -a | grep php71 | grep -v grep | awk '{print $1}' | xargs kill -9
