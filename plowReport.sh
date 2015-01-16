#!/bin/bash

# Define breaker function
breaker () {
	python ~/bin/dc_breaker/dc_breaker.py -e $1 $2 | wc -l
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
	recNum=$(( `count ./harvest/$i* record` / 2 ))
	if [ $recNum -eq 0 ]; then
		echo "$i, 0, 0, 0" >>fsudlReport$iso.csv
	else
		subNum=`breaker subject ./harvest/$i*`
		echo $i "," $recNum "," $subNum "," $(( $subNum / $recNum )) >>fsudlReport$iso.csv
	fi
done
printf "\nReport filed.\n\n"
