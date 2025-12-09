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

dnf list installed mysql
if [ $? -eq 0 ]
then
   echo "MYSQL already INSTALLED"
   exit 1
else 
   echo "MYSQL is NOT INSTALLED, PROCEEDING TO INSTALLATION NOW"
   
   sleep 5
   
   dnf install mysql -y
   if [ $? -eq 0 ]
   then 
       echo "MYSQL installation is SUCCESS"
   else 
       echo "FAILED to install MYSQL"
       exit 1
    fi
fi

# dnf install mysql -y

# if [ $? -eq 0 ]
# then 
#     echo "MYSQL installation is SUCCESS"
# else 
#     echo "FAILED to install MYSQL"
#     exit 1
# fi