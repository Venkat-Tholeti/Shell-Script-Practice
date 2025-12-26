#!/bin/bash

#find <source_directory> -name "*.log" -mtime +14
#FOR BACK DATED FILES TO BE CREATED
#touch -d 20240101 venkat.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript.logs"
SOURCE_DIRECTORY=/home/ec2-user/app-logs
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"


mkdir -p $LOGS_FOLDER
echo -e "$G script started executing at $(date)" &>>$LOG_FILE
echo -e "$Y Logs stored at  $LOG_FILE"


USERID=$(id -u)

ROOTACCESS_CHECK(){
if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR: USER NEED TO SWITCH TO ROOT ACCESS $N" | tee -a $LOG_FILE
   exit 1 
else
   echo -e "$G USER HAS ROOT PRIVILEGES $N" | tee -a $LOG_FILE
fi
}

#FUNCTION NAME WE GAVE AS VALIDATE & NEWLINE (name our choice)
# we can provide arguments to function as we do it for script
#VALIDATE $? MYSQL  --> here 1st argument is exit status $1 = $?, 2nd argument is what we tried to install $2 =MYSL, PYTHON3 , NGINX


VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 IS SUCCESS $N" | tee -a $LOG_FILE
    else 
        echo -e "$R $2 IS FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

FILES_TO_DELETE=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14) 

while IFS= read -r filepath
do 
   echo "Deleting file: $filepath" | tee -a $LOG_FILE
   rm -rf $filepath

done <<< $FILES_TO_DELETE
