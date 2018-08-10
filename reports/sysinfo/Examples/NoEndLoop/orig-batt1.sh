#!/bin/bash
#This script will show you the results of acpi –b every 10 seconds.
#Call the script battery.
#Displays battery time remaining every 10 seconds
for (( ; ; ))
do
echo `date`
acpi –b
sleep 10
done
##./batt1.sh | tee battery.log
##This will create a log and display the results on the screen also. Useful for overnight testing.
