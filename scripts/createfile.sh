#!/bin/bash
# create 10 files
for i in {1..10};
do
	fileName=$(openssl rand -base64 100|tr -dc '[:alpha:]'|head -c 8)
	touch "$fileName".txt
done
echo "create file over!"
