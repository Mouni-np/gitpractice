#!/bin/bash

userid=$(id -u)

check_root(){
    if [ $userid -ne 0 ]
then 
    echo "run script with root priveleges"
    exit 1
fi

}
 validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed"
    else
        echo "$2 is success"
    fi
}

check_root 

dnf list installed git

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