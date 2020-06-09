##!/bin/bash -x

echo "Welcome to the snakes /\_/^ and ladders |-|"

START_POS=0;
No_OF_PLAYERS=1;

NO_PLAY=1;
LADDER=2;
SNAKE=3;

position=$START_POS
function diceRoll(){
	roll=$(($((RANDOM%6))+1))
	echo "Roll Result by player $1: "$roll
}

function play(){
	choice=$(($((RANDOM%3))+1))
	diceRoll $1
	case $choice in
		$NO_PLAY)
			echo "Player $1 Dont Move from $position !"
			;;
		$LADDER)
			position=$(($position+$roll))
			echo "Player $1 Got a ladder and upgraded to $position"
			;;
		$SNAKE)
			position=$(($position-$roll))
			echo "Player $1 Got a snake and demoted to $position"
			;;
	esac
}

play 1
