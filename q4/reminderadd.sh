#!/bin/bash
# mandatory arguments: date, time, body
#given by options -d,-t, -b respectively

date=
time=
body=
#get inputs
while getopts ':d:t:b:' opt; do
	case "$opt" in
		d)
			date="$OPTARG"
		;;	

		t)
			time="$OPTARG"
		;;	

		b)
			body="$OPTARG"
		;;
		
	esac
done

if [ -z "$date" ]; then
    echo "date was NOT given, exit."
    exit 1; #exit indicating error
fi
if [ -z "$time" ]; then
    echo "time was NOT given, exit."
    exit 1; #exit indicating error
fi
if [ -z "$body" ]; then
    echo "body was NOT given, exit."
    exit 1; #exit indicating error
fi
#validate date and time
date -d "$date $time" 1>/dev/null 2>/dev/null
dateexitcode=$?
if [  $dateexitcode -ne 0 ]; then #if invalid date/time
	echo "Invalid date or time"
	exit 1;
fi


#set id of new reminder
touch reminders.csv
if [ -s reminders.csv ] ; then
	id=$( cat reminders.csv | tail -n 1 | awk -F',' '{print $1}' )
	(( id ++ ))
	
	
else
	id=0

fi

#add job to at and check if at is refusing to create job
job=$(echo "notify-send '$body' && sed -i '/^$id/d' reminders.csv" | at "$time $date"  2>&1 | awk  '/job/ {print $2;}')
if [ "$job" == "refusing" ] ; then
	echo "error in creating reminder. Maybe recheck the date and time?"
	exit 1
fi
#update reminders database
echo "$id,$date,$time,$body,$job" >> reminders.csv

#display addded data to the user
echo "added reminder:"
echo "id=$id"
echo "date=$date"
echo "time=$time"
echo "body=$body"



