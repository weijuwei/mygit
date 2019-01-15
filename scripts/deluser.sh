#!/bin/bash
#批量删除用户
while read line ;
do
	username=`echo $line | cut -d: -f1`
	echo $username | grep -E "^user[0-9]+$" && userdel -r $username && echo "$username is removed"
done < /etc/passwd
