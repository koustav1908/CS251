#!/bin/bash

if [ $# -lt 1 ]
then
	echo No numbers given
    exit 1
else
	let s=0
	for i in $@; do
		s=$(bash ./sum.sh $i $s)
	done
	echo $s
fi
