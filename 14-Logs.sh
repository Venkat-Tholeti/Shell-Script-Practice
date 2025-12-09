#!/bin/bash

# Goal is to install mysql, nginx and python 3 using functions using less code.
# Goal is to set colors for the success and failure and other conditiond.

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript.logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo -e "$G script started executing at $(date)" &>>$LOG_FILE
echo -e "$Y Logs stored at  $LOG_FILE"


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR: USER NEED TO SWITCH TO ROOT ACCESS $N" | tee -a $LOG_FILE
   exit 1 
else
   echo -e "$G USER HAS ROOT PRIVILEGES $N" | tee -a $LOG_FILE
fi

#FUNCTION NAME WE GAVE AS VALIDATE & NEWLINE (name our choice)
# we can provide arguments to function as we do it for script
#VALIDATE $? MYSQL  --> here 1st argument is exit status $1 = $?, 2nd argument is what we tried to install $2 =MYSL, PYTHON3 , NGINX

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 INSTALLATION IS SUCCESS $N" | tee -a $LOG_FILE
    else 
        echo -e "$R $2 INSTALLATION IS FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

#For gap between tasks we can use this below function or simply we can add echo or echo "" after end of task 
NEWLINE(){
      echo ""
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -eq 0 ]
then
   echo -e "$G MYSQL PACKAGE ALREADY INSTALLED...NOTHING TO DO! $N" | tee -a $LOG_FILE
else 
   echo -e "$Y MYSQL is NOT INSTALLED, PROCEEDING TO INSTALLATION IN 5 SECONDS $N" | tee -a $LOG_FILE
   sleep 5
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "mysql"
fi
NEWLINE
dnf list installed python3 &>>$LOG_FILE
if [ $? -eq 0 ]
then
   echo -e "$G PYTHON3 PACKAGE ALREADY INSTALLED...NOTHING TO DO! $N" | tee -a $LOG_FILE
else 
   echo -e "$Y PYTHON3 is NOT INSTALLED, PROCEEDING TO INSTALLATION IN 5 SECONDS $N" | tee -a $LOG_FILE
   sleep 5
   dnf install python3 -y &>>$LOG_FILE
   VALIDATE $? "python3"
fi
NEWLINE
dnf list installed nginx &>>$LOG_FILE
if [ $? -eq 0 ]
then
   echo -e "$G NGINX PACKAGE ALREADY INSTALLED...NOTHING TO DO! $N" | tee -a $LOG_FILE
else 
   echo -e "$Y NGINX is NOT INSTALLED, PROCEEDING TO INSTALLATION IN 5 SECONDS $N" | tee -a $LOG_FILE
   sleep 5
   dnf install nginx -y &>>$LOG_FILE
   VALIDATE $? "nginx"
fi
