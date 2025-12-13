#!/bin/bash

#VARIABLES
SOURCE_DIRECTORY="/data"
BACKUP_DIRECTORY="/backup"
DAYS=14
LOGFILE="/var/log/backup_cleanup.log"


#cp --parents --> ORIGINAL DIRECTORY STRUCTURE WILL BE MAINTAINED IN BACKUP ALSO
#EXAMPLE /data/logs/app.log ----> /backup/data/logs/app.log

USERID=$(id -u)

ROOTACCESS_CHECK(){
if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR: USER NEED TO SWITCH TO ROOT ACCESS $N" | tee -a $LOGFILE
   exit 1 
else
   echo -e "$G USER HAS ROOT PRIVILEGES $N" | tee -a $LOGFILE
fi
}

echo "-------SCRIPT STARTED: $(date)----------"

#STEP1 --> FIND AND BACKUP FILES

find $SOURCE_DIRECTORY -type f -mtime +$DAYS -exec cp --parents {} $BACKUP_DIRECTORY \; &>>$LOGFILE

if [ $? -eq 0 ]
then 
   echo -e "$G BACKUP SUCCESS $N"
else 
    echo -e "$R BACKUP FAILED $N"

#STEP2 --> VERIFY THE BACKUP AND DELETE FILES IN ORIGINAL FOLDER

find $SOURCE_DIRECTORY -type f -mtime +$DAYS -exec rm -rf {} \; &>>$LOGFILE

if [ $? -eq 0 ]
then 
   echo -e "$G DELETION SUCCESS $N"
else 
    echo -e "$R DELETION FAILED $N"

echo "------------SCRIPT ENDED: $(date)-----------" 
