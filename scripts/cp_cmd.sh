#!/bin/bash
read -p "please input a excute cmd(eg:cat |cat | bash|quit):" command
[ -a /mnt/sysroot ] || mkdir /mnt/sysroot &> /dev/null
cpdir () {
	cmd=`which --skip-alias $command`
	if [ -f /mnt/sysroot$cmd ];then
		echo "the $cmd has been cp before"
	else
		local dir=`dirname $cmd`
		mkdir -p /mnt/sysroot$dir
		cp $cmd /mnt/sysroot$cmd
		echo "cp $cmd finished"
	fi
}
cplib () {
	cmd=`which --skip-alias $command`
	ldd $cmd |grep -o "/.*lib\(64\)\{0,1\}/[^[:space:]]\{1,\}" |while read i;do
		if [ ! -f /mnt/sysroot$i ];then
			local dir=`dirname $i`
			mkdir -p /mnt/sysroot$dir
			cp $i /mnt/sysroot$i
			echo "cp $i finished"
		else
			echo "$i has been cp before"
		fi
	done
}
type $command &> /dev/null || { echo the command is not exsit;exit 100; }
until [ "$command" == "quit" ];do
	type $command&>/dev/null|| { echo the command is not exsit;exit 100; }
	cpdir
	cplib
	read -p "please input new excute cmd(eg:cat|bash|quit):" command 
	cmd=`which --skip-alias $command`
done
