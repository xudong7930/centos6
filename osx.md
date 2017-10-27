OSX 命令行
=========

# 禁止osx自带的apache
停止:
> sudo apachectl -k stop

关闭自启:
> sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist

## 禁止mac睡眠等
> caffeinate -u -t 7232

## 加密/解密文件
> openssl enc -aes-256-cbc -e -in /data/file.txt -out /adta/encript.txt  
> openssl enc -aes-256-cbc -d -in /data/file.txt -out /adta/decript.txt  

## 截图
> defaults wripte.com.apple.screencapture type png|jpg|gif|pdf  

## TextEdit设置text模式
>  defaults write com.apple.TextEdit RichText -int 0  

## 创建100MB空文件
> mkfile 100m /tmp/10mfile  

## when using ssd
> sudo pmset -a sms 0  

##修复/下的文件权限
> sudo diskutil repairPermissions /  

##隐藏文件夹
> chflags hidden /path/to/folder/  

## 显示所有的文件扩展名
> defaults write -g AppleShowAllExtensions -bool true  

## 显示隐藏文件
> defaults write com.apple.finder AppleShowAllFiles true  

## 在Finder中显示文件全路径
> defaults write com.apple.finder _FXShowPosixPathInTitle -bool true  

## 在Finder中显示路径Bar
> defaults write com.apple.finder ShowPathbar -bool true  

## show status bar in finder
> defaults write com.apple.finder ShowStatusBar -bool true  

## do not create .DS_Store file
> defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true  
> defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true  

## 列出所有硬件端口
> networksetup -listallhardwareports  

## 剩余电量百分比
> pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';'  

## 电量剩余时间
> pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f3 -d';'  

## 显示连接设备UUID
> system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' -e '/iPhone/,/Serial/p'  

## 显示器信息
> system_profiler SPDisplaysDataType | grep Resolution  

## CPU
> sysctl -n machdep.cpu.brand_string  

## 阻止系统1小时休眠
> caffeinate -u -t 3600  

## 显示所有的电源管理设置
> sudo pmset -g  

## 关闭休眠
> sudo systemsetup -setcomputersleep Never  

## 充电时候的声音
> defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && open /System/Library/CoreServices/PowerChime.app  

## 重新申请IP
> sudo ipconfig set en0 DHCP  

## DHCP信息
> ipconfig getpacket en0  

## 清除DNS缓存
> sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder  

## 设置主机名
```bash
sudo scutil --set ComputerName "newhostname" && \
sudo scutil --set HostName "newhostname" && \
sudo scutil --set LocalHostName "newhostname" && \
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "newhostname"
```

## Networking
> ping -o github.com  
> traceroute github.com  

## 禁用远程登录
> sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist  

## 加入WIFI
> networksetup -setairportnetwork en0 WIFI_SSID WIFI_PASSWORD  

## 当前WIFI信息
> /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I  

## 当前IP
> ipconfig getifaddr en0  

## 当前WIFI密码
> security find-generic-password -D "AirPort network password" -a "EHD8" -gw  

## 打开WIFI
> networksetup -setairportpower en0 on  

## 生成强密码
> LC_ALL=C tr -dc "[:alpha:][:alnum:]" < /dev/urandom | head -c 20 | pbcopy  

## 在当前目录下查找文件并删除
> find . -type f -name '*.DS_Store' -ls -delete  

## 重启/关机
> sudo reboot  
> sudo poweroff  

## 系统版本
> sw_vers  

## 登录屏幕文字
> sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Your text"  

## 清除内存缓存
> sudo purge  

## 禁用root
> dsenableroot -d  
