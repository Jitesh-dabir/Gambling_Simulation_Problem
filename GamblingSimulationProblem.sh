#!/bin/bash -X 

echo ".............................. Gambling Simulation Problem .............................."

#DECLARE A DICTIONARY
declare -A dailyCash

#CONSTANT
STAKE=100
BET=1
IS_WIN=1
NUMBER_OF_DAYS=20
MAXWIN=$(($STAKE+$STAKE/2))
MAXLOOSE=$(($STAKE-$STAKE/2))

#VARIABLE
cash=0
limit=0

#FUNCTION TO GET DAILY CASH WIN OR LOOSE
function gamble()
{
	#GENERATE RANDOM NUMBER FOR GAMBLER
   randomNumber=$((RANDOM%2))
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
	echo "$cash"
}

#CHECK IF WIN OR LOOSE FOR 20 DAYS AND FIND TOTAL AMOUNT 
for (( day=1; day<=$NUMBER_OF_DAYS; day++))
do
	cashPerDay=$(gamble)
	cashPerDay=$(( $cashPerDay - $STAKE ))
	dailyCash[Day $day]=$cashPerDay 
	totalCash=$(($totalCash+$(($cashPerDay))))
	if [ $cashPerDay -gt 0 ]
	then
		echo "Day$day  win   :"$cashPerDay"$"
	else
		echo "Day$day  loose:"$cashPerDay"$"
	fi
done
echo "Total cash for 20 days:$totalCash"
