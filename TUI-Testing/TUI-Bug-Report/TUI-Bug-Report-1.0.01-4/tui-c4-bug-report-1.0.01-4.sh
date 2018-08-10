#!/bin/bash
#
###     To be a TUI version of the fully functional CLI version of
###     - 'c4-bug-report.sh' located at --
###     - https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/reports/Bug-Report
#
###################################################
###	Define Standard Variables		###
###################################################
#	Global Variables
        JVER="Bug-Report-1.0.01-4"
        PCHLVL="1.0.01-4"
        PCHDAT="19 November, 2017"
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
	HELP=false
        OUTFIL=~/$2
        INITRUN=false
	inpdialog=${inpdialog=dialog}
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
#
###################################################
###	Define Help and Options		###
###################################################
#
    OPTIONS="Options-Usage:
  $PROGNAME -[OPTION] <Filename>.csv
    $PROGNAME -[OPTION] <Filename>.csv -V
  -Examples:$PROGNAME -a testreport.csv
  -Options:
  [-h]	Help			Shows this list
  [-a]	Add Entry		Add a Bug report 
  [-m]	Mail Report		Add a Bug report and Email it
  [-o]	Just Mail		Just Email The Bug report
  [-r]	Read Report		To View the Report in less
  [-e]	Edit Report		Edit the Report with vi
  [-v]	Script Version		Bug-Report Script Version and Release Date
  [-d]	Description		Bug-Report Script Description
  [-l]	Show C4 Logo		Displays the C4 Logo with Version
  [-g]	GPL Info		GNU/GPL License Information
  [-V]	No Pauses		Stop all pauses, faster inputs"
	DESCRIPT=" This script was originally desined for my work as advocate with Codeweavers Crossover Linux, and then for use of my team as QA Director for Valiance Online with SilverHelm Studios.
 	It could easily be modified for use with any QA-type bug reporting by adjusting the Variable Values and Options Menu.
 	The out put is kept in a hidden directory in the user's Home directory because some projects are more confidential- [~/.Per/]
 	The output was also specifically designed in a format that could be simply imported to the running Master Bug Report SpreadSheet and all fields and columns would line up and match.
 	Please feel free to send me questions, suggestions, or any issues with the script at...
seaphor@woodbeeco.com"
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
###	REPLACE THIS SECTION WITH INPUT BOX
if [[ -a $REPDIR/$2 ]]; then
	BREPRT=$REPDIR/$2
else
	touch $REPDIR/$2
	BREPRT=$REPDIR/$2
###	END OF REPLACE THIS SECTION WITH INPUT BOX
###	Check this before Un-Commenting
	printf "\n $CHA#$CHB#$CHC#$CHD#$CHE#$CHF#$CHG#$CHH#$CHI" > $BREPRT 
fi
#
#
###################################################
###	Functions
###################################################
#
function bug_line
{
bugfil=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Report File" --radiolist "Choose the Method of recording the information:" 0 0 0 1 "Create New File" off  2 "Use Existing File" on`
case $bugfil in
  "1")
    bugfilame=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "New Bug Report File Name" --inputbox "Type FileName - [filename.csv]:" 0 0`
    ;;
  "2")
    lsdir="`ls -1 ~/.Per/ | grep .csv`"
    dialog --backtitle "C4 Bug Report Tool" --title "Existing Report/s" --infobox "$lsdir" 0 0 ; sleep 5
    bugfilame=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Existing Bug Report File Name" --inputbox "Type FileName from previous list - :" 0 0`
    ;;
esac
	dialog --backtitle "C4 Bug Report Tool" --title "IMPORTANT INFORMATION !!!" --infobox "Do *NOT* use a '#' symobol in any of the input... it is the CSV Deliminator" 0 0 ; sleep 4
bugrel=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "SVN or Live Release Rev" --inputbox "Type SVN or Live Release Rev:" 0 0`
bugsev=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Severity" --radiolist "Choose the Severity of the Bug:" 0 0 0 0 "0= Stop-Ship" off  1 "1= High- MUST be fixed in Next release" on 2 "2= Bad, but either a work-around or avoidance" off 3 "3= Needs to be fixed" off 4 "4= Enhancement Request" off`
#bugsev=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Severity" --inputbox "Type the Bug Severity [0-4]:" 0 0`
###     Bug Type
bugtype=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Category" --radiolist "Choose the TYPE of Bug:" 0 0 0 1 "Character Creator" off  2 "Map" on 3 "Powers" off 4 "Game Play" off 5 "UI & Menus" off 6 "Enhancement Request" off 7 "Script Request Bug or Issue" off`
case $bugtype in
  "1")
    typechk="Character Creator"
    ;;
  "2")
    typechk="Map"
    ;;
  "3")
    typechk="Powers Powersets"
    ;;
  "4")
    typechk="Game Play Movement Missions"
    ;;
  "5")
    typechk="UI & Menus"
    ;;
  "6")
    typechk="Enhancement Request"
    ;;
  "7")
    typechk="Script Request Bug or Issue"
    ;;
esac
#
###     Bug Short Desc
bugsdsc=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Short Description" --inputbox "Type the Short Description:" 0 0`
###     Bug Long Desc
bugldsc=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Long Description" --inputbox "Type the Long Description:" 0 0`
###     Bug STR
bugstr=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Steps To Reproduce" --inputbox "Provide The Steps To Reproduce (STR):" 0 0`
###     Bug Reported by
bugstr=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Reported By Who?" --inputbox "Provide Who Identified this Bug:" 0 0`
###     Bug Reported Date
bugdate=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Reprted Date" --calendar "Choose a date" 0 0`
###     Bug Type
bugstatus=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Status" --radiolist "Choose the Status of Bug:" 0 0 0 1 "Open" on  2 "Closed" off 3 "Fixed" off 4 "Retest" off`
case $bugstatus in
  "1")
    statchk="Open"
    ;;
  "2")
    statchk="Closed"
    ;;
  "3")
    statchk="Fixed"
    ;;
  "4")
    statchk="Retest"
    ;;
esac


#
	printf "$CAA#$CAB#$CAC#$CAD#$CAE#$CAF#$CAG#$CAH#$CAI" >> $BREPRT 
	unset -f {CAA,CAB,CAC,CAD,CAE,CAF,CAGA,CAH,CAI} 2>&1 > /dev/null
	bug_startbug
}
#
#
function bug_startbug
{
###     Request Input Bug
	dialog --backtitle "C4 Bug Report Tool" --title "Help - Options and Usage" --infobox "$OPTIONS" 0 0 ; sleep 6
bugrun=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Report Menu" --radiolist "Choose An Option:" 0 0 0 a "Add Entry" on  r "Read Bug Report" off m "Mail Bug Report" off e "Edit Bug Report [default editor is vi]" off q "Quit" off`
case $bugrun in
  "a")
    bug_line
    ;;
  "r")
    exit $?
    ;;
  "m")
    exit $?
    ;;
  "e")
    exit $?
    ;;
  "q")
    exit $?
    ;;
esac
}
#
###################################################
###	Main Logic				###
###################################################
#
###	WORKING
case "$1" in
"-h")
	dialog --backtitle "C4 Bug Report Tool" --title "Help - Options and Usage" --infobox "$OPTIONS" 0 0 ; sleep 4
	exit $?
        ;;
"-d")
	dialog --backtitle "C4 Bug Report Tool" --title "Description" --infobox "$DESCRIPT" 0 0 ; sleep 4
	exit $?
	;;
"-v")
	dialog --backtitle "C4 Bug Report Tool" --title "C4 Bug Report Script Release" --infobox "$JVER $PCHDAT" 0 0 ; sleep 4
	exit $?
	;;
esac
###	END OF WORKING
bug_startbug

case "$1" in
"-a")
  bug_startbug
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
"-e")
	vi $BREPRT
	exit $?
	;;
"-g")
	gpl_info
	exit $?
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
##@	Change-Logs
##@
##@	Patch-Level-0.0.01-1 (first Official Release)
##@		Have fully functional script as long as the propper Options are used.
##@
##@	Patch-Level-0.0.01-2
##@		Finalized, clean and working as original outline
##@
##@	Patch-Level-0.0.01-3 => 0.1.01-1
##@		All is working to satisfaction for basic report
##@		I am making this Beta-1
##@		For next patch I want an email option
##@		For next patch I want a custom directory option
##@
##@	Patch-Level-0.1.01-2
##@		Fixed Main Logic
##@		Fixed Options
##@		Cleaned up code
##@		Created Mail Options - NEEDS Testing!
##@		
##@	Patch-Level-0.1.02-1	PCHDAT="11 March, 2015"
##@		All Mail options tested and working
##@		Repeating options all fixed
##@		Few more tests, and I'll release for publit testing
##@		Once passes the Public, will rev to 1.0.00-1
##@		
##@	Patch-Level-0.1.02-2	PCHDAT="24 October, 2015"
##@		Adding entry for setting up the default emails
##@		Fixed the 'OPTIONS' output
##@		Added options to the bug info input for:
##@			Priority, ID-by, Status, and date
##@			and set some defaults
##@		Changed the csv deliminator from ',' to '#'
##@
##@	Patch-Level-1.0.00-1
##@            Script Forked and GPL licensed as version 1.0.00-1,
##@            October 24, 2015- For Silverhelm Studio
##@		
##@	Patch-Level-1.0.00-2  PCHDAT="19 June, 2016"
##@	  	Added '-l' Option to Show Logo and exit
##@		
##@	Patch-Level-1.0.00-3  PCHDAT="14 October, 2017"
##@	  	Added 's' Category Option for script bug
##@		fixed redundant check for sript path
##@		general cleanup
##@	Patch-Level-1.0.01-1  PCHDAT="19 November, 2017"
##@		Fixed annoying unset issue with 'not a valid identifier'
##@		Fixed logic for 'Default id'
##@		Added colors to request for input
##@		Added -V option to ignore sleeps/pauses
##@		Added -d option for Description
##@		Fixed -r option with check for $2 filename
##@	Patch-Level-1.0.01-2  "18 November, 2017"
##@		remove PCHDAT= from Changelog
##@		Beginning work to variale-ize all the fields
##@		for use in any QA team to be able to just edit the 
##@		variables and then will work for any project
##@		Fixed CAG variable set to c4 from testing
##@		Fixed static variable from testing
##@	Patch-Level-1.0.01-3  "18 November, 2017"
##@		Promoted due to static variable from testing
##@		Now... Beginning work to variale-ize all the fields
##@		for use in any QA team to be able to just edit the 
##@		variables and then will work for any project
##@		also- Goal to change all echo statements to printf- all but mail, I think
##@		Removed the cp to the user's bin dir and echo'd the github repo
##@		with a sym-link in the user's bin dir
##@		Changed all [single brackets] to [[double brackets]] according to standards
##@		Added the word 'another' to the bug_more function user input request
##@		Found and fixed a bug caused by changing all the 'echo -e's to printf,
##@		-tests to find others found and fixed all I tested
##@		Fixed typo in Description
##@		Added newlines to all requests for input that cause the input to be on same 
##@		-line as the request
##@	Patch-Level-1.0.01-4  "19 November, 2017"
##@		
##@		
##@		
##@		
#
###################################################
###	Define Help and Options		###
###################################################
#
###################################################################################
#####			GNU/GPL Info						###
###################################################################################
function gpl_info
{
  printf "
####c4#############################################################################
###										###
##			GNU/GPL Info 						###
##		Begins as C4-Bug-Report ver. 0.0.01  A-1			###
##		See the release notes at the bottom for current progress	###
##	Released under GPL v2.0, See www.gnu.org for full license info		###
##	Copyright (C) 2014  Shawn Miller					###
##	Copyright (C) 2014  The Wood-Bee Company				###
##		EMAIL- shawn@woodbeeco.com					###
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
##		October 24, 2015- For Silverhelm Studios			###
##										###
####w#################################b######################################c#####"
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
echo -e "###*     @#####| $JVER |#####|    *###########" #RQH-11
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
#
