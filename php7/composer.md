加速composer的下载: 
composer global require "hirak/prestissimo:^0.3"

查看全局包:
composer global show

更新composer:
composer self-update


# composer阿里云

```s
#全局配置:
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
composer config -g repos.packagist composer https://mirrors.cloud.tencent.com/composer/

#取消全局配置:
composer config -g --unset repos.packagist

#调试
composer self-update
composer diagnose
compose clear
composer update --lock
```
