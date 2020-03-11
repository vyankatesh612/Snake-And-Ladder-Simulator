#!/bin/bash -x

echo "WelCome to Snake and Ladder Computation"

#CONSTANT VARIABLE
PlayerCurrentPosition=0
WinningPosition=100
diceCount=0

function rollDice()
	{
		dice=$((1+RANDOM%6))
		diceCount=$(($diceCount + 1))
		echo "The number on Dice is : "$dice
	}

function checkOption()
	{
		option=$((1+RANDOM%3))
		case $option in
			1)PlayerCurrentPosition=$PlayerCurrentPosition
				;;
			2)PlayerCurrentPosition=$(($PlayerCurrentPosition + $dice))
				;;
			3)PlayerCurrentPosition=$(( $PlayerCurrentPosition - $dice))
				if [[ $PlayerCurrentPosition -lt 0 ]]
				then
					PlayerCurrentPosition=0
				fi
				;;
		esac
		echo "number of time dice was played : $diceCount"
		echo "player current position is :" $PlayerCurrentPosition 
	}

function checkWin()
	{
		while [[ $PlayerCurrentPosition -lt $WinningPosition ]]
		do
			rollDice
			if [[ $(($PlayerCurrentPosition + $dice)) -gt 100 ]]
			then 
				$playerCurrentPosition=$PlayerCurrentPosition
			else
				checkOption
			fi
			if [[ $PlayerCurrentPosition == $WinningPosition ]]
			then
				echo "YOU WIN ....!!!"
			fi
		done
	}
checkWin
