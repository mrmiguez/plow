#!/bin/bash
# Configuration: Change http://yourOAIfeedHere on line 24 to the URL of your digital library's OAI-PMH feed.  
# fsudlReportYYYY-MM-DD.csv is the default output file. Replace fsudlReport to change the output file.

# Ready the output directory
rm -rf ./harvest
mkdir harvest

# Define report functions
breaker () {
	python ~/bin/dc_breaker/dc_breaker.py -e $1 $2 | wc -l
}
count () {
	xmlstarlet el $1 | grep $2 | wc -l
}

# Reading set data into the array
source setList.txt
iso=`date -I`

# Setting up the loop
for i in ${setList[@]}; do
	# Set up the harvest. The URL for you library's OAI feed goes between -l and -s
	python ~/bin/pyoaiharvester/pyoaiharvest.py -l http://yourOAIfeedHere -s $i -o harvest/$i$iso.xml
done
printf "\n\nHarvest complete.\n\n"

# Start report. Change all instances of fsudlReport to what you want your output report to be called.
touch fsudlReport$iso.csv
echo 'setSpec, # of records, # of subjects, avg subjects per record' >>fsudlReport$iso.csv

# Setting up the report loop
for i in ${setList[@]}; do
	echo "Analysing $i"
	recNum=`count ./harvest/$i* record$`
	if [ $recNum -eq 0 ]; then
		echo "$i, 0, 0, 0" >>fsudlReport$iso.csv
	else
		subNum=`breaker subject ./harvest/$i*`
		echo $i "," $recNum "," $subNum "," $(( $subNum / $recNum )) >>fsudlReport$iso.csv
	fi
done
printf "\nReport filed.\n\n"

# archive harvest
tar cvf - ./harvest/* | gzip > fsudlharvest$iso.tar.gz
printf "\nResults archived.\n\n"
