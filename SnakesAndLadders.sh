##!/bin/bash -x

echo "Welcome to the snakes /\_/^ and ladders |-|"

START_POS=0
declare -a players
NO_PLAY=1
LADDER=2
SNAKE=3

read -p 'Enter number of players: ' noOfPlayers
for((i=1; i<=$noOfPlayers; i++))
do
	players[$i]=0
done

noOfDieRolls=0
function diceRoll(){
	roll=$(($((RANDOM%6))+1))
	noOfDieRolls=$(($noOfDieRolls+1))
	echo "Roll Result by player $1: "$roll
}

function play(){
	choice=$(($((RANDOM%3))+1))
	diceRoll $key
	case $choice in
		$NO_PLAY)
			echo "Dont Move from "${players[$key]}" !"
			;;
		$LADDER)
			temp=$((${players[$key]}+$roll))
                        if [ $temp -gt 100 ]
                        then
                                echo "Cant Move";
                        else
                                players[$key]=$temp
                                echo "Ladder to "${players[$key]}
				if [ ${players[$key]} -ne 100 ]
				then
					play
				fi
                        fi
                        ;;
		$SNAKE)
			players[$key]=$((${players[$key]}-$roll))
			if [ ${players[$key]} -lt 0 ]
			then
				players[$key]=$START_POS
			fi
			echo "Sanke to "${players[$key]}
			;;
	esac
}

flag=0
while [ $flag -ne 1 ]
do
	for key in ${!players[@]}
	do
		echo " ";echo "Player" $key"s turn"
		play
		if [ ${players[$key]} -eq 100 ]
		then
			flag=1
			echo " ";echo "Player $key  wins !!!"
			break
		fi
	done
done
echo "Total Number of die rolls: "$noOfDieRolls
echo "Current Positions of Players are "
for key in ${!players[@]}
do
	echo "Player "$key": "${players[$key]}
done
