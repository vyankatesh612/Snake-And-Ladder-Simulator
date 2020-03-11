#!/bin/bash -x

echo "WelCome to Snake and Ladder Computation"

#CONSTANT VARIABLE
PlayerOnePosition=0
PlayerTwoPosition=0
WinningPosition=100
diceCount1=0
diceCount2=0
player=1

function playerTurn()
	{
		if [ $player == 1 ]
		then
			player=2
		else
			player=1
		fi
		echo $player
	}

function rollDice()
	{
		dice=$((1+RANDOM%6))
		if [ $player == 1 ]
		then
			diceCount1=$(($diceCount1 + 1))
		else
			diceCount2=$(($diceCount2 + 1))
		fi	
		echo "The number on Dice is : "$dice
	}
function checkOptionplayer1()
	{
		option=$((1+RANDOM%3))
		case $option in
			1)PlayerOnePosition=$PlayerOnePosition
				;;
			2)PlayerOnePosition=$(($PlayerOnePosition + $dice))
				;;
			3)PlayerOnePosition=$(( $PlayerOnePosition - $dice))
				if [[ $PlayerOnePosition -lt 0 ]]
				then
					PlayerOnePosition=0
				fi
				;;
		esac
		echo $PlayerOnePosition
	}
function checkOptionplayer2()
	{
		option=$((1+RANDOM%3))
		case $option in
			1)PlayerTwoPosition=$PlayerTwoPosition
				;;
			2)PlayerTwoPosition=$(($PlayerTwoPosition + $dice))
				;;
			3)PlayerTwoPosition=$(( $PlayerTwoPosition - $dice))
				if [[ $PlayerTwoPosition -lt 0 ]]
				then
					PlayerTwoPosition=0
				fi
				;;
		esac
		echo $PlayerTwoPosition
	}

function checkWin()
	{
		while [[ $PlayerOnePosition -lt $WinningPosition && $PlayerTwoPosition -lt $WinningPosition ]]
		do
			playerTurn

			rollDice
			if [ $player == 1 ]
 			then
				if [[ $(($PlayerOnePosition + $dice)) -gt 100 ]]
				then 
					PlayerOnePosition=$PlayerOnePosition
 				else
 					checkOptionplayer1
 				fi
			else
				if [[ $(($PlayerTwoPosition + $dice)) -gt 100 ]]
				then
					PlayerTwoPosition=$PlayerTwoPosition
				else
					checkOptionplayer2
				fi
			fi
			if [ $PlayerOnePosition == $WinningPosition ]
			then
				echo "PLAYER ONE WON ....!!!"
			elif [ $PlayerTwoPosition == $WinningPosition ]
			then 
				echo "PLAYER TWO WON ....!!!"
			fi
		done
	}
checkWin
