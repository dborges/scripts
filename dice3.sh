#!/bin/sh

function roll() {
 echo $((RANDOM%6+1))
}

for i in {1..1000}
do
 r1=$(roll)
 r2=$(roll)
 rt=$(($r1 + $r2))
 ((rs[$rt]++))
done

echo "\nResults:\n"

for i in {2..12}
do
 echo "Totaling ${i}: ${rs[$i]}"
done
