```shell
$redis = new \Predis\Client;
$redis->set(key, value, expireResolution, ttl, flag);

key: 键
value: 值
expireResolution: 过期策略
	EX -- Set the specified expire time, in seconds. 秒
	PX -- Set the specified expire time, in milliseconds. 毫秒
	NX -- Only set the key if it does not already exist. 不存在则设置
	XX -- Only set the key if it already exist. 存在则设置
ttl: 过期时间
flag: 

```

