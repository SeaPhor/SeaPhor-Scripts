#!/bin/bash
#
###	You can source this file to add colors to your output text
#
###########################################
####    Declare Color Variables
###########################################
#
[[ $@ =~ "nocolor" ]] && NOCOLR=true || NOCOLR=false
#
if ! $NOCOLR; then
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
fi
#
