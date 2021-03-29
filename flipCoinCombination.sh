#!/bin/bash -x
H=1
T=0
randomNum=$((RANDOM%2))
if [ $randomNum -eq $H ]
then
	echo "Head won"
else
	echo "Tail won"
fi
