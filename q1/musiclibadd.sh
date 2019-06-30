#!/bin/bash
#name is mandatory argument
#database has entries id,name,artist,genre,link

name=
artist=
genre=
link=

#get values
while getopts ':n:a:g:l:' opt; do
	case "$opt" in
		n)
			name="$OPTARG"
		;;	

		a)
			artist="$OPTARG"
		;;	

		g)
			genre="$OPTARG"
		;;
		l)
			link="$OPTARG"
		;;

		
	esac
done

if [ -z "$name" ]; then
    echo "song name was NOT given, exit."
    exit 1; #exit indicating error
fi

touch songdb.csv
#check if duplicate song exists by checking by name and artist
if [[ ! -z  $(awk -v x="$name" -v y="$artist" -F',' '{if($2==x && $3==y){print 1;}}' songdb.csv ) ]] ; then
	echo "song already exists in database"
	exit 1;
fi


#set id of the song
if [ -s songdb.csv ] ; then #check if db already has songs
	id=$( cat songdb.csv | tail -n 1 | awk -F',' '{print $1}' )
	(( id ++ ))	
else
	id=0
fi

#put song in database
echo "$id,$name,$artist,$genre,$link" >> songdb.csv

#output status of addition
echo "Added song:"
echo "id=$id"
echo "name=$name"
echo "artist=$artist"
echo "genre=$genre"
echo "link=$link"



