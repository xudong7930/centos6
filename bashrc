# .bashrc
export PATH=$PATH:/usr/local/php/bin:/usr/local/node/bin

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias pyweb="python -m SimpleHTTPServer 8080"
alias sys="systemctl"

# shortcut add@2017/07/02
alias dk="docker"
alias dk_ver="docker version"
alias dk_container="docker exec -it"
alias dkc="docker-compose"
alias dkm="docker-machine"
alias go_laradock="docker-compose exec workspace bash"

alias cady="caddy -conf /usr/local/caddy/Caddyfile"
alias restart_ssh="systemctl restart sshd.service"
alias show_port="netstat -ntl"
alias show_port_detail="netstat -antp"

alias mkm_phpfpm="dk run -d -p 9000:9000 --name=phpnd -v /usr/local/caddy/ehd4.f3322.net:/usr/local/caddy/ehd4.f3322.net php:7.1-fpm"
alias php_stop="docker stop phpnd"
alias php_start="docker start phpnd"
alias cady_start="caddy -conf /usr/local/caddy/Caddyfile"
alias cady_stop="kill -9 `ps -aux | grep caddy | grep -v grep | awk '{print $2}'`"

# CentOS
alias ps="ps -aux"
alias ps_tree="ps -auxwf"
alias ps_search="ps -auxwf | grep -B8"


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
