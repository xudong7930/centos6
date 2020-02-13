# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# oh-my-zsh安装路径.
export ZSH=/Users/xudong7930/.oh-my-zsh
export XDEBUG_CONFIG="idekey=VSCODE"

#php-language-server
export PHPLS_ALLOW_XDEBUG=1

# 主题设置: pygmalion,robbyrussell, af-magic, steeef, ys, jonathan, Candy, cloud
; ZSH_THEME="ys"
ZSH_THEME="robbyrussell"

# 区分大小写: true,false
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Casesensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# 自动更新检查天数.
export UPDATE_ZSH_DAYS=14

# 禁用ls命令显示颜色.
# DISABLE_LS_COLORS="true"

# 禁用自动设置终端标题.
# DISABLE_AUTO_TITLE="true"

# 启动命令自动纠正.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command outp ut.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ZSH插件: git,zsh-autosuggestions
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# 设置终端编码环境
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8  

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# 禁用更新的弹出提示
# DISABLE_UPDATE_PROMPT=true

# 禁用自动更新
# DISABLE_AUTO_UPDATE=false


#############
## 别名设置 ##
############
# 1.OSX

#2019年08月01日
alias mac.version="sw_vers && uname -a"
alias ssh.nopass="ssh-add -K ~/.ssh/id_rsa"

#2019年07月22日
alias sort.cpu="ps -Ao user,pid,pcpu,comm -r | head -n 16"
alias sort.mem="ps -Amo user,pid,pmem,comm -r | head -n 16"

#时间戳
alias date.timestamp="date '+%s'"
alias date.now="date '+%Y-%m-%d %H:%M:%S'"


#压缩无密码
alias zip.nopass="zip -rq0"

#压缩有密码
alias zip.pass="zip -rq0 -P 'a'"
alias xdebug.status="php -v"
alias xdebug.down="mv /usr/local/etc/php/7.3/conf.d/ext-xdebug.ini /usr/local/etc/php/7.3/conf.d/ext-xdebug.inn"
alias xdebug.up="mv /usr/local/etc/php/7.3/conf.d/ext-xdebug.inn /usr/local/etc/php/7.3/conf.d/ext-xdebug.ini"
alias grep="grep --color=auto"
alias ip="ipconfig getifaddr en0"
alias ip.out="curl cip.cc"
alias cp="cp -i"
alias dns="ipconfig getpacket en0 | grep domain_name_server | cut -d ':' -f 2 | sed 's/{//g'| sed 's/}//g' | sed 's/^[ \t]*//g' |  sed 's/[ \t]*$//g'"
alias clear.trash="sudo rm -fr ~/.Trash/*"
alias clear.paste="pbcopy < /dev/null"
alias clear.log="sudo rm -fr /private/var/log/asl/*.asl /private/var/log/DiagnosticMessages/*.asl /private/var/log/system.log.*.gz /private/var/log/opendirectoryd.log.* /private/var/log/wifi.log.*.bz2 /private/var/log/powermanagement/*.asl"
alias mk_pass='LC_ALL=C tr -dc "[:alpha:][:alnum:]" < /dev/urandom | head -c 20'
alias show_hide='defaults write com.apple.finder AppleShowAllFiles -bool true; KillAll Finder'
alias show_nohide='defaults write com.apple.finder AppleShowAllFiles -bool false;KillAll Finder'
alias cls="clear"
alias ikill="kill -9"
alias wgetc="wget -c"
alias tree="tree -L 1"
alias coffee="caffeinate -i -t"
alias kill.usb="sudo killall -STOP -c usbd"
alias ej="diskutil eject /dev/disk2"
alias jt="screencapture -i ~/Desktop/IMG_`date +%Y%m%d_%H%M%S`.png"
alias jt_window="screencapture -w ~/Desktop/IMG_`date +%Y%m%d_%H%M%S`.png"
alias now="date +%Y-%m-%d:%H:%M:%S"
alias now_time="date +%s"
alias wifi_pass="security find-generic-password -D "AirPort network password" -gw -a EHD8"
alias wifi_off="networksetup -setairportpower en0 off"
alias wifi_on="networksetup -setairportpower en0 on"
alias dhcp="ipconfig getpacket en0"
alias dhcp_renew="sudo ipconfig set en0 DHCP"
alias sys_usb="ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*'"
alias sys_version="sw_vers"
alias sys_hardware="system_profiler SPHardwareDataType"
alias sys_camera="system_profiler SPCameraDataType"
alias sys_os="system_profiler SPSoftwareDataType"

alias port="echo 'a' | sudo -S lsof -nP -iTCP -sTCP:LISTEN"
alias rebuild="source ~/.zshrc && source ~/.npmrc && source ~/.vimrc && source ~/.gemrc"
alias dsize="du -sh"
alias ip6_disable="networksetup -setv6off Wi-Fi"
alias ip6_enable="networksetup -setv6automatic Wi-Fi"
alias scp_upload="scp -P 30022 -i ~/.ssh/id_rsa ./app.png www@10.20.9.55:/home/www"
alias scp_download="scp -P 30022 -i ~/.ssh/id_rsa www@10.20.9.55:/home/www/file.zip ./"

# 2.创建文件
alias mf_composer='echo {} > composer.json'

# 3.Laravel和Composer
alias phpser="php -S 0.0.0.0:80"
alias ss="php -S 0.0.0.0:8100"
alias ss.chrome="chrome http://127.0.0.1:8100"
alias ss.py="python3 -m http.server"

alias pa.clear="php artisan config:clear;php artisan view:clear;php artisan route:clear; php artisan cache:clear; php artisan clear-compiled"
alias pa.cls="php artisan config:clear;php artisan view:clear;php artisan route:clear; php artisan cache:clear; php artisan clear-compiled"
alias lal56="composer create-project --prefer-dist 'laravel/laravel=5.6.*'"
alias lal="composer create-project --prefer-dist 'laravel/laravel'"
alias lal6="composer create-project --prefer-dist 'laravel/laravel=6.*'"

alias cmp="composer"
alias cmp.outdated="composer outdated -D"
alias cmp.show="composer show"
alias cmp.init="composer init"
alias cmp.update_self="composer self-update"
alias cmp.update_package="composer update --with-dependencies"
alias cmp.dump="composer dumpautoload"
alias cmp.dump_optimize="composer dumpautoload -o"
alias cmp.clear="composer clearcache"
alias cmp.install="composer require"
alias cmp.install_dev="composer require --dev"
alias cmp.use_repo_china="composer config -g repo.packagist composer https://packagist.phpcomposer.com"
alias cmp.use_repo_usa="composer config repo.packagist composer https://packagist.org"

alias cmpg="composer global"

# Laravel Package
alias cmp_passport="composer require laravel/passport"
alias cmp_image="composer require intervention/image"
alias cmp_excel="composer require maatwebsite/excel:~2.1.0"
alias cmp_pdf="composer require barryvdh/laravel-dompdf"
alias cmp_uuid="composer require webpatser/laravel-uuid"
alias cmp_debugbar="composer require barryvdh/laravel-debugbar --dev"
alias cmp_devpkg="composer require jeroen-g/laravel-packager"
alias cmp_cors="composer require barryvdh/laravel-cors"
alias cmp_guzzle="composer require guzzlehttp/guzzle"
alias cmp_homestead="composer require laravel/homestead --dev"
alias cmp_dusk="composer require laravel/dusk --dev"
alias cmp_mock="composer require "mockery/mockery":~1.0 --dev"
alias cmp.redis="composer require predis/predis"

# 4.phpspec
alias spec_run="phpspec run -fpretty";
alias spec_new="phpspec describe";

alias mk_sqlite="touch ./database/database.sqlite"
alias rm_sqlite="rm -fr ./database/database.sqlite"

alias mk_acme="mkdir -p app/Acme/Services app/Acme/Traits app/Acme/Fractals && touch app/Acme/helper.php"
alias pa="php artisan"
alias pav="php artisan --version"
alias pa_env="php artisan env"
alias pat="php artisan tinker"
alias pak="php artisan key:generate"
alias tinker="php artisan tinker"
alias pas="php artisan serve --host=0.0.0.0 --port=8100"
alias pam="php artisan migrate";
alias pam_fresh="php artisan migrate:fresh";
alias pam_refresh="php artisan migrate:refresh";
alias pam_seed="php artisan migrate:refresh --seed";
alias pa_seed="php artisan db:seed";
alias pam_reset="php artisan migrate:reset";
alias pa_eg="php artisan event:generate"
alias paeg="php artisan event:generate"
alias pavp="php artisan vendor:publish --force"
alias pavp_passport="php artisan vendor:publish --force --tag=passport-components"
alias pavp_paginate="php artisan vendor:publish --force --tag=laravel-pagination"
alias pavp_mail="php artisan vendor:publish --force --tag='laravel-mail'"
alias pa_route="php artisan route:list"
alias pa_seed="php artisan db:seed"
alias pa_fixpermit="sudo chgrp -R _www storage bootstrap/cache && sudo chmod -R ug+rwx storage bootstrap/cache"
alias pa_schedule="php artisan schedule:run"
alias pa.log="echo > storage/logs/laravel.log;tail -f storage/logs/laravel.log"

# 5.phpunit
alias phptest_update="wget https://phar.phpunit.de/phpunit.phar && chmod +x phpunit.phar && mv phpunit.phar /usr/local/bin/phpunit && phpunit --version"
alias phptest="phpunit --colors=always"
alias phptest_filter="phpunit --colors=always --filter"
alias phptest_version="phpunit --version"

alias mk_controller="php artisan make:controller"
alias mk_controller_resource="php artisan make:controller -r"
alias mk_model="php artisan make:model -mf"
alias mk_middleware="php artisan make:middleware"
alias mk_mail="php artisan make:mail"
alias mk_notification="php artisan make:notification"
alias mk_migration="php artisan make:migration"
alias mk_command="php artisan make:command"
alias mk_seeder="php artisan make:seeder"
alias mk_job="php artisan make:job"
alias mk_request="php artisan make:request"
alias mk_provider="php artisan make:provider"
alias mk_factory="php artisan make:factory"
alias mk_policy="php artisan make:policy"
alias mk_event="php artisan make:event"
alias mk_listener="php artisan make:listener"
alias mk_test="php artisan make:test"
alias mk_test_unit="php artisan make:test --unit"
alias mk_acme="mkdir -p app/Acme"
alias mk_resource="php artisan make:resource"


# node & npm
alias node="node --harmony"
alias npm.init="npm init -y"
alias npm.list="npm list --depth=0"
alias npm.clear="npm cache clean"

alias npm.dev="npm run dev"
alias npm.prd="npm run prd"
alias npm.build="npm run build"
alias npm.watch="npm run watch"
alias npm.test="npm run test"

alias npm.remove="npm uninstall"
alias npm.update="npm update"
alias npm.install_dev="npm install --save-dev"
alias npm.install="npm install --save"
alias npm.selfupdate="npm update npm -g"

alias npm.info="npm info"

alias npm_webpack="npm install -D babel-loader babel-core babel-preset-env"
alias npm_babelenv="npm install -D babel-preset-env"

# vue
alias vue_init="vue init webpack"
alias vue_simple="vue init webpack-simple"

# chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome.hide="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --incognito"


# SSH
alias ssh.key="cat ~/.ssh/id_rsa2.pub | pbcopy && echo 'ssh key copyed to clipboard!'"
alias vultr="ssh -p 30022 -i ~/.ssh/id_rsa root@vultr"

alias sftp.vultr="code -r ~/Public/xudong/sftp_vultr"
alias sftp.vagrant="code -r ~/Public/xudong/sftp_vagrant"

alias zshrc="subl ~/.zshrc"
alias vimrc="subl ~/.vimrc"
alias hosts="subl /etc/hosts"

# for simple file
alias hi.run="subl ~/Public/Xudong/code_runner"
alias hi="subl ~/Public/Xudong/code_runner"
alias php.ini="subl /usr/local/etc/php"
alias s.new="s --new-window"
alias php71="/usr/bin/php"
alias doc.laravel="subl ~/code/doc.Laraveldoc"
alias doc.centos="subl ~/code/doc.Centos6"

#mysql
alias mysql.cnf="subl /usr/local/mysql/etc/my.cnf"
alias mysql.connect="/usr/local/mysql/bin/mysql -u root -pabc123"
alias mysql.run="/usr/local/mysql/bin/mysql -u root -pabc123 -e"
alias mysql.log="sudo cat /usr/local/mysql/data/mysqld.local.err"
alias mysql.up="echo 'a' | sudo /usr/local/mysql/support-files/mysql.server start"
alias mysql.down="echo 'a' | sudo /usr/local/mysql/support-files/mysql.server stop"


#路径导航
alias go.snippet="cd /Users/xudong7930/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets && code ."
alias s.snippet="cd /Users/xudong7930/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets && code ."
alias go.xd="cd  ~/Public/xudong && ls"
alias go.down="cd ~/Downloads && ls"
alias go.desk="cd ~/Desktop && ls"
alias go.code="cd ~/code && ls"
alias go.va="cd ~/Public/xudong/vagrant_box/homestead && ls"
alias go.laravel="cd ~/code/laravel56 && ls"

# git
alias git.test_github="ssh -T git@github.com"
alias git.config_edit="subl ~/.gitconfig"
alias git.config="git config --list"

alias git.status="git status"
alias gs="git status"

alias git.log="git log --oneline --decorate --color"
alias git.log_all="git log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)'"

#查看项目打包
alias git.tag="git tag"

#查看项目pull和push地址
alias git.remote_url="git remote -v"


# Homestead: Laravel项目开发环境虚拟机
function homestead() {{ cd ~/Public/homestead && vagrant $* }}
alias hm="homestead"
alias hm.up="homestead up"
alias hm.down="homestead halt"
alias hm.reload="homestead reload --provision"
alias hm.delete="homestead destroy"
alias hm.boxlist="homestead box list"
alias hm.status="homestead status"
alias hm.port="homestead port"
alias hm.ssh="homestead ssh"

# Deployer: PHP项目部署工具
alias dep="/usr/local/bin/deployer"
alias dep_local="deployer deploy develop"
alias dep_test="deployer deploy test"
alias dep_ready="deployer deploy ready"
alias dep_product="deployer deploy product"

# Homebrew: system package manager
export HOMEBREW_NO_AUTO_UPDATE=true
alias brew.update_self="brew update"
alias brew.upgrade="brew upgrade"
alias brew.search="brew search"
alias brew.install="brew install"
alias brew.remove="brew remove"
alias brew.config="brew config"
alias brew.clear="brew cleanup"
alias brew.list="brew list"
alias brew.list_tree="brew deps --installed --tree"
alias brew.outdated="brew outdated"
alias brew.service="brew services list"

# redis
alias redis.up="brew services start redis"
alias redis.down="brew services stop redis"
alias redis.connect="/usr/local/bin/redis-cli -h 127.0.0.1 -p 6379 -a 123456"
alias redis.conf="subl /usr/local/etc/redis.conf"

alias mongo.up="brew services start mongodb"
alias mongo.down="brew services stop mongodb"

alias phpfpm.up="brew services start php"
alias phpfpm.down="brew services stop php"


alias nginx.up="nginx -t && brew services start nginx"
alias nginx.reload="nginx -t && nginx -s reload"
alias nginx.down="nginx -t && brew services stop nginx"
alias nginx.conf="/usr/local/bin/subl /usr/local/etc/nginx/servers/"
alias dev.up="nginx.up && php56.up && mysql.up"
alias dev.down="nginx.down && php56.down && mysql.down"

alias how_to_use="/usr/local/bin/tldr -p=osx"

# vagrant
alias va="vagrant"
alias va.up="vagrant up"
alias va.down="vagrant halt"
alias va.status="vagrant status"
alias va.ssh="vagrant ssh"
alias va.port="vagrant port"
alias va.connect="ssh -p 22 vagrant@172.16.1.10 -i ~/Public/xudong/vagrant_box/homestead/.vagrant/machines/devserver2/virtualbox/private_key -o UserKnownHostsFile=/dev/null"

alias vagrant_version="/usr/local/bin/vagrant version"
alias vagrant_delete="vagrant destroy"
alias vagrant_box_list="vagrant box list"
alias vagrant_box_remove="vagrant box remove"

# laravel/Envoy
alias envoy_init="envoy init"
alias envoy_list="envoy tasks"
alias envoy_run="envoy run"

# composer & brew & path
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 2019年09月02日14:16:13
alias screen.list="screen -ls"
alias screen.new="screen -S "
alias screen.go="screen -r "

# php 版本切换
alias php.version_5.6="brew unlink php && brew link --force --overwrite php@5.6"
alias php.version_7.3="brew unlink php@5.6 && brew link --force --overwrite php"

# 2019年09月23日09:57:18
alias php56.up="brew services start php@5.6"
alias php56.down="brew services stop php@5.6"
alias php56.reup="brew services restart php@5.6"
