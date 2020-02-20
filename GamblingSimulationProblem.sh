#!/bin/bash -x

#DISPLAY WELCOME MESSAGE
echo ".............................. Gambling Simulation Problem .............................."

#CONSTANT
STAKE=100
BET=1
IS_WIN=1

#VARIABLE
cash=0

#GENERATE RANDOM NUMBER FOR GAMBLER
randomNumber=$((RANDOM%2))

#CHECK IF WIN OR LOOSE BY $1
cash=$STAKE
if [ $randomNumber -eq $IS_WIN ]
then
	echo "Win :"$IS_WIN"$"
	cash=$(($cash+$BET))
else
	echo "Lose:"$IS_WIN"$"
	cash=$(($cash-$BET))
fi
echo "Cash:"$cash


