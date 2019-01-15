#!/bin/bash


for (( i=1;i<10;i++ ))
do
	for (( j=1;j<=i;j++ ))
	do
		echo -ne "$j*$i=$[$i*$j]\t"
	done
	echo
done	
