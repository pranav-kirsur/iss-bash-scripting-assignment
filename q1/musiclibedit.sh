#!/bin/bash
#it edits by deleting a song and then calling musiclibadd.sh
#note that if id is not present in list it simply creates a new entry
#note that all of the new values must be specified else it defaults to a blank string

name=
artist=
genre=
link=
id=

#get values
while getopts ':n:a:g:l:i:' opt; do
	case "$opt" in
		i)
			id="$OPTARG"
		;;
		a)
			artist="$OPTARG"
		;;	

		n)
			name="$OPTARG"
		;;	

		g)
			genre="$OPTARG"
		;;
		l)
			link="$OPTARG"
		;;
		
	esac
done
#check if id is not specified
if [ -z "$id" ]; then
    echo "id was NOT given, exit."
    exit 1; #exit indicating error
fi
#check if new name is an empty string
if [ -z "$name" ]; then
    echo "new name cannot be empty, exit."
    exit 1; #exit indicating error
fi

#edit by deleting first and then adding new
./musiclibdelete.sh $id
./musiclibadd.sh -n"$name" -a"$artist" -g"$genre" -l"$link"