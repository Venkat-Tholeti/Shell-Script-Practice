#!/bin/bash

#VARIABLES
SOURCE_DIRECTORY="/data"
BACKUP_DIRECTORY="/backup"
DAYS=14
LOGFILE="/var/log/backup_cleanup.log"

echo "-------SCRIPT STARTED: $(date)----------" &>>$LOGFILE

#STEP1 --> FIND AND BACKUP FILES

find $SOURCE_DIRECTORY -type f -mtime +$DAYS -exec cp --parents {} $BACKUP_DIRECTORY \; &>>$LOGFILE

#STEP2 --> VERIFY THE BACKUP AND DELETE FILES IN ORIGINAL FOLDER

#find $SOURCE_DIRECTORY -type f -mtime +$DAYS -exec rm -rf {} \; &>>$LOGFILE

echo "------------SCRIPT ENDED: $(date)-----------" &>>$LOGFILE


#cp --parents --> ORIGINAL DIRECTORY STRUCTURE WILL BE MAINTAINED IN BACKUP ALSO
#EXAMPLE /data/logs/app.log ----> /backup/data/logs/app.log


