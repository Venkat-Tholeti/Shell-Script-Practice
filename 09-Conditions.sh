#!/bin/bash

# -gt ---> greater than
# -lt ---> less than
# -eq ---> equal 
# -ne ---> not equal


Number=$1

if [ $Number -lt 10 ]
then 
    echo "Input number is less than 10"
else
    echo "Input number is not less than 10"
fi

