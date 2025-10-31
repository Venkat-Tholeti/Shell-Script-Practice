#!/bin/bash


places=("kerala" "Andhra" "Telangana" "Bangalore" "Madhurai")

echo i want to visit ${places[3]} this year

#using arguments just for practice

places=$1
places=("kerala" "Andhra" "Telangana" "Bangalore" "Madhurai")

echo i dont want to visit ${places[$1]} this year