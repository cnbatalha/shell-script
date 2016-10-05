#!/bin/bash

# Autor: Carlos Nascimento, 2016-09-30
# 0.0.1 - show log last info about repositories

# getting repositories path
REPO=$(cut -d : -f 2 repositories)

# for with repositories list
for LINHA in $REPO; do

echo "====================================="
echo "Projeto:" + $LINHA

# getting last review 
REVIEW=$(svnlook youngest $LINHA)

	# loop to view last 5 logs
	for index in $(seq $((REVIEW-5)) $REVIEW);
	do
	
	echo "$index"
	# show info from review
	echo $(svnlook info -r $index $LINHA)

	done

# echo $LINHA

echo "====================================="

done
