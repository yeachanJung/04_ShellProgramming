#!/bin/bash

for i in $(seq 1 10)
do
    PER=$(expr $i \* 10)
    echo -ne "$PER% |"

    for j in $(seq $i)
    do
        echo -ne "="
    done

    if [ $i -ne 10 ]; then 
        echo -ne ">"
    else
        echo -ne "| complete"
    fi

    echo -ne "\r" # 라인의 처음으로 이동
    sleep 1
done