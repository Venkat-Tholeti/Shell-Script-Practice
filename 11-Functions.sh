#!/bin/bash

# Goal is to install mysql, nginx and python 3 using functions using less code


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR: USER NEED TO SWITCH TO ROOT ACCESS"
   exit 1 
else
   echo "USER HAS ROOT PRIVILEGES"
fi

#FUNCTION NAME WE GAVE AS VALIDATE
# we can provide arguments to function as we do it for script
#VALIDATE $? MYSQL  --> here 1st argument is exit status $1 = $?, 2nd argument is what we tried to install $2 =MYSL, PYTHON3 , NGINX

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "$2 INSTALLATION IS SUCCESS"
    else 
        echo "$2 INSTALLATION IS FAILURE"
        exit 1
        newline
    fi
}

newline(){
      echo ""
}

dnf list installed mysql
if [ $? -eq 0 ]
then
   echo "MYSQL PACKAGE ALREADY INSTALLED...NOTHING TO DO!"
else 
   echo "MYSQL is NOT INSTALLED, PROCEEDING TO INSTALLATION IN 5 SECONDS"
   sleep 5
   dnf install mysql -y
   VALIDATE $? "mysql"
   newline
fi

dnf list installed python3
if [ $? -eq 0 ]
then
   echo "PYTHON3 PACKAGE ALREADY INSTALLED...NOTHING TO DO!"
else 
   echo "PYTHON3 is NOT INSTALLED, PROCEEDING TO INSTALLATION IN 5 SECONDS"
   sleep 5
   dnf install python3 -y
   VALIDATE $? "python3"
   newline
fi

dnf list installed nginx
if [ $? -eq 0 ]
then
   echo "NGINX PACKAGE ALREADY INSTALLED...NOTHING TO DO!"
else 
   echo "NGINX is NOT INSTALLED, PROCEEDING TO INSTALLATION IN 5 SECONDS"
   sleep 5
   dnf install nginx -y
   VALIDATE $? "nginx"
   newline
fi