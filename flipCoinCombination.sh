
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
doublet_percent[HH]="$((((countHH*100))/n))%"
doublet_percent[HT]="$((((countHT*100))/n))%"
doublet_percent[TH]="$((((countTH*100))/n))%"
doublet_percent[TT]="$((((countTT*100))/n))%"
echo "${!doublet_percent[@]}=${doublet_percent[@]}"

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
triplet_percent[HHH]="$((((countHHH*100))/n))%"
triplet_percent[HHT]="$((((countHHT*100))/n))%"
triplet_percent[HTH]="$((((countHTH*100))/n))%"
triplet_percent[HTT]="$((((countHTT*100))/n))%"
triplet_percent[THH]="$((((countTHH*100))/n))%"
triplet_percent[THT]="$((((countTHT*100))/n))%"
triplet_percent[TTH]="$((((countTTH*100))/n))%"
triplet_percent[TTT]="$((((countTTT*100))/n))%"
echo "${!triplet_percent[@]}=${triplet_percent[@]}"
