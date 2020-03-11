#!/bin/bash -x

echo "WelCome to Snake and Ladder Computation"

#CONSTANT VARIABLE
PYAYER_POSITION=0

function rollDice()
	{
		dice=$((1+RANDOM%6))
		echo "The number on Dice is : "$dice
	}
rollDice
