
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

