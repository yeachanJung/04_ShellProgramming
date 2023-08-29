#!/bin/bash
# ENV2.SH : 환경 설정
# * $HOME/.bashrc

echo "===== [Phase 2 : 환경 설정 ] ====="

# (1) $HOME/.bashrc 파일 설정 절차
BASHRC=$HOME/.bashrc
# BASHRC=/root/bin/bashrc.txt
cat << EOF > $BASHRC
# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
#
# Sfecific configuration
#
export PS1='\[\e[34;1m\][\u@\h\[\e[33;1m\] \w]\\$ \[\e[m\]'
alias vi='/usr/bin/vim'

#
# DNS Server Alias
#
alias named.conf='vi /etc/named.conf'
alias named.rfc1912.zones='vi /etc/named.rfc1912.zones' 
alias DNS='cd /var/named'
alias dnslog='tail -f /var/log/messages'

#
# vscode Alias
#
alias code='code --user-data-dir ~/vsdcode --no-sandbox'
alias vscode='code'

#
# Shell Script Alias
#
alias cron='export EDITOR=/usr/bin/vim'
EOF

source $HOME/.bashrc
alias fwcmd >/dev/null 2>&1
if [ $? -eq 0 ]; then
        echo "[  OK  ] $HOME/.bashrc 환경 설정 성공"
else
        echo "[ FAIL ] $HOME/.bashrc 환경 설정 실패"
        exit 1
fi