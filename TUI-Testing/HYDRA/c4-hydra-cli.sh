#!/bin/bash
#
###################################################################################
#####			GNU/GPL Info						###
###################################################################################
function gpl_info
{
  echo -e "\n$(tput setaf 14)
####c4#############################################################################
###										###
##			GNU/GPL Info 						###
##		Begins as C4-HYDRA ver. 0.0.00-01  A-1				###
##		Forked from C4-Bug-Report ver. 					###
##		See the release notes at the bottom for current progress	###
##	Released under GPL v2.0, See www.gnu.org for full license info		###
##			Original Info 						###
##	Copyright (C) 2014  Shawn Miller					###
##	Copyright (C) 2014  The Wood-Bee Company				###
##			New Info 						###
##	Copyright (C) 2018  Shawn Miller					###
##	Copyright (C) 2018  The Wood-Bee Company				###
##		EMAIL- sseaphor@woodbeeco.com					###
##  This program is free software; you can redistribute it and/or modify	###
##    it under the terms of the GNU General Public License as published by	###
##    the Free Software Foundation; either version 2 of the License, or		###
##    (at your option) any later version.					###
##										###
##    This program is distributed in the hope that it will be useful,		###
##    but WITHOUT ANY WARRANTY; without even the implied warranty of		###
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the		###
##    GNU General Public License for more details.				###
##										###
##	Script Originally GPL licensed as version 0.0-1, February, 2013		###
##		Script Forked and GPL licensed as version 1.0.00-1,		###
##		October 24dd, 2015- For Silverhelm Studios			###
##		Script Forked  again and GPL licensed as version 0.0.00-01,	###
##		January 26, 2018- For C4-Hydra					###
##										###
####w#################################b######################################c#####
$(tput sgr 0)\n"
}
#
###################################################
###	Define Standard Variables		###
###################################################
#	Global Variables
        JVER="C4-HYDRA-0.0.00-01"
        PCHLVL="0.0.00-01"
        PCHDAT="26 January, 2018"
	PROGNAME=$(basename $0)
	CUSTOM=false
	USAGE="\n\n$(tput setaf 3) $PROGNAME -[OPTION] <filename>.csv$(tput sgr 0) \n"
	TDATE=`date +%a\ %b\ %d\ %Y`
	JDATE=`date +%y%m%d-%H.%M.%S`
	WDATE="`date +%U\ %Y`"
#	Script Variables
	JSLOC=~/bin/$PROGNAME
	RPDEF=false
	RPCUST=false
	RMAIL=false
	JMAIL=false
case $3 in
	"-V")
		NOSLEEP=true
	;;
	*)
		NOSLEEP=false
	;;
esac
#
###################################################
###	Define Help and Options		###
###################################################
#
	HELP=false
    OPTIONS="\n$(tput setaf 3)Options-Usage:$(tput sgr 0)
  $(tput setaf 6) $PROGNAME -[OPTION] <Filename>.csv$(tput sgr 0)
    $(tput setaf 6) Or$(tput sgr 0)
  $(tput setaf 6) $PROGNAME -[OPTION] <Filename>.csv -V$(tput sgr 0)
  \n$(tput setaf 3)-Examples:\n\t$PROGNAME -a testreport.csv$(tput sgr 0)
  \n$(tput setaf 14)-Options:
  [-h]\tHelp\t\tShows this list
  [-a]\tAdd Entry\tAdd a Bug report 
  [-m]\tMail Report\tAdd a Bug report and Email it
  [-o]\tJust Mail\tJust Email The Bug report
  [-r]\tRead Report\tTo View the Report in less
  [-e]\tEdit Report\tEdit the Report with vi
  [-v]\tScript Version\tBug-Report Script Version and Release Date
  [-d]\tDescription\tBug-Report Script Description
  [-z]\tShow ChangeLog\tBug-Report Script Change Log
  [-l]\tShow C4 Logo\tDisplays the C4 Logo with Version
  [-g]\tGPL Info\tGNU/GPL License Information
  [-V]\tNo Pauses\tStop all pauses, faster inputs$(tput sgr 0)
\n"
	DESCRIPT="\n\t$(tput setaf 14)This script was originally desined for my work as advocate with Codeweavers Crossover Linux, and then for use of my team as QA Director for Valiance Online with SilverHelm Studios.\nIt could easily be modified for use with any QA-type bug reporting by adjusting the Variable Values and Options Menu.\nThe out put is kept in a hidden directory in the user's Home directory because some projects are more confidential- [~/.Per/]\nThe output was also specifically designed in a format that could be simply imported to the running Master Bug Report SpreadSheet and all fields and columns would line up and match.\n\tPlease feel free to send me questions, suggestions, or any issues with the script at...$(tput sgr 0)\n\t$(tput setaf 5)seaphor@woodbeeco.com$(tput sgr 0)\n"
#
###################################################
###     Check for correct command structure
###	Set Report Variables
###################################################
#	Report Variables
	CHA="Release Vs."
	CHB="Priority"
	CHC="Category/Type"
	CHD="Short Description"
	CHE="Details- Long Description"
	CHF="STR & Additional Notes"
	CHG="Identified By"
	CHH="Date"
	CHI="Status"

#
###################################################
###	PATH Directory
###################################################
#
if [[ ! -d ~/.Per ]]; then
	mkdir ~/.Per 2> /dev/null
	REPDIR=~/.Per
else
	REPDIR=~/.Per
fi
#
if [[ -a $REPDIR/$2 ]]; then
	BREPRT=$REPDIR/$2
else
	touch $REPDIR/$2
	BREPRT=$REPDIR/$2
	printf "\n $CHA#$CHB#$CHC#$CHD#$CHE#$CHF#$CHG#$CHH#$CHI" > $BREPRT 
fi
#
###################################################
###	Functions
###################################################
#
function bug_more
{
  printf "\n\t$(tput setaf 3) Do you want to enter another bug report? ....\n [y/N]$(tput sgr 0)\n"
	read MRBUGZ
	if [[ "`echo $MRBUGZ`" == "y" ]]; then
		bug_line
	fi
}
#
function bug_line
{
	printf "\n\n\t$(tput setaf 3) Do *NOT* use a '#' symobol in any of the input... it is the CSV Deliminator$(tput sgr 0)"
sleep 2
	printf "\n\t$(tput setaf 14)Type the Release Version...$(tput sgr 0)\n"
	read CAA
	printf "\n\t$(tput setaf 14)Type the Priority...\n[1-5]$(tput sgr 0)\n"
	read CAB
	printf "\n\t$(tput setaf 14)Category Type...$(tput sgr 0)\n$(tput setaf 4)[c]\tCharacter Creator$(tput sgr 0)\n$(tput setaf 5)[e]\tEnhancement Request$(tput sgr 0)\n$(tput setaf 6)[g]\tGame Play, Movement, Missions$(tput sgr 0)\n[m]\t$(tput setaf 10)Map$(tput sgr 0)\n$(tput setaf 11)[p]\tPowers & Powersets$(tput sgr 0)\n$(tput setaf 12)[u]\tUI & Menus$(tput sgr 0)\n$(tput setaf 1)[s]\tBug, issue, or enhancement request with this script$(tput sgr 0)\n"
	read CAC
	case "$CAC" in
	"c")
		CAC="Character Creator"
		;;
	"e")
		CAC="Enhancement Request"
		;;
	"g")
		CAC="Game Play Movement Missions"
		;;
	"m")
		CAC="Map"
		;;
	"p")
		CAC="Powers Powersets"
		;;
	"u")
		CAC="UI & Menus"
		;;
	"s")
		CAC="Script Request Bug or Issue"
		;;
	*)
		CAC="FAILED Input!"
		;;
	esac
#
	printf "\n\t$(tput setaf 14)Type the Short Description...$(tput sgr 0)\n"
	read CAD
	printf "\n\t$(tput setaf 14)Type the Details- Long Description...$(tput sgr 0)\n"
	read CAE
	printf "\n\t$(tput setaf 14)Type the STR & Additional Notes...$(tput sgr 0)\n"
	read CAF
	CAG=false
	printf "\n\t$(tput setaf 14)Type the Identified By...\n[Leave Blank for $CAG]$(tput sgr 0)\n"
	read CAGA
	if [[ "`echo $CAGA`" != "" ]]; then
		CAG=$CAGA
		printf "\n\t$(tput setaf 14)Do you want to set $CAGA as the default ID?...\n[y/n]$(tput sgr 0)\n"
		read DEFID
	fi
	printf "\n\t$(tput setaf 14)Type the Date, or leave empty for auto...\n[$JDATE]$(tput sgr 0)\n"
	read CAH
	if [[ "`echo $CAH`" == "" ]]; then
		CAH="$JDATE"
	fi
	printf "\n\t$(tput setaf 14)Type the Status...\n[o]\tOpen (Default)\n[c]\tClosed\n[f]\tFixed\n[r]\tRetest\n[Open]$(tput sgr 0)\n"
	read CAI
	case $CAI in
	"o")
		CAI="Open"
		;;
	"c")
		CAI="Closed"
		;;
	"f")
		CAI="Fixed"
		;;
	"r")
		CAI="Retest"
		;;
	*)
		CAI="Open"
		;;
	esac
#
	printf "$CAA#$CAB#$CAC#$CAD#$CAE#$CAF#$CAG#$CAH#$CAI" >> $BREPRT 
	unset -f {CAA,CAB,CAC,CAD,CAE,CAF,CAGA,CAH,CAI} 2>&1 > /dev/null
	if [[ "$DEFID" == "y" ]]; then
		sed -i s/CAG\=false/CAG\=$CAG/g $PROGNAME
	else
		unset -f CAG
	fi
	bug_more
}
function display_logo
{
echo -e "$(tput setaf 14)############################################################" #RQH-01
echo -e "#.C4.##################################################.C4.#" #RQH-02
echo -e "##########******************************####################" #RQH-03
echo -e "########*                                *##################" #RQH-04
echo -e "######*       @######################|   *##################" #RQH-05
echo -e "#####*     @#########################|    *#################" #RQH-06
echo -e "####*     @##########################|_____    *############" #RQH-07
echo -e "###*     @#####|                     |#####|    *###########" #RQH-08
echo -e "###*     @#####|                     |#####|    *###########" #RQH-09
echo -e "###*     @#####|      OFFICIAL       |#####|    *###########" #RQH-10
echo -e "###*     @#####| $JVER  |#####|    *###########" #RQH-11
echo -e "###*     @#####|      RELEASE        |#####|    *###########" #RQH-12
echo -e "###*     @#####|                     |#####|    *###########" #RQH-13
echo -e "###*     @#####|_____________________|#####|_______    *####" #RQH-14
echo -e "###*      @########################################|   *####" #RQH-15
echo -e "####*      @#######################################|   *####" #RQH-16
echo -e "#####*       @#####################################|   *####" #RQH-17
echo -e "######*                              |#####|           *####" #RQH-18
echo -e "################################*    |#####|    *###########" #RQH-19
echo -e "################################*    |#####|    *###########" #RQH-20
echo -e "#############     ####  ###  ###*    |#####|    *###########" #RQH-21
echo -e "############  #########  #  ####*    |#####|    *###########" #RQH-24
echo -e "#############     ####  ###  ###*---------------*###########" #RQH-25
echo -e "#.C4.##################################################.C4.#$(tput sgr 0)" #RQH-26
}
#
###################################################
###	Main Logic				###
###################################################
#
case "$1" in
"-h")
        HELP=true
        if $HELP; then
                printf "$OPTIONS"
                exit $?
        fi
        ;;
"-r")
	if [[ "`echo $2`" == "" ]]; then
		printf "\n$(tput setaf 1)The -r Option requires You must provide the filename$(tput sgr 0)\n\t$(tput setaf 3)$PROGNAME -r testreport.csv$(tput sgr 0)\n"
		exit $?
	else
		cat $BREPRT | sed 's/#/\t/g' | less
		exit $?
	fi
	;;
"-z")
	if [[ ! -a ~/bin/$PROGNAME ]]; then
		printf "$(tput setaf 1)This option is only available if the script is in and run from the ~/bin/$PROGNAME$(tput sgr 0)\n"
		exit $?
	else
		grep '##@' $JSLOC | grep -v JSLOC
		exit $?
	fi
	;;
"-v")
	JREL=true
	if $JREL; then
		echo $JVER
		echo $PCHDAT
		exit $?
	fi
	;;
"-e")
	vi $BREPRT
	exit $?
	;;
"-g")
	gpl_info
	exit $?
	;;
"-a")
	bug_line
	;;
"-m")
	RMAIL=true
	bug_line
	;;
"-o")
	RMAIL=true
	;;
"-l")
    display_logo
    exit $?
    ;;
"-d")
    clear
    printf "$DESCRIPT"
    exit $?
    ;;
*)
	printf "$OPTIONS"
	exit $?
	;;
esac
##
###
###################################################
###	Email Options- Starting Mail		###
###################################################
#
	DOEDITA=false
if $RMAIL; then
	echo -e "\n\t Do you want Default to/from or Custom? \n [d/c]"
	read TOFROM
	if [[ "$TOFROM" == "c" ]]; then
		echo -e "\n\tType the FROM email address..."
		read FROMA
		echo -e "\n\tType the TO email address..."
                read EMAIL
	fi
	if [[ "$TOFROM" == "d" ]]; then
		FROMA=false
		EMAIL=false
		if [[ "`echo $FROMA`" == "false" ]]; then
			echo -e "\n\tYour 'Default' emails have not been set, \n\tafter this instance has exited either manually edit the script Mail settings\n\tor edit the following command with your info (remove all '<>' and edit its contents)-\n\nexport FROMA=<yourdefault_FROM_emsiladdress>\nexport EMAIL=<yourdefault_TO_emsiladdress>\nsed -i s/FROMA=<false>/FROMA=$FROMA/g $PROGNAME\nsed -i s/EMAIL=<false>/EMAIL=$EMAIL/g $PROGNAME \n"
			sleep 2
			echo -e "\n\n\t Do you want this script to add the entries for you when its finished?\n [y/n]"
			read DOEDIT
			if [[ "$DOEDIT" == "y" ]]; then
				DOEDITA=true
			fi
			if ! $NOSLEEP; then
				sleep 3
			fi
			echo -e "\n\tType the FROM email address..."
			read FROMA
			echo -e "\n\tType the TO email address..."
                	read EMAIL
		fi
	fi
	echo -e "\n\tType the SUBJECT For the email..."
	read SUBJECT
	echo -e "\n\tDo you want to type the body of the email? [a]\n\tOr, Do you already have a file that you want to cat for the body of the email? [b]\n\nEnter your choice [a/b]... "
	read BDYCHSE
	if [[ "$BDYCHSE" == "b" ]]; then
		echo -e "\n\tType the exact absolute path to the file to be used for the body of the email..."
		read CATFILE
		EMAILMESSAGEZ=$REPDIR/mailmsg
		cat $CATFILE > $EMAILMESSAGEZ
	fi
	if [[ "$BDYCHSE" == "a" ]]; then
		echo -e "\n\tBegin Typing the body now, a RETURN will end the input of the text-body..."
		read CATFILE
		EMAILMESSAGEZ=$REPDIR/mailmsg
		echo "$CATFILE" > $EMAILMESSAGEZ
	fi
#
##################################################################################
#####   Establish Mail and Execute
##################################################################################
#
	echo -e "\n\tAttaching the Report as a separate attachment... "
	ATTCHD=$BREPRT
	sudo /usr/bin/mailx -a $ATTCHD -s "$SUBJECT" "$EMAIL"  -f $FROMA < $EMAILMESSAGEZ 2>&1 > $REPDIR/mailtest.log
fi
#
###################################################
##      Ending All				###
###################################################
###
#
if $DOEDITA; then
	sed -i s/FROMA\=false/FROMA\=$FROMA/g $PROGNAME ; sed -i s/EMAIL\=false/EMAIL\=$EMAIL/g $PROGNAME
fi
##@
##@################################################
##@	END OF Mail				###
##@################################################
##@
#
if [[ ! -L ~/bin/$PROGNAME ]]; then
	printf "\n\t$(tput setaf 3)It is recommended that you clone the github repo so that you can have the Latest up-to-date stable release, and then put a sym-link in ~/bin/ pointing to ~/MyScripts/reports/Bug-Report/Latest_Stable/$PROGNAME...$(tput sgr 0)\n"
fi
if ! $NOSLEEP; then
	sleep 2
fi
#
printf "\n\n\n\t$(tput setaf 6)When you open the $2 with your spreadsheet application\n\tuse only the Pound (#) as the deliminator, and as long as you didn't\n\tuse the Pound symbol in any of your inputs it will be fomatted correctly \n\tfor the official Bug-Report.$(tput sgr 0)"
printf "\n\t$(tput setaf 4)I hope you find this script useful, and if you have any feedback, issues, or requests, please send them to my email in the GPL [$PROGNAME -g]...\nThanks,$(tput sgr 0)"
printf "\n\t$(tput setaf 5)C4$(tput sgr 0)\n\n"
#
if ! $NOSLEEP; then
	sleep 12
fi
display_logo
#
exit $?
#
##@
##@################################################
##@	END OF JOURNAL SCRIPT			###
##@################################################
##@
##@	General Information
##@
##@	Patch-Level-0.0.00-01 (first Official Release, 26 January 2018)
##@		Have fully functional (bugreport) script as long as the propper Options are used.
##@	Forked from C4-Bug-Report Patch-Level-1.0.01-4 on 26 January 2018
##@		to view the changelogs & progress of this script prior to forking, or current status of 
##@		original source, please visit:
##@		https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/reports/Bug-Report
##@		
##@	Goals & Milestones
##@		Replace all 'Bug Report' headers and topics to HYDRA, move date to first column
##@		Replace all instances of obfuscated 'echo' with standardized 'printf'
##@		Incorporate ncurses for a TUI end-user experience
##@		
##@################################################
##@	Change-Logs				###
##@################################################
##@		
##@	Patch-Level-0.0.00-01  "26 January, 2018"
##@		Added updated GPL Info
##@		
##@
