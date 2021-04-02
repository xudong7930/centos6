# brew

## 安装homebrew
wget http://homebrew.org/download/install.sh

## 安装包
* brew search "keyword" "搜索软件"
* brew info wget "查看wget的信息"
* brew install wget "安装指定包"
* brew uninstall wget "卸载指定包"
* brew list wget "列出指定包的安装情况"

## 更新包
* brew outdated "查看过期的包"
* brew list "列出已安装的包"
* brew upgrade wget "更新指定的包"
* brew upgrade “更新所有的包”

## 其他命令
* brew config "显示包配置"
* brew doctor "诊断brew"
* brew cleanup  “删除过期的包”
* brew prune “删除_usr_local无效的链接”
* brew update “更新homebrew”

## 推荐的包
* brew install wget htop cocoapods php71 node python3 openssl sqlite



## 国内缘

https://mirror.tuna.tsinghua.edu.cn/help/homebrew/

```bash
# 替换brew.git:
cd "$(brew --repo)"
git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git
# 替换homebrew-core.git:
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git
# 应用生效
brew update
# 替换homebrew-bottles:
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile
```