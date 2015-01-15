#!/bin/bash
# Read date and start report
iso=`date -I`
touch fsudlReport$iso.csv

# Read set list into array
source setList.txt

echo 'setSpec, indexNumber' >>fsudlReport$iso.csv

# Setting up the report loop
for i in ${setList[@]}; do
	echo $i "," $f >>fsudlReport$iso.csv
done
printf "\n\nReport filed."
	


