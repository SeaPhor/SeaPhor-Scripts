#!/bin/bash
#
PROGNAME=$(basename $0)
#
##    randgetcode
##    Author: Shawn Miller
##    Date: 06 January 2019
#
###########################################
####    Color Variables
###########################################
#
RED="$(tput setaf 1)"
GRN="$(tput setaf 2)"
YLLW="$(tput setaf 3)"
BLU="$(tput setaf 4)"
MAG="$(tput setaf 5)"
CYN="$(tput setaf 6)"
LTRED="$(tput setaf 9)"
LTGRN="$(tput setaf 10)"
LTYLLW="$(tput setaf 11)"
LTBLU="$(tput setaf 12)"
LTMAG="$(tput setaf 13)"
LTCYN="$(tput setaf 14)"
BGBLU="$(tput setab 4)"
BGYLLW="$(tput setab 3)"
BGLYLLW="$(tput setab 11)"
ULINE="$(tput smul)"
NULINE="$(tput rmul)"
SOMODE="$(tput smso)"
NSOMODE="$(tput rmso)"
BOLD="$(tput bold)"
RESET="$(tput sgr0)"
#
###############################
####    Usage - Options    ####
###############################
#
usage () {
    cat <<EOT
${BOLD}${YLLW}
Description-${RESET}${YLLW}
    Generate a new file for your message to pass, max is 255 char, 
  and a message limit of 38 chars, you can change that in the '${LTCYN}declare -i target=255${YLLW}'${GRN}
# openssl rand -base64 255 | tr -d '\n' > ~/newmessage.txt${YLLW}
    Edit the file putting the first letter at a static of x and y characters...
  Example- every 5th and 9th- at '5', next at '14' (5+9), and every 5th and ninth character after that- i.e.
# Postions-${LTCYN}  5 14 19 28 33 42 47 56 61 70 75 84 89 98 103 112 117 126 131 140 145 154 159 168 173 182 187 196 201 210 215 224 229 238 243 252 257 266${YLLW}
    Leave the last 3 characters of the message for a End Of Code signal, and a '${LTCYN}:${YLLW}'
    Using the Example from above- At position${LTCYN} 75=E, 84=O, 89=C,,,${YLLW} 
  and the next char at 90 will be a '${LTCYN}:${YLLW}' (field separator)
    ${BOLD}
Usage-${RESET}${YLLW}
    Run the command with scriptname filename Position-1-int Position-2-int${BOLD}
  Example-${RESET}${GRN} ./${PROGNAME} filename 5 9
${RESET}
EOT
}
#
[[ $@ =~ "help" ]] && { usage; exit 0; }
[[ $# == "3" ]] || { usage; echo -e "${BOLD}${RED}Requires 3 parameters- filename Postion Position\n${RESET}"; exit 1; }
[[ $2 -ge $3 ]] && { usage; echo -e "${BOLD}${RED}2nd argument '$2' can not be greater than or equal the 3rd '$3'\n${RESET}"; exit 1; }
declare -i target=255
file=$1
newtarget="$(cat $file | awk -F':' '{print $1}' | wc -c)"
declare -i target="${newtarget}"
count=0
until [[ $count -gt $target ]]; do
    declare -i pfirst=$2
    declare -i psecnd=$3
    count="$(expr $count + $pfirst)"
    echo $count >> tmp.txt
    count="$(expr $count + $psecnd)"
    echo $count >> tmp.txt
done
prntlin="$(for i in `cat tmp.txt`; do expr substr `cat $file | awk -F':' '{print $1}'` $i 1; done)"
####    Default
echo -e $prntlin | tr -d '\n' | tr -d ' '
####    Optional (uncomment, and comment above)
#echo -e $prntlin | tr -d '\n' | tr -d ' ' | sed 's/EOC//g'
echo ""
rm -f tmp.txt
exit 0
