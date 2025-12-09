#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR: USER NEED TO SWITCH TO RROT ACCESS"
else
   echo "USER HAS ROOT PRIVILEGES"
fi

dnf install mysql -y