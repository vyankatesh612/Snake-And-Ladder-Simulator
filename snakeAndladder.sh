#!/bin/bash -x

echo "WelCome to Snake and Ladder Computation"

#CONSTANT VARIABLE
PlayerCurrentPosition=0

function rollDice()
	{
		dice=$((1+RANDOM%6))
		echo "The number on Dice is : "$dice
	}
rollDice

function checkOption()
	{
		option=$((1+RANDOM%3))
		case $option in
			1)PlayerCurrentPosition=$PlayerCurrentPosition
				;;
			2)PlayerCurrentPosition=$(($PlayerCurrentPosition + $dice))
				;;
			3)PlayerCurrentPosition=$(( $PlayerCurrentPosition - $dice))
				;;
		esac
	}
checkOption
