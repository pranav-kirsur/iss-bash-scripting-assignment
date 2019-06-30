#!/bin/bash
#check if number of arguments is correct
if [ "$#" -ne 1 ]; then
	echo "pass only 1 argument: the id of the element you wish to delete"
	exit 1
fi
id=$1
#check if db is empty
if [ ! -s songdb.csv ] ; then
	echo "database has no songs."
	exit 1;
fi
#print all lines whose id is not given id into another file
awk -v x="$id" -F','  '{if($1!=x){print $0;}}' songdb.csv > tempfile.csv
cat tempfile.csv > songdb.csv
rm tempfile.csv
echo "song with id $id deleted"