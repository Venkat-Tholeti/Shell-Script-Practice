#!/bin/bash

number1=$1
number2=$2

Timestamp=$(date)

Total=$(($number1+$number2))

echo Addition of $number1 and $number2 is $Total

echo This script ran on $Timestamp

