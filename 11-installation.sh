#!/bin/bash

userid=$(id -u)
echo "user id is $userid"

if [ $userid -ne 0 ]
then 
    echo "run script with root priveleges"
    exit 1
fi

dnf install git -y