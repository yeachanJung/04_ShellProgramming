#!/bin/bash

USERLIST=user.list
> $USERLIST

for i in $(seq 1 50)
do
    echo "user$i user$i" >> $USERLIST
done