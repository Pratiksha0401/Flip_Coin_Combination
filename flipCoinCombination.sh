#!/bin/bash -x
declare -A singlet
H=1
T=0
countH=0
countT=0
read -p "Enter a number for which you wnat to flip coin:" n
for (( i=1;i<=n;i++ ))
do
	randomNum=$((RANDOM%2))
	if [ $randomNum -eq $H ]
	then
		singlet[$i]="H"
		((countH++))
	else
		singlet[$i]="T"
		((countT++))
	fi
done
echo "Singlet Combinations are ${singlet[@]}"
echo "Percentage of H is $(((($countH*100))/n))"
echo "Percentage of T is $(((($countT*100))/n))"
