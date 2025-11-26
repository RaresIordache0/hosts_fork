#!/bin/bash

n="$1"
host="$2"

file="$HOME/Desktop/liniiping"
ping -c "$n" "$host" > "$file"

times=$(grep "time=" "$file" | cut -d"=" -f4 |cut -d" " -f1)

min=100
max=0
sum=0
nr=0

for t in $times
do	
	cmp=$(echo "$t<$min" | bc -l)
	if [ $cmp -ne 0 ]
	then
		
		max="$t"
	else
		min="$t"
	nr=$((nr+1))
	sum=$(echo "$sum+$t" | bc -l)
	fi
done

echo "Timp minim: $min"
echo "Timp maxim: $max"
echo "Suma: $sum"
echo "$nr"
