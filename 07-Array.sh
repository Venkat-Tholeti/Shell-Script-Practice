#!/bin/bash


places=("kerala" "Andhra" "Telangana" "Bangalore" "Madhurai")

echo i want to visit ${places[0]} this year

echo i want to visit all the below places 
${places[@]}

#using arguments just for practice

places=$1


echo i will not visit ${places[$1]} in 2026 # This will not work with index 0 that means kerala wont be shown in ouput

