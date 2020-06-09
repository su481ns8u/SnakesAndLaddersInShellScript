#!/bin/bash -x

echo "Welcome to the snakes /\_/^ and ladders |-|"

START_POS=0;
No_OF_PLAYERS=1;

function diceRoll(){
	roll=$(($((RANDOM%6))+1))
	echo "Roll Result by player $1: "$roll
}

diceRoll 1

