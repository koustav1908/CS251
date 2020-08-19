#!/bin/bash

if [ $# -eq 2 ]
then
	a=$1
	b=$2
	c=$((a+b))
	echo $c
	exit 0
else
	echo Wrong number of arguments, expected 2
	exit 1
fi
