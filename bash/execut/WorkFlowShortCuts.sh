#!/bin/bash

classDir="/Users/ephraimsutherland/documents/college_classes/Senior/Spring"
class () {
        cd $classDir/$1/$2/$3
}

strack () { if [ "$1" == "local" ]
	then
		cd /Users/ephraimsutherland/documents/Research/basic-program
	elif [ "$1" == "dropbox" ]
	then
		cd /Users/ephraimsutherland/Dropbox/Basic-Profile/basic-program-share$2
	else
		echo "typo?"
	fi;
}

execute () {
	cd ~/execut 
}

D2B=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})

#Decimal to binary. Run by calling echo ${D2B[15]}.

#function countdown(){
#   date1=$((`date +%s` + $1)); 
#   while [ "$date1" -ge `date +%s` ]; do 
#     echo -ne "$(date -u --date @$(($date1 `date +%s`)) +%H:%M:%S)\r";
#     sleep 1
#   done
#}
#function stopwatch(){
#  date1=`date +%s`; 
#   while true; do 
#    echo -ne "$(date -u --date @$((`date +%s` $date1)) +%H:%M:%S)\r"; 
#    sleep 1
#   done
#}

timer () {
	echo "start " `date` 
	sleep $1 
	echo "end " `date`
}




Take () {
	mkdir $1 && cd $_
}

p () {
    local open
    open=open   # on OSX, "open" opens a pdf in preview
    ag -U -g ".pdf$" \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
        --preview-window down:80% --preview '
            v=$(echo {q} | gtr " " "|"); 
            echo -e {1}"\n"{2} | ggrep -E "^|$v" -i --color=always;
        ' \
    | gcut -z -f 1 -d $'\t' | gtr -d '\n' | gxargs -r --null $open > /dev/null 2> /dev/null
}


