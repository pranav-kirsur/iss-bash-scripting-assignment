#!/bin/bash
#census
cat file1.csv file2.csv > target_file.csv
echo 'Index,Age,workclass,fnlwgt,education,education-num,marital-status,occupation,relationship,race,sex,capital-gain,capital-loss,native-country,class' > header.csv
cat header.csv target_file.csv  > tmpfile
rm target_file.csv
mv tmpfile target_file.csv

#replace ? with roll number
sed -i 's/\?/2018101070/g' target_file.csv