#!/bin/bash

#EXIT CODES 
#0 - SUCCESS
#1-127 - Failures # OTHER THAN ZERO ANY EXIT STATUS IS FAILURE


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR: USER NEED TO SWITCH TO ROOT ACCESS"
   exit 1 
else
   echo "USER HAS ROOT PRIVILEGES"
fi

dnf install mysql -y