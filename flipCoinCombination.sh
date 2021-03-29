#!/bin/bash -x
H=1
T=0
randomNum=$((RANDOM%2))
if [ $randomNum -eq $H ]
then
	echo "Head wins"
else
	echo "Tail wins"
fi
