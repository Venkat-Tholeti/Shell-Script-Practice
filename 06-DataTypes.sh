#!/bin/bash


number1=$1
number2=$2
number3=40
number4=50

Timestamp=$(date)

Total=$(($number1+$number2))
Minus=$(($number3-$number4))

echo Addition of $number1 and $number2 is $Total
echo Subtraction of $number3 and $number4 is $Minus

echo This script ran on $Timestamp

