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
        echo "$2 already INSTALLED"
        exit 1
    else 
        echo "$2 is NOT INSTALLED, PROCEEDING TO INSTALLATION NOW"
    fi
}

dnf list installed mysql
if [ $? -eq 0 ]
then
   echo "MYSQL already INSTALLED"
   exit 1
else 
   echo "MYSQL is NOT INSTALLED, PROCEEDING TO INSTALLATION NOW"
   sleep 5
   dnf install mysql -y
   VALIDATE $? "MYSQL"
fi

dnf list installed python3
if [ $? -eq 0 ]
then
   echo "PYTHON3 already INSTALLED"
   exit 1
else 
   echo "PYTHON3 is NOT INSTALLED, PROCEEDING TO INSTALLATION NOW"
   sleep 5
   dnf install python3 -y
   VALIDATE $? "python3"
fi

dnf list installed nginx
if [ $? -eq 0 ]
then
   echo "NGINX already INSTALLED"
   exit 1
else 
   echo "NGINX is NOT INSTALLED, PROCEEDING TO INSTALLATION NOW"
   sleep 5
   dnf install nginx -y
   VALDIATE $? "nginx"
fi