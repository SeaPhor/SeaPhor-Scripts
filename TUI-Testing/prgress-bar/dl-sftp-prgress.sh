#!/bin/bash
# heavily inspired by http://fitnr.com/showing-file-download-progress-using-wget.html
# Retrieved from https://gist.github.com/Gregsen/7822421
#	Original
#URL=<YOUR DOWNLOAD URL>
#	Mine - https://github.com/SeaPhor/SeaPhor-Scripts
##	Requires 2 parameters- <scriptname> <Full URL> <Your-Name-For-This-DL>
URL=$1
scp -r --progress=dot "$URL" . 2>&1 |\
grep "%" |\
sed -u -e "s,\.,,g" | awk '{print $2}' | sed -u -e "s,\%,,g"  | dialog --gauge "Downloading $2" 10 100
exit $?
