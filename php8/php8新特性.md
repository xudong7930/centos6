# php8新特性

```php
// 1.类参数指定类型
class User {
	public float $x = 0.0;
}


// 2.联合类型
public function savePoint(int|float $number): string|false {
	return $number > 0 ? sqrt($number) : false;
}


// 3.注解标签
<<route:/index>>
class Foo {
	<<@inject()>>
	public function foo() {

	}
}


// 4.字符串函数
str_starts_with($a, $b);
str_ends_with($a, $b);
strpos($a, $b);

// 5.catch里面不用写变量
try {
	changeSomething();
} catch(PermissionException) {
	echo "no permission";
}


// 6.万能数据类型
public function foo(mixed $val) {

}


// 7.新增stringable接口
public function foo(string|stringable $str) {

}

// 8.返回static
public function foo(): static {
	return new static();
}
```

9.采用全新的JIT编译引擎，性能翻倍！

