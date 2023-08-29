#!/bin/bash

# 1) 원격 접속 후 백업 수행 -> auto_telnet.sh
#   tar CMD: tar czf /tmp/home_$(hosename).tar.gz /home

IP1='192.168.10.20'
BACKUPFILE="home_$IP1.tar.gz"
CmdBackup(){
    sleep 2     ; echo 'root'
    sleep 0.5   ; echo 'soldesk1.'
    sleep 0.5   ; echo "tar czf /tmp/$BACKUPFILE /home"
    sleep 0.5   ; echo 'exit'
}
CmdBackup | telnet $IP1

# 2) 파일 전송 -> auto_ftp.sh
UNAME=root
UPASS='soldesk1.'
ftp -n $IP1 << EOF
user $UNAME $UPASS
cd /tmp
lcd /test
bin
hash
prompt
mget $BACKUPFILE
EOF
