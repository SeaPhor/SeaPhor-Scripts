#!/bin/bash
#
###	To be a TUI version of the fully functional CLI version of
###	- 'c4-bug-report.sh' located at --
###	- https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/reports/Bug-Report
#
	PROGNAME=$(basename $0)
###	Require 1 parameter <filename.csv>
	OUTFIL=~/$1
	INITRUN=false
#
###	Set filename parameter check
if [[ ! $1 ]]; then
	printf "\n\tYou MUST provide an output filename.csv [$PROGNAME bugreport.csv]\n"
	exit $?
###	Check Initial run
else
	if [[ ! -a $1 ]]; then
		printf "Bug Type\tBug Severity\tBug Short Description\tBug Long Description\tBug STR\tBug Date" >> $OUTFIL
	fi
fi
###	Create initial function
function bug_stuff
{
###	We create the function inpdialog
inpdialog=${inpdialog=dialog}
###	Bug Type
bugtype=`$inpdialog --stdout --backtitle "How's Your Day?" --title "Bug Type" --radiolist "Choose the TYPE of Bug:" 0 0 0 1 "Map" off  2 "Chargen" on 3 "Powers" off 4 "Game Play" off`
case $bugtype in
  "1")
    typechk="Map"
    ;;
  "2")
    typechk="Chargen"
    ;;
  "3")
    typechk="Powers"
    ;;
  "4")
    typechk="Game Play"
    ;;
esac
###	Bug Severity
bugsev=`$inpdialog --stdout --backtitle "How's Your Day?" --title "Bug Priority" --radiolist "Choose the Severity of the Bug:" 0 0 0 1 "1 Stop-Ship" off  2 "2 High- MUST be fixed in Next release" on 3 "3 Bad, but either a work-around or avoidance" off 4 "4 Needs to be fixed" off`
###	Bug Short Desc
bugsdsc=`$inpdialog --stdout --backtitle "How's Your Day?" --title "Short Description" --inputbox "Type the Short Description:" 0 0`
###	Bug Long Desc
bugldsc=`$inpdialog --stdout --backtitle "How's Your Day?" --title "Long Description" --inputbox "Type the Long Description:" 0 0`
###	Bug STR
bugstr=`$inpdialog --stdout --backtitle "How's Your Day?" --title "STR" --inputbox "Provide The Steps To Reproduce (STR):" 0 0`
###	Bug Dare
bugdate=`$inpdialog --stdout --backtitle "How's Your Day?" --title "Calendar" --calendar "Choose a date" 0 0`
###	post to output file
printf "\n$typechk\t$bugsev\t$bugsdsc\t$bugldsc\t$bugstr\t$bugdate\t" >> $OUTFIL
###	Check for report another bug, exit is in initial Request Input Bug
bug_morebug
}
#
function bug_morebug
{
###	Request Input Bug
dialog --backtitle "How's Your Day?" --title "Bug Entry" --yesno "\nDo you want to enter bug report? ....\n\nSelect Yes or no" 0 0 
if [[ $? == "1" ]]; then
	printf "\n\n\tNo Bug :(\n\n"
	exit $?
else
	bug_stuff
fi
}
#
### Run initial Request Input Bug
bug_morebug
exit $?


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
####w#################################b######################################c#####

