#!/bin/bash -x

echo ".............................. Gambling Simulation Problem .............................."

#DECLARE A DICTIONARY
declare -A dailyCash

#CONSTANT
STAKE=100
BET=1
IS_WIN=1
DAYS_IN_MONTH=30
MAXWIN=$(($STAKE+$STAKE/2))
MAXLOOSE=$(($STAKE-$STAKE/2))
MONTH_IN_YEAR=12

#VARIABLE
cash=0
dayWin=0
dayLoose=0

#FUNCTION TO GET DAILY CASH WIN OR LOSE
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

#CHECK IF WIN OR LOSE UNTIL CONDITION
for ((month=1; month<=$MONTH_IN_YEAR; month++))
do
	for (( day=1; day<=$DAYS_IN_MONTH; day++))
	do
   	cashPerDay=$(gamble)
		if [ $cashPerDay -gt $STAKE  ]
		then
			((dayWin++))
		else
			((dayLoose++))
		fi
   	cashPerDay=$(( $cashPerDay - $STAKE ))
   	dailyCash[Day $day]=$cashPerDay 
   	totalCash=$(($totalCash+$(($cashPerDay))))
	done
	echo "Total days won   in month-$month is $dayWindays by $(($dayWin*50))"
	echo "Total days Loose in month-$month is $dayLoosedays by $(($dayLoose*50))"
	echo "Total Cash for a month:$totalCash"

	#REINITIALIZE THE VARIABLES
	dayWin=0
	dayLoose=0
	totalCash=0
	echo " "
done
