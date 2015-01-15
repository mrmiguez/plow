#!/bin/bash
# Read date and start report
iso=`date -I`
touch fsudlReport$iso.csv

# Read set list into array
source setList.txt

echo 'setSpec, # of IID' >>fsudlReport$iso.csv

# Setting up the report loop
for i in ${setList[@]}; do
	echo $i "," `python ~/bin/dc_breaker/dc_breaker.py -e identifier ./harvest/$i* | wc -l` >>fsudlReport$iso.csv
done
printf "\n\nReport filed.\n"
	


