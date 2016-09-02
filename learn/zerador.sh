#!/bin/bash

# decrementa numero ate zero

numero=$1

for passo in $(seq $1)
do
	echo $((numero-passo))
done
