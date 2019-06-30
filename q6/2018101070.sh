#!/bin/bash
#check number of arguments
if [[ "$#" -ne 2 ]]; then
	echo "Wrong number of arguments"
else
	#storing movie file path and movie destination path
	movinput="$1"
	movdest="$2"
	mkdir "$movdest/Bad"
	mkdir "$movdest/Average"
	mkdir "$movdest/Good"
	mkdir "$movdest/Awesome"
	
	while read line; do #Process file line by line
   		movname=$(echo "$line"| cut -f 1 -d ':') #Store movie name and score
   		movscore=$(echo "$line"| cut -f 2 -d ':')


   		#Create empty .mp4 files in appropriate folders

   		if [ 1 -eq "$(echo "${movscore} < 5" | bc)" ]; then
   			touch "$movdest/Bad/$movname.mp4"
   		elif [ 1 -eq "$(echo "${movscore} < 8" | bc)" ]; then
   			touch "$movdest/Average/$movname.mp4"
   		elif [ 1 -eq "$(echo "${movscore} < 9" | bc)" ]; then
   			touch "$movdest/Good/$movname.mp4"
   		else 
   			touch "$movdest/Awesome/$movname.mp4"
   		fi
	done < "$movinput"


fi
