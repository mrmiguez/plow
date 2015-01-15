#!/bin/bash

# Define breaker function
breaker () {
	python ~/bin/dc_breaker/dc_breaker.py -e $1 $2
}

# Read date and start report
iso=`date -I`
touch fsudlReport$iso.csv

# Read set list into array
source setList.txt

echo 'setSpec, # of IID' >>fsudlReport$iso.csv

# Setting up the report loop
for i in ${setList[@]}; do
	echo "Analysing $i"
	echo $i "," `breaker identifier ./harvest/$i* | wc -l` >>fsudlReport$iso.csv
done
printf "\nReport filed.\n\n"
	


