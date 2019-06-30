#!/bin/bash
#lists all if no arguments
#can filter by date or by message cantaining a certain substring
date=
bodysubstr=
#get inputs
while getopts ':d:b:' opt; do
	case "$opt" in
		d)
			date="$OPTARG"
		;;	

		b)
			bodysubstr="$OPTARG"
		;;
		
	esac
done

cat reminders.csv > tmpviewfile.csv
if [[ ! -z "$date" ]]; then
	#echo 'Print by date:'
	awk -v x=$date -F',' '{if($2==x){  print $0;  }}' tmpviewfile.csv > tmpviewfile.csv.tmp
	cat tmpviewfile.csv.tmp > tmpviewfile.csv
	rm tmpviewfile.csv.tmp
fi
if [[ ! -z "$bodysubstr" ]]; then
	#echo 'Print by body substring:'
	awk -v x=$bodysubstr -F',' '{if($4~sprintf(".*%s.*",x)){  print $0;  }}' tmpviewfile.csv > tmpviewfile.csv.tmp
	cat tmpviewfile.csv.tmp > tmpviewfile.csv
	rm tmpviewfile.csv.tmp
fi

#display values according to the given parameters with formatting
echo 'id,date,time,body,job number' > tmpviewfile2
sort -t',' -k'2,3'  tmpviewfile.csv >> tmpviewfile2
cat tmpviewfile2 | column -s',' -t -n
rm tmpviewfile.csv
rm tmpviewfile2

