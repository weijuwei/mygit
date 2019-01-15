#!/bin/bash

for i in {1..10} ;
do 
	id "user$i" &> /dev/null
	if [ $? -ne 0 ] ; then
		useradd user$i &> /dev/null
		user_passwd=`openssl rand -base64 10 | head -c 10`
		echo "$user_passwd" | passwd "user$id" --stdin &> /dev/null
		echo "user$i  $user_passwd" >> user_pass.txt
	fi	
done
echo "add user success!!!!!"
