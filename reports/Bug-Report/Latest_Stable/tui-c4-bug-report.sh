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
        JVER="Bug-Report-1.0.01-5"
        PCHLVL="1.0.01-5"
        PCHDAT="28 January, 2018"
	PROGNAME=$(basename $0)
	USAGE="\n\n$(tput setaf 3) $PROGNAME -[OPTION] <filename>.csv$(tput sgr 0) \n"
	TDATE=`date +%a\ %b\ %d\ %Y`
	JDATE=`date +%y%m%d-%H.%M.%S`
	WDATE="`date +%U\ %Y`"
#	Script Variables
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
###################################################
###	Functions
###################################################
#
function cancel_exit
{
if [[ $? == "1" ]]; then
  unset -f {bugrel,bugsev,typechk,bugsdsc,bugldsc,bugstr,bugwho,bugdate,statchk,bugfilname} 2>&1 > /dev/null
  clear
  exit $?
fi
}
function bug_line
{
bugfil=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Report File" --radiolist "Choose the Method of recording the information:" 0 0 0 1 "Create New File" off  2 "Use Existing File" on`
cancel_exit
case $bugfil in
  "1")
    bugfilame=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "New Bug Report File Name" --inputbox "Type FileName - [filename.csv]:" 0 0`
    ;;
  "2")
    if [[ "`echo $bugfilame`" != "" ]]; then
      dialog --backtitle "C4 Bug Report Tool" --title "Bug Report File" --yesno "$bugfilame Exists- Do you want to continu using that report?" 0 0
cancel_exit
      case $? in
        "0")
          ;;
        "1")
          lsdir="`ls -1 ~/.Per/ | grep .csv`"
          if [[ "$lsdir" == "" ]]; then
            bugfilame=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "New Bug Report File Name" --inputbox "There are no Existing Reports- Type New FileName - [filename.csv]:" 0 0`
cancel_exit
          else
            dialog --backtitle "C4 Bug Report Tool" --title "Existing Report/s" --infobox "$lsdir" 0 0 ; sleep 5
            bugfilame=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Existing Bug Report File Name" --inputbox "Type FileName from previous list - :" 0 0`
cancel_exit
          fi
          ;;
      esac
    else 
      lsdir="`ls -1 ~/.Per/ | grep .csv`"
      if [[ "$lsdir" == "" ]]; then
        bugfilame=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "New Bug Report File Name" --inputbox "There are no Existing Reports- Type New FileName - [filename.csv]:" 0 0`
cancel_exit
      else
        dialog --backtitle "C4 Bug Report Tool" --title "Existing Report/s" --infobox "$lsdir" 0 0 ; sleep 5
        bugfilame=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Existing Bug Report File Name" --inputbox "Type FileName from previous list - :" 0 0`
cancel_exit
      fi
    fi
    ;;
esac
### Set File Name
BREPRT=$REPDIR/$bugfilame
if [[ ! -a $BREPRT ]]; then
  touch $REPDIR/$bugfilame
  printf "\n $CHA \t$CHB \t$CHC \t$CHD \t$CHE \t$CHF \t$CHG \t$CHH \t$CHI \n" > $BREPRT 
fi
#
bugrel=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "SVN or Live Release Rev" --inputbox "Type SVN or Live Release Rev:" 0 0`
cancel_exit
bugsev=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Severity" --radiolist "Choose the Severity of the Bug:" 0 0 0 0 "0= Stop-Ship" off  1 "1= High- MUST be fixed in Next release" on 2 "2= Bad, but either a work-around or avoidance" off 3 "3= Needs to be fixed" off 4 "4= Enhancement Request" off`
cancel_exit
###     Bug Type
bugtype=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Category" --radiolist "Choose the TYPE of Bug:" 0 0 0 1 "Character Creator" off  2 "Map" on 3 "Powers" off 4 "Game Play" off 5 "UI & Menus" off 6 "Enhancement Request" off 7 "Script Request Bug or Issue" off`
cancel_exit
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
cancel_exit
###     Bug Long Desc
bugldsc=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Long Description" --inputbox "Type the Long Description:" 0 0`
cancel_exit
###     Bug STR
bugstr=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Steps To Reproduce" --inputbox "Provide The Steps To Reproduce (STR):" 0 0`
cancel_exit
###     Bug Reported by
bugwho=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Reported By Who?" --inputbox "Provide Who Identified this Bug:" 0 0`
cancel_exit
###     Bug Reported Date
bugdate=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Reprted Date" --calendar "Choose a date" 0 0`
cancel_exit
###     Bug Type
bugstatus=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Status" --radiolist "Choose the Status of Bug:" 0 0 0 1 "Open" on  2 "Closed" off 3 "Fixed" off 4 "Retest" off`
cancel_exit
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
printf "$bugrel \t$bugsev \t$typechk \t$bugsdsc \t$bugldsc \t$bugstr \t$bugwho \t$bugdate \t$statchk \n" >> $BREPRT
unset -f {bugrel,bugsev,typechk,bugsdsc,bugldsc,bugstr,bugwho,bugdate,statchk} 2>&1 > /dev/null
	bug_startbug
}
#
function bug_startbug
{
###     Request Input Bug
	dialog --backtitle "C4 Bug Report Tool" --title "Help - Options and Usage" --infobox "$OPTIONS" 0 0 ; sleep 6
bugrun=`$inpdialog --stdout --backtitle "C4 Bug Report Tool" --title "Bug Report Menu" --radiolist "Choose An Option:" 0 0 0 1 "Add Entry" on  2 "Read Bug Report" off 3 "Mail Bug Report" off 4 "Edit Bug Report [default editor is vi]" off 5 "Quit" off`
cancel_exit
case $bugrun in
  "1")
    bug_line
    ;;
  "2")
    exit $?
    ;;
  "3")
    exit $?
    ;;
  "4")
    exit $?
    ;;
  "5")
    clear
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
bug_startbug
exit $?
###	END OF WORKING
##
