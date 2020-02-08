# npm

## 常用命令
* npm -g list --depth=0  查看全局安装了哪些包
* npm -g uninstall gitbook-cli  卸载全局安装的包
* npm -g install npm  更新npm自己
* npm -g install vuex
* npm -g dedupe  重新计算包的依赖关系

### 包更新
* npm view webpack versions --json "查看指定包的所有版本"
* npm dist-tags ls vue-router  "查看指定包最新发布版本"
* npm info vue-router "查看指定包的信息"
* npm -g outdated "查看全局包是否有更新"
* npm -g update vue-router "更新指定的包"
* npm cache clean  清除npm本地缓存

## 配置管理  
### npmrc配置文件
* 每个项目配置文件(/path/to/my/project/.npmrc)
* 每个用户配置文件(~/.npmrc)
* 全局配置文件($PREFIX/etc/npmrc)
* npm构建配置文件(/path/to/npm/npmrc)

### npm配置命令
* npm config ls -l   查看详细配置
* npm config ls    查看配置


## 全局包
* npm -g i vue-cli webpack  
* npm init -y 生成package.json文件



# 常用包
npm.install -D jquery@3.4.1







































