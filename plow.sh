#!/bin/bash

# Ready the output directory
rm -rf ./harvest
mkdir harvest


# Reading set data into the array
source setList.txt
iso=`date -I`

# Setting up the loop
for i in ${setList[@]}; do
	# Set up the harvest
	python ~/bin/pyoaiharvester/pyoaiharvest.py -l http://fsu.digital.flvc.org/oai2 -s $i -o harvest/$i$iso.xml
done
printf "\n\n#Harvest complete"
