#!/bin/bash

# Autor: Carlos Nascimento, 2016-09-30
# 0.0.1 - show log last info about repositories

# getting repositories path
REPO=$(cut -d : -f 2 repositories)

# for with repositories list
for LINHA in $REPO; do

# getting last review 
REVIEW=$(svnlook youngest $LINHA)

# show info from review
echo $(svnlook info -r $REVIEW $LINHA)

# echo $LINHA

done
