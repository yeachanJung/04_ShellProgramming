#!/bin/bash
# 강의 평가 
# 1. 강의 환경에 만족하나요? (0 ~ 100)
# 2. 강의 내용에 만족하나요? (0 ~ 100)
# 3. 강의 지원에 만족하나요? (0 ~ 100)

# Variable Definition
RESULT=/root/shell/result.txt
> $RESULT
NUM=0

# Code Definition
NUM=1
ON=no
while [ "$ON" = 'no' ] 
do
    echo
    echo -n "1. 강의 환경에 만족하나요? (0점 ~ 100점): "
    read POINT1
    echo 
    echo "당신이 선택한 점수: $POINT1"

    echo -n "입력하신 점수가 맞나요? (yes/no): "
    read POINTYES
    case $POINTYES in
        yes|YES|Yes|y|Y) 
            ON=yes 
            echo "$NUM: $POINT1" >> $RESULT
            ;;
        no|NO|No|n|N)    ON=no  ;;
        *) echo "잘못 입력했습니다. yes or no 만 입력해 주세요."
           ON=no ;;
    esac
done

NUM=2
ON=no
while [ "$ON" = 'no' ] 
do
    echo
    echo -n "2. 강의 내용에 만족하나요? (0점 ~ 100점): "
    read POINT2
    echo 
    echo "당신이 선택한 점수: $POINT2"

    echo -n "입력하신 점수가 맞나요? (yes/no): "
    read POINTYES
    case $POINTYES in
        yes|YES|Yes|y|Y) 
            ON=yes 
            echo "$NUM: $POINT2" >> $RESULT
            ;;        
        no|NO|No|n|N)    ON=no  ;;
        *) echo "잘못 입력했습니다. yes or no 만 입력해 주세요."
           ON=no ;;
    esac
done

NUM=3
ON=no
while [ "$ON" = 'no' ] 
do
    echo
    echo -n "3. 강의 지원에 만족하나요? (0점 ~ 100점): "
    read POINT3
    echo 
    echo "당신이 선택한 점수: $POINT3"

    echo -n "입력하신 점수가 맞나요? (yes/no): "
    read POINTYES
    case $POINTYES in
        yes|YES|Yes|y|Y)
            ON=yes 
            echo "$NUM: $POINT3" >> $RESULT
            ;;         
        no|NO|No|n|N)    
            ON=no  
            ;;
        *) echo "잘못 입력했습니다. yes or no 만 입력해 주세요."
           ON=no ;;
    esac
done

echo 
read ; cat $RESULT