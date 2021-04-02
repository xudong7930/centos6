# php7新特性

```php

// 1.字符串数组直接访问
echo "hello"[0];

// 2.新的密码校验函数
$str = '123456';
$hash = password_hash($str, PASSWORD_DEFAULT); //加密
$s = password_verify($str, $hash); //校验
var_dump($s);


// 3.异常处理增加了finally
try {
	echo 111;
} catch (Exception $e) {
	echo 222;
} finally {
	echo 333;
}


// 4.生成器（ generator），专门为了处理大数组和携程通信
function xrange($start, $end, $steps=1) {
	for ($i=$start; $i < $end; $i+=$steps) { 
		yield $i;
	}
} 

foreach(xrange(1, 10) as $item) {
	echo $item;
}

// 5.可变参数
function test(...$args) {
	var_dump($args);
}

test(1,2,3,4,5);


// 6.幂运算
echo pow(2,3);
echo 2**3;


// 7.常量数组
const ORDER_STATUS = [
	'ORDER_CANCEL' => 0,
	'ORDER_SUCCESS' => 1
];

echo ORDER_STATUS['ORDER_SUCCESS'];

// 8.函数参数类型限制
function do_job(int $a) {

}
```