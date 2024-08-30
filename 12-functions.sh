#!/bin/bash

userid=$(id -u)

 validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed"
    else
        echo "$2 is success"
    fi
}

if [ $userid -ne 0 ]
then 
    echo "run script with root priveleges"
    exit 1
fi

dnf list installed git

validate $? "listing git"

if [ $? -ne 0 ]
then 
    echo "git is not installed, going to install"
    dnf install git -y
    validate $? "installing git"
else
    echo "already installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed, going to install"
    dnf install mysql -y
    validate $? "installing mysql"
else
    echo "already installed"
fi