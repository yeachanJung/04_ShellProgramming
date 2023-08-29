#!/bin/bash

USERLIST=user.list
cat $USERLIST | while read UNAME UPASS
do
    useradd $UNAME > /dev/bull 2>&1 \
        && echo "[  OK  ] $UNAME added." \
        || echo "[ FAIL ] $UNAME not added."
    echo $ UPASS | passwd --stdin $UNAME > /dev/bull 2>&1 \
        && echo "[  OK  ] $UNAME password changed." \
        || echo "[ FAIL ] $UNAME password not changed."
done
