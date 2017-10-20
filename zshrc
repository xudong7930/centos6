# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# oh-my-zsh安装路径.
export ZSH=/Users/xudong7930/.oh-my-zsh

# 主题设置: robbyrussell, af-magic, steeef, ys, jonathan, Candy, cloud
ZSH_THEME="ys"

# 区分大小写: true,false
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Casesensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# 禁用自动更新.
# DISABLE_AUTO_UPDATE="true"

# 自动更新检查天数.
export UPDATE_ZSH_DAYS=30

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
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# zsh插件
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# 设置终端编码环境
# export LANG=en_US.UTF-8

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
DISABLE_UPDATE_PROMPT=true

# 禁用自动更新
DISABLE_AUTO_UPDATE=true

# 别名设置
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# osx
alias grep="grep --color=auto"
alias ip="curl -s http://ip.cn"
alias clear_trash="sudo rm -fr ~/.Trash/*"
alias clear_log="sudo rm -fr /private/var/log/asl/*.asl /private/var/log/DiagnosticMessages/*.asl /private/var/log/system.log.*.gz /private/var/log/opendirectoryd.log.* /private/var/log/wifi.log.*.bz2 /private/var/log/powermanagement/*.asl"
alias mk_pass='LC_ALL=C tr -dc "[:alpha:][:alnum:]" < /dev/urandom | head -c 20'
alias show_hide='defaults write com.apple.finder AppleShowAllFiles true'
alias show_nohide='defaults write com.apple.finder AppleShowAllFiles false'
alias cls="clear"
alias ikill="kill -9"
alias wgetc="wget -c"
alias dep="/usr/local/bin/deployer"

# Laravel & Composer
alias phpser="php -S 0.0.0.0:80"
alias sqladmin="php -S 0.0.0.0:8200 -t /Users/xudong7930/Public/sqladmin"
alias sqladmin_stop="ps -a | grep sqladmin | grep -v grep | awk '{print $1}' | xargs  kill -9 "
alias ss="php -S 0.0.0.0:8100"
alias pa_clear="composer dumpautoload;php artisan view:clear;php artisan route:clear; php artisan cache:clear; php artisan clear-compiled"
alias laravel55="composer create-project --prefer-dist laravel/laravel=5.5.*"
alias laravel54="composer create-project --prefer-dist laravel/laravel=5.4.*"
alias laravel53="composer create-project --prefer-dist laravel/laravel=5.3.*"
alias laravel52="composer create-project --prefer-dist laravel/laravel=5.2.*"
alias laravel51="composer create-project --prefer-dist laravel/laravel=5.1.*"
alias cmp="composer"
alias cmp_update="composer selfupdate"
alias cmp_dump="composer dumpautoload"
alias cmp_clear="composer clearcache"
alias cmp_install="composer require"

alias mk_sqlite="touch ./database/database.sqlite"
alias pa="php artisan"
alias pat="php artisan tinker"
alias tinker="php artisan tinker"
alias pas="php artisan serve --host=0.0.0.0 --port=8000"
alias pam="php artisan migrate";
alias paeg="php artisan event:generate"
alias pavp="php artisan vendor:publish"
alias pa_route="php artisan route:list"

alias mk_controller="php artisan make:controller"
alias mk_model="php artisan make:model"
alias mk_middleware="php artisan make:middleware"
alias mk_mail="php artisan make:mail"
alias mk_notification="php artisan make:notification"
alias mk_migration="php artisan make:migration"
alias mk_command="php artisan make:command"
alias mk_seeder="php artisan make:seeder"
alias mk_job="php artisan make:job"
alias mk_request="php artisan make:request"
alias mk_provider="php artisan make:provider"

# node & npm
alias node="node --harmony"
alias nrd="npm run dev"
alias nrp="npm run prd"
alias nrb="npm run build"
alias nrw="npm run watch"
alias nid="npm i --save-dev"
alias nis="npm i --save"
alias niy="npm init -y"
alias npm_list="npm list --depth=0"
alias npm_glist="npm list --depth=0 -g"
alias npm_clear="npm cache clean"
alias npm_gupdate="npm -g update"
alias npm_info="npm info"

# vue
alias vue_init="vue init webpack"
alias vue_simple="vue init webpack-simple"

# subversion
alias svnout="svn checkout"
alias svnup="svn update"
alias svncm="svn commit"

# SSH
alias sshkey="cat ~/.ssh2/id_rsa.pub | pbcopy && echo 'ssh key copyed to clipboard!'"
alias laravelos="ssh laravel-vqta@deploy.us1.frbit.com -i ~/.ssh2/id_rsa"
alias vultros="ssh -p 30011 -o "ServerAliveInterval=60" root@45.32.77.118 -i ~/.ssh2/id_rsa"

alias zq_219="ssh -p 30022 -o "ServerAliveInterval=60" root@10.12.40.219 -i ~/.ssh2/id_rsa"
alias zq_129="ssh -p 30022 -o "ServerAliveInterval=60" root@10.12.40.129 -i ~/.ssh2/id_rsa"
alias zq_35="ssh -p 30022 -o "ServerAliveInterval=60" root@10.12.40.35 -i ~/.ssh2/id_rsa"

alias go_bj_4="ssh -p 30022 -o "ServerAliveInterval=60" root@172.20.4.4 -i ~/.ssh2/id_rsa"
alias go_bj_30="ssh -p 30022 -o "ServerAliveInterval=60" root@172.20.4.30 -i ~/.ssh2/id_rsa"
alias go_bj_8="ssh -p 30022 -o "ServerAliveInterval=60" root@172.20.4.8 -i ~/.ssh2/id_rsa"
alias go_bj_20="ssh -p 30022 -o "ServerAliveInterval=60" root@172.20.4.20 -i ~/.ssh2/id_rsa"
alias go_bj_61="ssh -p 30022 -o "ServerAliveInterval=60" root@172.20.4.61 -i ~/.ssh2/id_rsa"
alias go_bj_29="ssh -p 30022 -o "ServerAliveInterval=60" root@172.20.4.29 -i ~/.ssh2/id_rsa"

alias go_gz_82="ssh -p 30022 -o "ServerAliveInterval=60" root@10.2.61.82 -i ~/.ssh2/id_rsa"
alias go_gz_83="ssh -p 30022 -o "ServerAliveInterval=60" root@10.2.61.83 -i ~/.ssh2/id_rsa"
alias go_gz_84="ssh -p 30022 -o "ServerAliveInterval=60" root@10.2.61.84 -i ~/.ssh2/id_rsa"
alias go_gz_86="ssh -p 30022 -o "ServerAliveInterval=60" root@10.2.61.86 -i ~/.ssh2/id_rsa"
alias go_gz_87="ssh -p 30022 -o "ServerAliveInterval=60" root@10.2.61.87 -i ~/.ssh2/id_rsa"
alias go_gz_88="ssh -p 30022 -o "ServerAliveInterval=60" root@10.2.61.88 -i ~/.ssh2/id_rsa"

alias zshrc="subl ~/.zshrc"
alias vimrc="subl ~/.vimrc"
alias hosts="subl /etc/hosts"
alias gitconfig="subl ~/.gitconfig"
alias hiphp="subl ~/Public/Xudong/hi.php"
alias phpini="subl /usr/local/etc/php/7.1/php.ini"
alias go_desktop="cd ~/Desktop"
alias go_xudong="cd ~/Public/Xudong"

# git
alias gt="git init"
alias gs="git status"
alias nah="git reset --hard && git clean -df"
alias gll="git log --oneline --graph"
alias mf_ignore="touch .gitignore"

# homestead
alias homestead="cd ~/Public/Xudong/Homestead && vagrant"

# deployer
alias dep_local="deployer deploy develop"
alias dep_test="deployer deploy test"
alias dep_ready="deployer deploy ready"
alias dep_product="deployer deploy product"

# composer & brew & path
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# node version manager.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
