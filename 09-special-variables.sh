#!/bin/bash
echo "all variables pass to the script: $@"
echo " no.of variables passed: $#"
echo "Script name: $0"
echo "current wd $PWD"
echo "home dir of current user $HOME"
echo "PID of script: $$"
sleep 100 &
echo "PID of lat bg command : $!"