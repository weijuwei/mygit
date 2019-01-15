#!/bin/bash

for i in `seq 1 5`;
do
	for (( j=5;j>=$i;j-- ));
	do
		echo -n " "
	done


	for j in `seq 1 $i`;
	do
		echo -ne " *"
	done
	echo
done
