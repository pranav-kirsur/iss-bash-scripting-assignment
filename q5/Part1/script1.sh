#!/bin/bash
#recursively print last modified date and time
find . -printf '%T@ %t %p\n' |  awk -F' ' '{print $2,$3,$4,$6,$5,$7;}'

#find all commands that start with lo
initifs=$IFS
IFS=':'
for i in $PATH; do
	ls $i 2> /dev/null| egrep "^lo" | while read line ; do #process line by line and redirect stderr of ls to /dev/null
		whatis $line >> 2018101070.txt
	done  
done
IFS=$initifs #restore initial IFS

#display word count of file
wc -l < 2018101070.txt 

#display longest line
while read -r line; do
    (( ${#line} > max )) && max=${#line} && longest="$line"
done < 2018101070.txt
echo "$longest"

cat 2018101070.txt > backup.txt

#replace function by method
sed 's/function/method/g' backup.txt > 2018101070.txt


#census
cat file1.csv file2.csv > target_file.csv
echo 'Index,Age,workclass,fnlwgt,education,education-num,marital-status,occupation,relationship,race,sex,capital-gain,capital-loss,native-country,class' > header.csv
cat header.csv target_file.csv  > tmpfile
rm target_file.csv
mv tmpfile target_file.csv

sed -i 's/\?/2018101070/g' target_file.csv
