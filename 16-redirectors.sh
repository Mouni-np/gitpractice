#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOG_FOLDER
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
userid=$(id -u)

check_root(){
    if [ $userid -ne 0 ]
    then 
        echo "$R run script with root priveleges $N" &>>$LOG_FOLDER
        exit 1
    fi

}
 validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed $N" &>>$LOG_FOLDER
    else
        echo -e "$2 is $G success $N" &>>$LOG_FOLDER
    fi
}

check_root 

for package in $@
do
    dnf list installed $package &>>$LOG_FOLDER
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install" &>>$LOG_FOLDER
        dnf install $package -y &>>$LOG_FOLDER
        validate $? "installing $package" &>>$LOG_FOLDER
    else
        echo "$Y $package is already intsalled $N " &>>$LOG_FOLDER
    fi
done