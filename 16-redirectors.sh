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
        echo -e "$R run script with root priveleges $N" &>>$LOG_FILE
        exit 1
    fi

}
 validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed $N" &>>$LOG_FILE
    else
        echo -e "$2 is $G success $N" &>>$LOG_FILE
    fi
}

usage(){
    echo -e " $R usage: sudo sh 16-redirectors.sh package1 package2...$N "
    exit 1
}

check_root 

if [ $# -eq 0 ]
then 
    usage
fi

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install" &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        validate $? "installing $package" &>>$LOG_FILE
    else
        echo -e "$Y $package is already intsalled $N " &>>$LOG_FILE
    fi
done