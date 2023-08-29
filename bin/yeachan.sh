#!/bin/bash

# 가위바위보 게임

echo "이 게임은 가위바위보 게임입니다.
	무엇을 낼지 선택하세요. 1(가위), 2(바위), 3(보), 0(exit)"
read -n 1 -p "
# Enter or any key to let's start!'" start 
if [ -n $start ]; then
	echo "Ok. let's start.'"
fi


# ai function (ai 함수 지정)

rpsai() {

if [ $pc = 1 ]; then
	echo "
저는 가위를 냈습니다."
	if [ $rps = 1 ]; then
		echo "우린 비겼습니다."
		echo "당신의 점수는 $yn 저의 점수는 $pn 입니다."
	fi
	
	if [ $rps = 2 ]; then
		echo "당신이 이겼습니다."
		yn=`echo $yn + 1 |bc`
		echo "당신의 점수는 $yn 저의 점수는 $pn 입니다."
	fi
	
	if [ $rps = 3 ]; then
		echo "
		제가 이겼습니다."
		pn=`echo $pn + 1 |bc`
		echo "
당신의 점수는 $yn 저의 점수는 $pn 입니다."
	fi
fi

if [ $pc = 2 ]; then
	echo "
저는 바위를 냈습니다."
	if [ $rps = 1 ]; then
		echo "
		제가 이겼습니다."
		pn=`echo $pn + 1 |bc`
		echo "
당신의 점수는 $yn 저의 점수는 $pn 입니다."
	fi
	
	if [ $rps = 2 ]; then
		echo "
		우린 비겼습니다."
		echo "
당신의 점수는 $yn 저의 점수는 $pn 입니다."
	fi
	
	if [ $rps = 3 ]; then
		echo "
		당신이 이겼습니다."
		yn=`echo $yn + 1 |bc`
		echo "
당신의 점수는 $yn 저의 점수는 $pn 입니다."
	fi
fi

if [ $pc = 3 ]; then
	echo "
저는 보를 냈습니다."
	if [ $rps = 1 ]; then
		echo "
		당신이 이겼습니다."
		yn=`echo $yn + 1 |bc`
		echo "
당신의 점수는 $yn 저의 점수는 $pn 입니다."
	fi
	
	if [ $rps = 2 ]; then
		echo "
		제가 이겼습니다."
		pn=`echo $pn + 1 |bc`
		echo "
당신의 점수는 $yn 저의 점수는 $pn 입니다."
	fi
	
	if [ $rps = 3 ]; then
		echo "
		우리는 비겼습니다."
		echo "
당신의 점수는 $yn 저의 점수는 $pn 입니다."
	fi
fi
}

# 각 승리회수를 위한 변수 지정

pn=0
yn=0

# gmae start.

while [ : ]; do

read -n 1 -p "
Input key [1(가위), 2(바위), 3(보), 0(종료)]" rps

if [ -n $rps  ]; then
	clear
	if [ $rps = 0 ]; then
		echo "

Good bye~!"
		exit 0
	fi

# AI가 랜덤으로 1~3까지 숫자를 결정한다.

	pc=`echo "($RANDOM % 3) + 1" | bc`
	if [ $rps = 1 ]; then
		echo "
당신은 1 (가위)를 내셨습니다."

# 지정한 rpsai 함수를 불러온다. 

		rpsai		
	fi
	if [ $rps = 2 ]; then
		echo "
당신은 2 (바위)를 내셨습니다."
		rpsai	
	fi
	if [ $rps = 3 ]; then
		echo "
당신은 3 (보)를 내셨습니다."
		rpsai	
	fi

fi  


done