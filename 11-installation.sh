#!/bin/bash

userid=$(id -u)
#echo "user id is $userid"

if [ $userid -ne 0 ]
then 
    echo "run script with root priveleges"
    exit 1
fi

dnf list installed git 

if [ $? -ne 0 ]
then 
    echo "git is not installed, going to install"
    dnf install git -y
else
    echo "already installed"