#!/bin/bash
source setList.txt
for i in ${setList[@]}; do
	echo ${setList[i]}
done
