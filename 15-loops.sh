#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
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
        echo -e "$2 is $R failed $N"
    else
        echo -e "$2 is $G success $N"
    fi
}

check_root 

for package in $@
do
    echo $package
done