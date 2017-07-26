# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/xudong7930/.oh-my-zsh

# zsh theme: robbyrussell | af-magic | steeef | ys | jonathan | Candy | cloud
ZSH_THEME="ys"

# case sensitive
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Casesensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git laravel5 xcode yarn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
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

DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias grep="grep --color=auto"

# Laravel
alias ss="php -S 0.0.0.0:8100"
alias pa="php artisan"
alias pat="php artisan tinker"
alias pas="php artisan serve --host=0.0.0.0 --port=8000"
alias pa_clear="composer dumpautoload; composer clearcache; php artisan view:clear;php artisan route:clear; php artisan cache:clear; php artisan clear-compiled"

# NPM
alias nrd="npm run dev"
alias nrb="npm run build"
alias ni="npm i -D"

# SVN
alias svnout="svn checkout"
alias svnup="svn update"
alias svncm="svn commit"

# SSH
alias go_vultr="ssh -p 30011 -o "ServerAliveInterval=60" root@45.32.77.118 -i ~/.ssh2/id_rsa"
alias go_mallmg="ssh -p 30022 -o "ServerAliveInterval=60" root@www.mallmg.com -i ~/.ssh2/id_rsa"

alias go_zq_219="ssh -p 30022 -o "ServerAliveInterval=60" root@10.12.40.219 -i ~/.ssh2/id_rsa"
alias go_zq_129="ssh -p 30022 -o "ServerAliveInterval=60" root@10.12.40.129 -i ~/.ssh2/id_rsa"
alias go_zq_35="ssh -p 30022 -o "ServerAliveInterval=60" root@10.12.40.35 -i ~/.ssh2/id_rsa"

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

alias op_zshrc="subl ~/.zshrc"
alias op_hosts="subl /etc/hosts"
alias op_hiphp="subl ~/Public/Xudong/hi.php"
alias op_phpini="subl /usr/local/etc/php/7.1/php.ini"
alias go_desktop="cd ~/Desktop"

alias mk_pass='LC_ALL=C tr -dc "[:alpha:][:alnum:]" < /dev/urandom | head -c 20'
alias show_hide='defaults write com.apple.finder AppleShowAllFiles true'
alias show_nohide='defaults write com.apple.finder AppleShowAllFiles false'

# mysql
alias mqstart="/Applications/MAMP/bin/startMysql.sh"
alias mqstop="/Applications/MAMP/bin/stopMysql.sh"
alias node="node --harmony"

# docker
alias dk="docker"
alias dk_ver="docker version"
alias dk_ps="docker ps"
alias dk_psa="docker ps -a"
alias dk_psl="docker ps -l"

# multiple
alias show_ip="curl -s http://ip.cn" # 显示上网出口
alias clear_trash="sudo rm -fr ~/.Trash/*" # 清空回收站

export PATH="/Users/xudong7930/.composer/vendor/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
