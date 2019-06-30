#!/bin/bash
#check number of arguments
if [[ "$#" -ne 1 ]] ; then
	echo "Invalid number of arguments"
elif [ "$1" -ge 0 ] 2>/dev/null; then #checks if argument is a positive integer
	
	curIterationNum=1 #holds current iteration number
	iterations="$1"

	while [[ $curIterationNum -le $iterations ]]; do
		
		echo "#$curIterationNum work"
		sleep 1500 #wait for 25 min
		
		if [[ $(( curIterationNum % 4 )) -eq 0 ]]; then #check if iteration is multiple of 4
			echo "#$curIterationNum long break time"
			sleep 900 #wait for 15 min

		else
			echo "#$curIterationNum break time"
			sleep 300 #wait for 5 min
		fi
		curIterationNum=$((curIterationNum+1))
	done
	echo "Finished"
	echo "You are done! Congratulations :)"

else
	echo "Please enter number of iterations as a positive integer"
	
fi
