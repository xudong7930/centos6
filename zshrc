# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# oh-my-zsh安装路径.
export ZSH=/Users/xudong7930/.oh-my-zsh
export XDEBUG_CONFIG="idekey=VSCODE"

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

# ZSH插件: git,zsh-autosuggestions
plugins=(zsh-autosuggestions)

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

alias port="echo 'a' | sudo lsof -nP -iTCP -sTCP:LISTEN"
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

alias pa_clear="composer dumpautoload;php artisan view:clear;php artisan route:clear; php artisan cache:clear; php artisan clear-compiled;php artisan key:generate"
alias lal57="composer create-project --prefer-dist 'laravel/laravel=5.7.*'"
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
alias cmp.redis="composer require predis/predis"
alias cmp.dump="composer dumpautoload"

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
alias vultr="ssh -p 30011 -o "ServerAliveInterval=60" root@45.32.77.118 -i ~/.ssh/id_rsa2"
alias vps="ssh -p 30011 -o "ServerAliveInterval=60" root@45.32.77.118 -i ~/.ssh/id_rsa2"
alias zshrc="subl ~/.zshrc"
alias vimrc="subl ~/.vimrc"
alias hosts="subl /etc/hosts"
alias gitconfig="subl ~/.gitconfig"

# for simple file
alias hi.php="subl ~/Public/Xudong/hi.php"
alias hi.md="subl ~/Public/Xudong/hi.md"
alias hi.html="subl ~/Public/Xudong/hi.html"
alias hi.sql="subl ~/Public/Xudong/hi.sql"
alias hi.js="subl ~/Public/Xudong/hi.js"
alias hi.bash="subl ~/Public/Xudong/hi.sh"
alias hi.vue="subl ~/Public/Xudong/hi.vue"
alias hi.ini="subl ~/Public/Xudong/hi.ini"
alias hi.json="subl ~/Public/Xudong/hi.json"
alias php.ini="subl /usr/local/etc/php/7.2/php.ini"
alias s.new="s --new-window"

# for mysql
alias mysql.cnf="subl /usr/local/mysql/etc/my.cnf"
alias mysql.connect="/usr/local/mysql/bin/mysql -u root -pabc123"
alias mysql.log="sudo cat /usr/local/mysql/data/mysqld.local.err"

alias go_desktop="cd ~/Desktop"
alias go_snippet="cd /Users/xudong7930/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets"

# git for version control
	alias g.test="ssh -T git@github.com"

	#1.git.create
	#从远程地址创建项目
	alias gc="git clone"
	#从远程地址创建项目，包含子项目
	alias gc.sub="git clone --recurse-submodules"
	#创建空的git项目
	alias gi="git init"

	#2.git.config
	#列出git配置
	alias gconf="git config --list"
	#设置git配置
	alias gconf.set="git config --global"

	#3.git.localchanges
	#本地文件状态
	alias gs="git status"
	#本地文件简短状态
	alias gss="git status -sb"

	#4.git.commit history
	alias glog="git log --oneline --decorate --color"
	alias glog.all="git log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)'"

	#5.git.branch&tags
	#列出所有标签
	alias gtag="git tag"

	#6.git.update&publish
	#查看当前配置有哪些远程仓库
	alias grv="git remote -v"

	#7.git.merge&rebase

	#8.git.undo

	#9.git.submodules


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
alias brew.update="brew update"
alias brew.upgrade="brew upgrade"
alias brew.search="brew search"
alias brew.install="brew install"
alias brew.remove="brew remove"
alias brew.config="brew config"
alias brew.clear="brew cleanup"
alias brew.list="brew list"
alias brew.outdated="brew outdated"
alias brew.service="brew services list"

alias redis.up="brew services start redis@3.2"
alias redis.down="brew services stop redis@3.2"

alias mongo.up="brew services start mongodb"
alias mongo.down="brew services stop mongodb"

alias phpfpm.up="brew services start php"
alias phpfpm.down="brew services stop php"

alias nginx.up="nginx -t && brew services start nginx"
alias nginx.down="nginx -t && brew services stop nginx"
alias nginx.conf="/usr/local/bin/subl /usr/local/etc/nginx/servers/"

alias how_to_use="/usr/local/bin/tldr -p=osx"

# vagrant
alias va="vagrant"
alias va.up="vagrant up"
alias va.down="vagrant halt"
alias va.status="vagrant status"
alias va.ssh="vagrant ssh"
alias va.port="vagrant port"

alias vagrant_version="/usr/local/bin/vagrant version"
alias vagrant_up="vagrant up"
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
