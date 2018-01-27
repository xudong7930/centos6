PHP安全
======


## 1. 包含文件的扩展名
```
<?php
require "db.inc" // bad
requrie "db.inc.php" // good
```

## 2.XSS(cross-site scripting)
对用户的输入进行过滤
```php
htmlspecialchars($string)
```

## 3.对密码加密
```PHP
password_hash('123', PASSWORD_DEFAULT, ['cost'=>12]);
password_verify('123', $hash);
```

## 4.禁止列出目录
在跟目录添加.htaccess,内容:
> Options -Indexes

## 5.httponly-Cookie
> httponly只能在serer端$_COOKIE获取,不能再浏览器端document.cookie获取
> 不存储敏感数据, 或对数据进行加密
> setcookie('key', 'value', time()+100, '/', 'example.com', secure=false, httponly=true);

## 6.CSRF(cross-site request forgery),跨站点请求伪造
> 生成随机字符串: bin2hex(random_bytes(16))  
```php
<?
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_POST['_token']) || ($_POST['_token'] !== $_SESSION['_token'])) {
        die('invalid csrf token');
    }

    // do other thing.
}

$_SESSION['_token'] = bin2hex(random_bytes(16));
?>

<form action="/" method="POST">
    <input type="text" name="email">
    <input type="hidden" name="_token" value="<?php echo $_SESSION['_token'];?>">
    <input type="submit" value="submit">
</form>
```

## 7. 动态的包含文件
```php
$content = $_GET['show'];
$allowed = ['db', 'conf'];
if (in_array($content, $allowed)) {
    file_get_contents('app/{$content}.php');
}
```

## 8. sql injection

## 9. error report
```
ini_set('display_errors', 'Off');
error_reporting(0);
```