#!/bin/bash

RANDOM=$$
throw=0
max=1000


two=0
three=0
four=0
five=0
six=0
seven=0
eight=0
nine=0
ten=0
eleven=0
twelve=0


counter ()
{
case "$1" in
  2) let "two += 1";;
  3) let "three += 1";;
  4) let "four += 1";;
  5) let "five += 1";;
  6) let "six += 1";;
  7) let "seven += 1";;
  8) let "eight += 1";;
  9) let "nine += 1";;
  10) let "ten += 1";;
  11) let "eleven += 1";;
  12) let "twelve += 1";;
esac
}


roll ()
{
while [ "$throw" -lt "$max" ]
do
let "die1 = RANDOM % 6 + 1"
let "die2 = RANDOM % 6 + 1"
total=$(($die1 + $die2))

counter $total

#echo "You rolled a" $total
let "throw += 1"
done

}

roll

stats ()
{

echo "twos =    $two"
echo "threes =  $three"
echo "fours =   $four"
echo "fives =   $five"
echo "sixes =   $six"
echo "sevens =  $seven"
echo "eights =  $eight"
echo "nines =   $nine"
echo "tens =    $ten"
echo "elevens = $eleven"
echo "twelves = $twelve"

}

stats

exit 0
