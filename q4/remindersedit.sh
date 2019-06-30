#!/bin/bash
#it edits by deleting a reminder and then calling reminderadd.sh
#note that if id is not present in list it simply creates a new entry
date=
time=
body=
id=

while getopts ':d:t:b:i:' opt; do
	case "$opt" in
		i)
			id="$OPTARG"
		;;
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

if [ -z "$id" ]; then
    echo "id was NOT given, exit."
    exit 1; #exit indicating error
fi
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

#validate date and time by using date
date -d "$date $time" 1>/dev/null 2>/dev/null
dateexitcode=$?
if [  $dateexitcode -ne 0 ]; then #if invalid date/time
	echo "Invalid date or time"
	exit 1;
fi

#edit by deleting reminder with given id and adding a new reminder
./remindersdelete.sh $id
./reminderadd.sh -d"$date" -t"$time" -b"$body"