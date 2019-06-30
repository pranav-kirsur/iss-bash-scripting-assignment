#!/bin/bash
#check if number of parameters is correct
if [[ "$#" -ne 2 ]]; then
	echo "Wrong number of parameters:"
	echo "Use this format: searching.sh '<stringToSearch>' '<URL>' "

else
	#storing inputs
	stringToSearch="$1"
	url="$2"

	#validating URL by checking exit code of wget --spider
	wget -q --spider "$url"
	if [[ "$?" -eq 0 ]]; then
		#URL is validated
		wget -q -O- --output-document='fetcheddoc.html' "$url"  
		#save doc as fetcheddoc.html
		
		echo -n "$stringToSearch "
		sed ':begin;$!N;s/\n/ /;tbegin' fetcheddoc.html| grep -E '<[Bb][Oo][Dd][Yy].*?>.*?</[Bb][Oo][Dd][Yy]>' | sed -E 's/[ \t]+/ /g' | sed -e 's/<[^>]*>/ /g'  | grep -oi "$stringToSearch" | wc -l
		rm fetcheddoc.html		

	else
		#error
		echo "There appears to be an error: check your URL or your internet connection"
	fi


	

fi
	
