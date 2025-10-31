#!/bin/bash


places=("kerala" "Andhra" "Telangana" "Bangalore" "Madhurai")

echo i want to visit ${places[3]} this year

#using arguments just for practice

places=$1
places=$2

echo i will visit ${places[$1]} in 2026 and wont  visit ${places[$2]} this year

