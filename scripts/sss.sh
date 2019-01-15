#!/bin/bash

ss -nt|grep ESTAB|tr -s " " ":"|cut -d: -f6|sort| uniq -c > ssssss.txt
while read x y;
do
	if [ $x -gt 2 ];then
		echo $y
	fi
done < ssssss.txt	
