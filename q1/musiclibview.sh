#!/bin/bash
#view songs in db in formatted manner
#allows filtering by artist or genre or both
artist=
genre=
while getopts ':a:g:' opt; do
	case "$opt" in
		a)
			artist="$OPTARG"
		;;	

		g)
			genre="$OPTARG"
		;;
		
	esac
done

cat songdb.csv > tmpviewfile.csv
if [[ ! -z "$artist" ]]; then
	#Filter by artist
	awk -v x="$artist" -F',' '{if($3==x){  print $0;  }}' tmpviewfile.csv > tmpviewfile.csv.tmp
	cat tmpviewfile.csv.tmp > tmpviewfile.csv
	rm tmpviewfile.csv.tmp
fi
if [[ ! -z "$genre" ]]; then
	#Print by genre
	awk -v x="$genre" -F',' '{if($4==x){  print $0;  }}' tmpviewfile.csv > tmpviewfile.csv.tmp
	cat tmpviewfile.csv.tmp > tmpviewfile.csv
	rm tmpviewfile.csv.tmp
fi

#display in a formatted manner
echo 'id,song,artist,genre,link' > anothertempfile
cat anothertempfile tmpviewfile.csv | column -s',' -t -n
rm tmpviewfile.csv
rm anothertempfile

