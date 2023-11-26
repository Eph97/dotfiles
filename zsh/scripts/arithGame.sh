#!/bin/zsh

# array[0]="addi"
# array[1]="sub"
# array[2]="multi"
# array[3]="div"

array=(
"addi"
"sub"
"multi"
"div"
)

# size=${#array[@]}
size=${#array[@]}
#index=$(($RANDOM % $size))
#echo ${array[$index]}

highScore=0


addi () {
	i=$((RANDOM%$RANGE+1))
	j=$((RANDOM%$RANGE+1))
	echo "$i + $j"; sol=$(($i + $j)); }
sub () {
	i=$((RANDOM%$RANGE+1))
	j=$((RANDOM%$RANGE+1))
	if [ $j -ge $i ]
	then
		echo "$j - $i"; sol=$(($j - $i));
	else
		echo "$i - $j"; sol=$(($i - $j));
	fi
}

multi () {
	i=$((RANDOM%12+1))
	j=$((RANDOM%$RANGE+1))
	echo "$i * $j"; sol=$(($i * $j)); }
div () { 
	i=$((RANDOM%12+1))
	j=$((RANDOM%$RANGE+1))
	multi=$(($i * $j))
	# echo "$multi % $j"; sol=$(bc -l <<< $i/$j); }
	echo "$multi % $i"; sol=$j; }

MentalMath () {
	# read -p "range: (defaults to 100) " VARIABLE
	RANGE=${VARIABLE:=100}
	# read -p "time in seconds: (defaults to two minute) " VARIABLE
	# time=${VARIABLE:=120}
	time=120
	echo "you have $time seconds"
	SECONDS=0
	CurrentCount=0
	#echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
	while [[ $SECONDS -le $time ]]; do
		# if [ $i -ge $j ]; then first=$i second=$j; else first=$j second=$i; fi 	
		index=$(($RANDOM % $size+1))
		${array[$index]}

		echo "Answer "; read ans
		#Note normally numerical equality is -eq but not within 
		#expansion operator ((...))
		test=`bc -l <<< "$sol-$ans"` #; if (( $(bc -l <<< "${test#-} <= .1") )) $(( $ans != $sol ))
		#not strict equality if division isn't clean
		while [ $(bc -l <<< "${test#-} <= .1" ) -eq 0 ]  && [[ $SECONDS -le $time ]]
		do
			echo no
			echo "Answer : "
			read ans
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
