#!/bin/bash

echo -e "\c" > "$3"
key=$2
while [ true ];do
	if [ $(grep -rnw $key $1/* | grep ":2:" | cut -d':' -f 1) ];then
		echo $(head -n 1 $(grep -rnw $key $1/* | grep ":2:" | cut -d':' -f 1)) >> "$3"
		key=$(tail -n 1 $(grep -rnw $key $1/* | grep ":2:" | cut -d':' -f 1))
	else
		break
	fi
done
exit 0
