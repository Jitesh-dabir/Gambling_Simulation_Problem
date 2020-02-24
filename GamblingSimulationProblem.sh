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
MONTH_IN_YEAR=1

#VARIABLE
cash=0
limit=0
dayWin=0
dayLoose=0
flag=0

#FUNCTION TO GET LUCKY DAY
function luckyDay()
{
	for ((j=0; j<${#totalCashMonth[@]}; j++))
	do
		if [ $(echo "${totalCashMonth[j]} -gt $max") ]
		then
			max=$((${totalCashMonth[j]}))
			maxday=$j
		fi
	done
	echo "most lucky is day is $maxday cash:$max"
}

#FUNCTION TO GET UNLUCKY DAY
function unluckyDay()
{
	for ((j=0; j<${#totalCashMonth[@]}; j++))
	do
		if [ $(echo "${totalCashMonth[j]} -lt $min") ]
		then
			min=$((${totalCashMonth[j]}))
			minday=$j
		fi 
	done
	echo "most unlucky is day is $minday cash:$min"
}

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
while [[ flag -ne 1 ]]
do
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
				totalCashMonth[$day]=$totalCash
		done
		echo "........................MONTH $month........................."
		echo ""
		echo "Total days won   $dayWin days by $(($dayWin*50))"
		echo "Total days Loose $dayLoose days by $(($dayLoose*50))"
		echo "Total Cash for a month    :$totalCash"

		#REINITIALZE VARIABLE
		dayWin=0
		dayLoose=0
		echo " "
		min=${totalCashMonth[0]}
		max=${totalCashMonth[0]}
		maxday=0
		minday=0
		#FUNCTION CALL TO GET LUCKY DAY
		echo "$(luckyDay)"

		#FUNCTION CALL TO GET UNLUCKY DAY
		echo "$(unluckyDay)"
		echo ""
	done

	#YOU CAN PLAY IF YOU HAVE CASH TO PLAY NEXT MONTH
	if [ $totalCash -gt 0 ]
	then
		echo ".........................................."
		echo "You can play for next $MONTH_IN_YEAR month"
		echo ".........................................."
	else
		flag=1
	fi
	echo "Total Cash:$totalCash"
	totalCash=0
	cashPerDay=0
	echo "........................YEAR END........................."
	month=0
done
echo "........................................................."
echo "You Don't have cash to play.."
echo "........................................................."
