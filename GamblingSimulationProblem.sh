#!/bin/bash -x

echo ".............................. Gambling Simulation Problem .............................."

#CONSTANT
STAKE=100
BET=1
IS_WIN=1
MAXWIN=$(($STAKE+$STAKE/2))
MAXLOOSE=$(($STAKE-$STAKE/2))

#VARIABLE
cash=0

#GENERATE RANDOM NUMBER FOR GAMBLER
randomNumber=$((RANDOM%2))

#FUNCTION TO GET DAILY CASH WIN OR LOOSE
function gamble()
{
	cash=$STAKE 
	while [[ $cash -ne $MAXWIN && $cash -ne $MAXLOOSE ]]
	do
		if [ $randomNumber -eq $IS_WIN ]
		then
			cash=$(($cash+$BET))
		else
			cash=$(($cash-$BET))
		fi
	done
	echo "Cash:"$cash
}

#FUNCTION CALL TO GET DAILY CASH
gamble
