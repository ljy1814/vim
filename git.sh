#!/bin/bash
# Filename : git.sh
# Description : 显示git分支 
# Author : arch 
# Email : yajin160305@gmail.com
# Version
# Change : 
# Date : 2016-11-28 11:06:25
branch=`git branch 2> /dev/null| head -1 | cut -d ' ' -f 2`
if [ "${branch}" == "" ]; then
    echo "hello"
else
    if [ "${branch}" == "master" ]; then
        echo "match master"
        echo $branch
        PS1="\e[0;31m[\u@\h\e[m \e[0;34m\W\e[m\(\e[0;31m$branch\e[m\)\e[0;31m]$\e[m" 
    else
        echo $branch
        PS1="\e[0;31m[\u@\h\e[m \e[0;34m\W\e[m\(\e[0;32m$branch\e[m\)\e[0;31m]$\e[m" 
    fi
fi

echo -e "   \033[32;1mSuccess!!!\033[0m"            
echo -e "   \033[1;44mRunning!!!\033[0m"            
echo -e "   \033[1;31mError!!!\033[0m"            
echo -e "   \033[1;44mError Info:!!!\033[0m"            
echo [\u@\h \W]\$
#export PS1="\e[0;31m[\u@\h\e[m \e[0;34m\W\e[m\e[0;31m]$\e[m" 
