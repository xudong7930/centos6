# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# oh-my-zsh安装路径.
export ZSH=/Users/xudong7930/.oh-my-zsh

# 主题设置: pygmalion,robbyrussell, af-magic, steeef, ys, jonathan, Candy, cloud
ZSH_THEME="ys"

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

# ZSH插件: git
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# 设置终端编码环境
export LANG=en_US.UTF-8

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
DISABLE_AUTO_UPDATE=true


#############
## 别名设置 ##
############
# 1.OSX
alias asc2="ascii || man ascii"
alias grep="grep --color=auto"
alias ip="ipconfig getifaddr en0"
alias ipo="curl cip.cc"
alias dns="ipconfig getpacket en0 | grep domain_name_server | cut -d ':' -f 2 | sed 's/{//g'| sed 's/}//g' | sed 's/^[ \t]*//g' |  sed 's/[ \t]*$//g'"
alias clear_trash="sudo rm -fr ~/.Trash/*"
alias clear_log="sudo rm -fr /private/var/log/asl/*.asl /private/var/log/DiagnosticMessages/*.asl /private/var/log/system.log.*.gz /private/var/log/opendirectoryd.log.* /private/var/log/wifi.log.*.bz2 /private/var/log/powermanagement/*.asl"
alias mk_pass='LC_ALL=C tr -dc "[:alpha:][:alnum:]" < /dev/urandom | head -c 20'
alias show_hide='defaults write com.apple.finder AppleShowAllFiles -bool true; KillAll Finder'
alias show_nohide='defaults write com.apple.finder AppleShowAllFiles -bool false;KillAll Finder'
alias cls="clear"
alias ikill="kill -9"
alias wgetc="wget -c"
alias tree="tree -L 1"
alias coffee="caffeinate -i -t"
alias disk_list="diskutil list"
alias disk_info_1="diskutil info /dev/disk1"
alias disk_info_2="diskutil info /dev/disk2"
alias disk_eject="diskutil eject /dev/disk2"
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

alias port="sudo lsof -nP -iTCP -sTCP:LISTEN" # 列出开放的端口
alias rebuild="source ~/.zshrc && source ~/.npmrc && source ~/.vimrc && source ~/.gemrc"
alias dsize="du -sh"
alias ip6_disable="networksetup -setv6off Wi-Fi"
alias ip6_enable="networksetup -setv6automatic Wi-Fi"
alias scp_upload="scp -P 30022 -i ~/.ssh/id_rsa ./app.png www@10.20.9.55:/home/www"
alias scp_download="scp -P 30022 -i ~/.ssh/id_rsa www@10.20.9.55:/home/www/file.zip ./"

# 2.创建文件
alias mf_ignore="echo \"node_modules\nvendor\n.vscode\n.env\n.git\n.svn\n.idea\n.DS_Store\" > .gitignore"
alias mf_babelrc='echo { \"presets\": [\"env\"] \} > .babelrc'
alias mf_composer='echo {} > composer.json'
alias mf_favicon="touch favicon.ico"

# 3.Laravel和Composer
alias php71="/usr/local/opt/php71/bin/php"
alias phpser="php -S 0.0.0.0:80"
alias ss="php -S 0.0.0.0:8100"
alias sqladm="php -S 0.0.0.0:8200 -t /Users/xudong7930/Public/sqladmin"
alias pa_clear="composer dumpautoload;php artisan view:clear;php artisan route:clear; php artisan cache:clear; php artisan clear-compiled;php artisan key:generate"
alias lal56="composer create-project --prefer-dist 'laravel/laravel=5.6.*'"
alias lal55="composer create-project --prefer-dist 'laravel/laravel=5.5.*'"
alias lal54="composer create-project --prefer-dist 'laravel/laravel=5.4.*'"
alias lal53="composer create-project --prefer-dist 'laravel/laravel=5.3.*'"
alias lal="composer create-project --prefer-dist 'laravel/laravel'"

alias cmp="composer"
alias cmp_list="composer show"
alias cmp_init="composer init"
alias cmp_update="composer self-update"
alias cmp_update_package="composer update"
alias cmp_update_global="composer global update"
alias cmp_dump="composer dumpautoload"
alias cmp_dump_optimize="composer dumpautoload -o"
alias cmp_clear="composer clearcache"
alias cmp_install="composer require"
alias cmp_install_dev="composer require --dev"
alias cmp_install_global="composer global require";
alias cmp_install_global_dev="composer global require --dev"
alias cmp_repo_china="composer config -g repo.packagist composer https://packagist.phpcomposer.com"
alias cmp_repo_usa="composer config repo.packagist composer https://packagist.org"

# Laravel Package
alias cmp_passport="composer require laravel/passport"
alias cmp_sentinel="composer require cartalyst/sentinel"
alias cmp_fractal="composer require spatie/laravel-fractal"
alias cmp_excel="composer require maatwebsite/excel:~2.1.0"
alias cmp_pdf="composer require barryvdh/laravel-dompdf"
alias cmp_uuid="composer require webpatser/laravel-uuid"
alias cmp_image="composer require intervention/image"
alias cmp_debugbar="composer require barryvdh/laravel-debugbar --dev"
alias cmp_devpkg="composer require jeroen-g/laravel-packager"
alias cmp_cors="composer require barryvdh/laravel-cors"
alias cmp_guzzle="composer require guzzlehttp/guzzle"
alias cmp_homestead="composer require laravel/homestead --dev"
alias cmp_dusk="composer require laravel/dusk --dev"
alias cmp_recapcha="composer require google/recaptcha"
alias cmp_mock="composer require "mockery/mockery":~1.0 --dev"

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
alias pas="php artisan serve --host=0.0.0.0 --port=8000"
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
alias nrd="npm run dev"
alias npm_dev="npm run dev"
alias nrp="npm run prd"
alias npm_produce="npm run prd"
alias nrb="npm run build"
alias npm_build="npm run build"
alias nrw="npm run watch"
alias npm_watch="npm run watch"
alias nrt="npm run test"
alias npm_test="npm run test"
alias npm_install_dev="npm i --save-dev"
alias npm_install="npm i --save"
alias npm_remove="npm uninstall"
alias npm_init="npm init -y"
alias npm_list="npm list --depth=0"
alias npm_list_global="npm list --depth=0 -g"
alias npm_clear="npm cache clean"
alias npm_update_global="npm -g update"
alias npm_update="npm update"
alias npm_info="npm info"
alias npm_webpack="npm i -D babel-loader babel-core babel-preset-env"
alias npm_babelenv="npm i -D babel-preset-env"
alias npm_chart="npm i --save chart.js"

# vue
alias vue_init="vue init webpack"
alias vue_simple="vue init webpack-simple"

# subversion
alias svnout="svn checkout"
alias svn_out="svn checkout"
alias svn_url="svn info | grep URL"
alias svn_status="svn status"
alias svn_add="svn add"
alias svn_commit="svn commit -m"
alias svn_update="svn update"
alias svn_up="svn up"


# chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome_hide="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --incognito"


# SSH
alias sshkey="cat ~/.ssh2/id_rsa.pub | pbcopy && echo 'ssh key copyed to clipboard!'"
alias vultr="ssh -p 30011 -o "ServerAliveInterval=60" root@45.32.77.118 -i ~/.ssh2/id_rsa"

alias zshrc="subl ~/.zshrc"
alias vimrc="subl ~/.vimrc"
alias hosts="subl /etc/hosts"
alias gitconfig="subl ~/.gitconfig"
alias hiphp="subl ~/Public/Xudong/hi.php"
alias phpini="subl /usr/local/etc/php/7.1/php.ini"
alias go_desktop="cd ~/Desktop"
alias xd="cd ~/Public/Xudong"
alias go_snippet="cd /Users/xudong7930/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets"


# git: 版本控制
## 基本命令
alias g="git"
alias gconf="git config --list"
alias gi="git init"

alias ga="git add"
alias gaa="git add --all"

alias gd="git diff"
alias gcl="git clone"
alias g_count="git shortlog -sn"

#版本状态
alias gs="git status"
alias gss="git status -sb"

#提交文件
alias gc="git commit -v"
alias gcm="git commit -a -v -m"

#删除文件
alias gr="git rm"

#重命名
alias gmv="git mv"
alias g_rename="git mv"

## 分支管理
alias gb="git branch"
alias gb_remote="git branch --remote"
alias gbm="git merge"
alias gbmm="git merge origin/master"
alias gbb="git branch -b"
alias gb_add="git branch -b"

alias gbd="git branch -d"
alias gb_del="git branch -d"

alias gbc="git checkout"
alias gbc_master="git checkout master"
alias gbc_dev="git checkout develop"
alias gbc_prd="git checkout product"
alias gbc_test="git checkout test"
alias gclean="git clean -fd"
alias g_clean="git clean -fd"

## 提交日志
alias glog="git log --oneline --decorate --color"
alias glog_all="git log --graph --pretty=format:'\%Cred\%h\%Creset -\%C(yellow)\%d\%Creset \%s \%Cgreen(\%cr) \%C(bold blue)<\%an>\%Creset' --abbrev-commit --all"

## 标签
alias gtag="git tag"
alias gtag_add="git tag -a"
alias gtag_del="git tag -d"

## 远程仓库
alias gr="git remote"

#查看当前配置有哪些远程仓库
alias grv="git remote -v"

alias gr_add="git remote add origin"
alias grs="ssh -T git@github.com"
alias gra="git remote add origin"

alias gp="git push"
#推送所有标签到远程
alias gpt="git push --tags"
alias gpb="git push -u origin"
alias gpsup="git push --set-upstream origin master"

#从远程仓库下载新分支与数据
alias gf="git fetch -v"
#从远端仓库提取数据并尝试合并到当前分支
alias gff="git pull -v"
#删除远程仓库
alias grrm="git remote rm"


# Homestead: Laravel项目开发环境虚拟机
alias homestead="cd ~/Public/Homestead && vagrant"

# Deployer: PHP项目部署工具
alias dep="/usr/local/bin/deployer"
alias dep_local="deployer deploy develop"
alias dep_test="deployer deploy test"
alias dep_ready="deployer deploy ready"
alias dep_product="deployer deploy product"

# Homebrew: system package manager
alias br="brew"
alias brew_up="brew update"
alias brew_search="brew search"
alias brew_install="brew install"
alias brew_conf="brew config"
alias brew_clear="brew cleanup"
alias brew_list="brew list"
alias brew_upg="brew upgrade"
alias brew_outdated="brew outdated"
alias brew_service="brew services list"
alias brew_start="brew services start"
alias brew_stop="brew services stop"
alias brew_restart="brew services restart"

alias redis_start="brew services start redis@3.2"
alias redis_up="brew services start redis@3.2"
alias redis_stop="brew services stop redis@3.2"
alias redis_down="brew services stop redis@3.2"

alias mongo_up="brew services start mongodb"
alias mongo_start="brew services start mongodb"
alias mongo_down="brew services stop mongodb"
alias mongo_stop="brew services stop mongodb"

alias how_to_use="/usr/local/bin/tldr -p=osx"

# vagrant
alias vagrant_version="/usr/local/bin/vagrant version"
alias vagrant_up="vagrant up"
alias vagrant_start="vagrant up"
alias vagrant_down="vagrant halt"
alias vagrant_stop="vagrant halt"
alias vagrant_status="vagrant status"
alias vagrant_delete="vagrant destroy"
alias vagrant_ssh="vagrant ssh"
alias vm="vagrant ssh"
alias vagrant_box_list="vagrant box list"
alias vagrant_box_remove="vagrant box remove"

# laravel/Envoy
alias envoy_init="envoy init"
alias envoy_list="envoy tasks"
alias envoy_run="envoy run"

# httpie
alias http_get="http --json get"

# composer & brew & path
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
