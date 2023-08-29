#!/bin/bash

USERLIST=user.list
cat $USERLIST | while read UNAME UPASS
do
    userdel -r $UNAME > /dev/bull 2>&1 \
        && echo "[  OK  ] $UNAME removed." \
        || echo "[ FAIL ] $UNAME not removed."
done