#!/bin/bash -x
declare -A singlet
H=1
T=0
countH=0
countT=0
read -p "Enter a number for which you want to flip coin:" n
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
result1=$(((($countT*100))/n))
result2=$(((($countH*100))/n))
if [ $result1 -eq $result2 ]
then
	echo "Tie between singlet H & T"
elif [ $result1 -gt $result2 ]
then
	echo "Winning singlet is H having $result1 %"
else
	echo "winning singlet is T having $result2 %"
fi


declare -A doublet
declare -A doublet_percent
countHH=0
countHT=0
countTH=0
countTT=0
for (( i=1;i<=n;i++ ))
do
	combiD=$((RANDOM%2))$((RANDOM%2))
	if [ $combiD -eq 11 ]
	then
		doublet[$i]="HH"
		((countHH++))
	elif [ $combiD -eq 10 ]
	then
		doublet[$i]="HT"
		((countHT++))
	elif [ $combiD -eq 01 ]
   then
      doublet[$i]="TH"
      ((countTH++))
	else
      doublet[$i]="TT"
      ((countTT++))
	fi
done
echo "Doublet combinations occurs are ${doublet[@]}"

d1="$((((countHH*100))/n))"
doublet_percent[HH]="$d1"

d2="$((((countHT*100))/n))"
doublet_percent[HT]="$d2"

d3="$((((countTH*100))/n))"
doublet_percent[TH]="$d3"

d4="$((((countTT*100))/n))"
doublet_percent[TT]="$d4"

echo "${!doublet_percent[@]}=${doublet_percent[@]} %" 
declare -a array_D
array_D=( [0]=$d1 [1]=$d2 [2]=$d3 [3]=$d4 )
echo "${array_D[@]}"

if [ $countHH -gt $countHT ] && [ $countHH -gt $countTH ] && [ $countHH -gt $countTT ]
then
	echo "Winning combination is HH $d1 %"
elif [ $countHT -gt $countTH ] && [ $countHT -gt $countTT ]
then
	echo "winning combination is HT with $d2 %"
elif [ $countTH -gt $countTT ]
then
	echo "winning combination is TH with $d3 %"
else
	echo "winning combination is TT with $d4 %"
fi


declare -A triplet
declare -A triplet_percent
countHHH=0
countHHT=0
countHTH=0
countHTT=0
countTHH=0
countTHT=0
countTTH=0
countTTT=0
for (( i=1;i<=n;i++ ))
do
	combiT=$((RANDOM%2))$((RANDOM%2))$((RANDOM%2))
	if [ $combiT -eq 111 ]
	then
		triplet[$i]="HHH"
		((countHHH++))
	elif [ $combiT -eq 110 ]
	then
		triplet[$i]="HHT"
		((countHHT++))
	elif [ $combiT -eq 101 ]
   then
      triplet[$i]="HTH"
      ((countHTH++))
	elif [ $combiT -eq 100 ]
   then
      triplet[$i]="HTT"
      ((countHTT++))
 	elif [ $combiT -eq 011 ]
   then
      triplet[$i]="THH"
      ((countTHH++))
 	elif [ $combiT -eq 010 ]
   then
      triplet[$i]="THT"
      ((countTHT++))
 	elif [ $combiT -eq 001 ]
   then
      triplet[$i]="TTH"
      ((countTTH++))
	else
      triplet[$i]="TTT"
      ((countTTT++))
	fi
done
echo "Triplet combinations occurs are ${triplet[@]}"
t1="$((((countHHH*100))/n))"
t2="$((((countHHT*100))/n))"
t3="$((((countHTH*100))/n))"
t4="$((((countHTT*100))/n))"
t5="$((((countTHH*100))/n))"
t6="$((((countTHT*100))/n))"
t7="$((((countTTH*100))/n))"
t8="$((((countTTT*100))/n))"

triplet_percent[HHH]="$t1"
triplet_percent[HHT]="$t2"
triplet_percent[HTH]="$t3"
triplet_percent[HTT]="$t4"
triplet_percent[THH]="$t5"
triplet_percent[THT]="$t6"
triplet_percent[TTH]="$t7"
triplet_percent[TTT]="$t8"
echo "${!triplet_percent[@]}=${triplet_percent[@]}%"

if [ $t1 -gt $t2 ] && [ $t1 -gt $t3 ] && [ $t1 -gt $t4 ] && [ $t1 -gt $t5 ] && [ $t1 -gt $t6 ] && [ $t1 -gt $t7 ] && [ $t1 -gt $t8 ]
then
	echo "Winning combination is HHH with $t1 %"
elif [ $t2 -gt $t3 ] && [ $t2 -gt $t4 ] && [ $t2 -gt $t5 ] && [ $t2 -gt $t6 ] && [ $t2 -gt $t7 ] &&[ $t2 -gt $t8 ]
then
	echo "Winning combination is HHT with $t2 %"
elif [ $t3 -gt $t4 ] && [ $t3 -gt $t5 ] && [ $t3 -gt $t6 ] && [ $t3 -gt $t7 ] && [ $t3 -gt $t8 ]
then
	echo "Winning combination is HTH with $t3 %"
elif [ $t4 -gt $t5 ] && [ $t4 -gt $t6 ] &&[ $t4 -gt $t7 ] &&[ $t4 -gt $t8 ]
then
   echo "Winning combination is HTT with $t4 %"
elif [ $t5 -gt $t6 ] && [ $t5 -gt $t7 ] && [ $t5 -gt $t8 ]
then
   echo "Winning combination is THH with $t5 %"
elif [ $t6 -gt $t7 ] && [ $t6 -gt $t8 ]
then
   echo "Winning combination is THT with $t6 %"
elif [ $t7 -gt $t8 ]
then
   echo "Winning combination is TTH with $t7 %"
else
	echo "winning combination is TTT with $t8 %"
fi
