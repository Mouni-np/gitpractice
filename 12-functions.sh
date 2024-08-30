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

# if [ $? -ne 0 ]
# then 
#     echo "git is not installed, going to install"
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then 
#         echo "git installation is not success...check it.."
#         exit 1
#     else
#         echo "git installation is success"
#     fi
# else
#     echo "already installed"
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then 
#     echo "mysql is not installed, going to install"
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then 
#         echo "mysql installation is not success...check it.."
#         exit 1
#     else
#         echo "mysql installation is success"
#     fi
# else
#     echo "already installed"
# fi