#!/bin/bash

# Define breaker function
breaker () {
	python ~/bin/dc_breaker/dc_breaker.py -e $1 $2
}
# Define counting function
count () {
	xmlstarlet el $1 | grep $2 | wc -l
}

# Read date and start report
iso=`date -I`
touch fsudlReport$iso.csv

# Read set list into array
source setList.txt

echo 'setSpec, # of records, # of subjects, avg subjects per record' >>fsudlReport$iso.csv

# Setting up the report loop
for i in ${setList[@]}; do
	echo "Analysing $i"
	echo $i "," `count $i* record` "," `breaker subject $i* | wc -l` "," `breaker subject $i* / count $i* record` >>fsudlReport$iso.csv
done
printf "\nReport filed.\n\n"
	


