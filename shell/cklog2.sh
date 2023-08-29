#!/bin/bash
# crontab -e
# * * * * * /root/shell/cklog2.sh

# Variable Definition
TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3

# Code Definition
if [ -f "$TMP1" ]; then
    egrep -i 'warn|fail|error|crit|alert|emerg' $LOG > $tmp2
    diff $TMP1 $TMP2 > $TMP3
    if [ $? -ne 0 ]; then
        mailx -s "[ WARN ] Log check 2" root < $TMP3
        egrep -i 'warn|fail|error|crit|alert|emerg' $LOG > $TMP1
    fi
else
    egrep -i 'warn|fail|error|crit|alert|emerg' $LOG > $TMP1
fi