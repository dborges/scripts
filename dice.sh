#!/bin/bash
# How random is RANDOM?

RANDOM=$$       # Reseed the random number generator using script process ID.

PIPS=6          # A die has 6 pips.
MAXTHROWS=6000   # Increase this if you have nothing better to do with your time.
throw=0         # Throw count.

ones=0          #  Must initialize counts to zero,
twos=0          #+ since an uninitialized variable is null, not zero.
threes=0
fours=0
fives=0
sixes=0

one=0
two=0          #+ since an uninitialized variable is null, not zero.
three=0
four=0
five=0
sixe=0

print_result ()
{
echo "Die # 1"
echo "ones =   $ones"
echo "twos =   $twos"
echo "threes = $threes"
echo "fours =  $fours"
echo "fives =  $fives"
echo "sixes =  $sixes"
echo

echo "Die # 2" 
echo "ones =   $one"
echo "twos =   $two"
echo "threes = $three"
echo "fours =  $four"
echo "fives =  $five"
echo "sixes =  $sixe"
echo
}

update_count()
{
case "$1" in
  0) let "ones += 1";;   # Since die has no "zero", this corresponds to 1.
  1) let "twos += 1";;   # And this to 2, etc.
  2) let "threes += 1";;
  3) let "fours += 1";;
  4) let "fives += 1";;
  5) let "sixes += 1";;
esac

case "$2" in
  0) let "one += 1";;
  1) let "two += 1";;
  2) let "three += 1";;
  3) let "four += 1";;
  4) let "five += 1";;
  5) let "six += 1";;
esac
}


echo


while [ "$throw" -lt "$MAXTHROWS" ]
do
  let "die1 = RANDOM % $PIPS"
  let "die2 = RANDOM % $PIPS"
  update_count $die1 $die2
  let "throw += 1"
done  

print_result

exit 0

#  The scores should distribute fairly evenly, assuming RANDOM is fairly random.
#  With $MAXTHROWS at 600, all should cluster around 100, plus-or-minus 20 or so.
#
#  Keep in mind that RANDOM is a pseudorandom generator,
#+ and not a spectacularly good one at that.

#  Randomness is a deep and complex subject.
#  Sufficiently long "random" sequences may exhibit
#+ chaotic and other "non-random" behavior.

# Exercise (easy):
# ---------------
# Rewrite this script to flip a coin 1000 times.
# Choices are "HEADS" and "TAILS".
