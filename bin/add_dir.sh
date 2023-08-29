#!/bin/bash

mkdir -p /test
rm -rf /test/*

for i in `seq 1 4`
do
        mkdir /test/$i
        for j in `seq 1 4`
        do
                mkdir /test/$i/$j
        done
done