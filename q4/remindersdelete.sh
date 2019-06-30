#!/bin/bash
#check if only one argument is present
if [ "$#" -ne 1 ]; then
	echo "pass only 1 argument: the id of the element you wish to delete"
	exit 1
fi
#remove reminders with given id
id=$1
awk -v x="$id" -F','  '{if($1!=x){print $0;}}' reminders.csv > tempfile.csv
jobdelid=$(awk -v x="$id" -F','  '{if($1==x){print $5;}}' reminders.csv ) #id of job to be deleted
cat tempfile.csv > reminders.csv
rm tempfile.csv
#remove reminder from atjobs
atrm "$jobdelid"