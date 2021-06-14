#!/bin/bash

array[0]="addi"
array[1]="sub"
array[2]="multi"
array[3]="div"

size=${#array[@]}
#index=$(($RANDOM % $size))
#echo ${array[$index]}

highScore=0
addi () { echo "$1 + $2"; sol=$(($1 + $2)); }
sub () { echo "$1 - $2"; sol=$(($1 - $2)); }
multi () { echo "$1 * $2"; sol=$(($1 * $2)); }
div () { echo "$1 % $2"; sol=$(bc -l <<< $1/$2); }

MentalMath () {
	read -p "range: (defaults to 100) " VARIABLE
	RANGE=${VARIABLE:=100}
	read -p "time in seconds: (defaults to one minute) " VARIABLE
	time=${VARIABLE:=60}
	echo "you have $time seconds"
	SECONDS=0
	CurrentCount=0
	#echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
	while [[ $SECONDS -le $time ]]; do
		i=$((RANDOM%$RANGE+1))
		j=$((RANDOM%$RANGE+1))
		index=$(($RANDOM % $size))
		${array[$index]} $i $j
		#echo $sol
		read -p "Answer : " ans
		#Note normally numerical equality is -eq but not within 
		#expansion operator ((...))
		test=`bc -l <<< "$sol-$ans"` #; if (( $(bc -l <<< "${test#-} <= .1") )) $(( $ans != $sol ))
		#not strict equality if division isn't clean
		while [ $(bc -l <<< "${test#-} <= .1" ) -eq 0 ]  && [[ $SECONDS -le $time ]]
		do
			echo no
			read -p "Answer : " ans
			test=`bc -l <<< "$sol-$ans"`
		done
		CurrentCount=$((CurrentCount+1))
		echo "corect. Current count: $CurrentCount"	

	done

	if [[ $CurrentCount -gt $highScore ]]
	then
		echo "Nice, you beat your high schore of $highScore"
		highScore=$CurrentCount

	fi
	echo "time's up. Total Correct: $CurrentCount"
	echo "current high score: $highScore"
}
