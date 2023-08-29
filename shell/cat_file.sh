#!/bin/bash

for NAME in $(egrep -v '^#|^$ /etc/vsgtpd/ftpusers')
do
    echo "$NAME"
done