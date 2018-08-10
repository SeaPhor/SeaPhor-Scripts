#!/bin/bash
# This script will show you the results of AC/DC status and upon DC will report the Core temps (Until S3/S4)
#ACSTAT="`upower -d | grep on-battery | awk -F: '{print $2}' | tr -d '\ '`"
ACSTAT="no"
while [ "$ACSTAT" == "no" ]; do
    if [[ "`upower -d | grep on-battery | awk -F: '{print $2}' | tr -d '\ '`" == "no" ]]; then
        echo "System is on AC Power.. Sleeping 1 minute"
        sleep 60
    else
        echo "WARNING! System is HOT on AC Power.."
        echo -e "\tChecking Battery Life Remaining...\n\tLog files in /tmp/battery.log"


for (( ; ; ))
do
echo `date`
echo -e "\n\tCPU Temp:"
#cat /proc/acpi/thermal_zone/CPUZ/temperature
echo -e "\n\tCore 0 Temp:"
cat /sys/class/thermal/thermal_zone0/temp
echo -e "\tCore 1 Temp:"
cat /sys/class/thermal/thermal_zone1/temp
echo -e "\tCore 2 Temp:"
cat /sys/class/thermal/thermal_zone2/temp
echo -e "\tCore 3 Temp:"
cat /sys/class/thermal/thermal_zone3/temp
echo -e "\tCore 4 Temp:"
cat /sys/class/thermal/thermal_zone4/temp
echo -e "\tCore 5 Temp:"
cat /sys/class/thermal/thermal_zone5/temp
echo -e "\tCore 6 Temp:"
cat /sys/class/thermal/thermal_zone6/temp
echo -e "\tCore 7 Temp:"
cat /sys/class/thermal/thermal_zone7/temp
#echo -e "\n\tGPU Temp:"
#cat /proc/acpi/thermal_zone/GFXZ/temperature
echo ""
echo ""
sleep 10
done
##./batt1.sh | tee battery.log
##This will create a log and display the results on the screen also. Useful for overnight testing.

  function no_power
  {
    ACSTAT=true
  }
###
  [[ "upower -d | grep on-battery | awk -F: '{print $2}' | tr -d '\ '" == "no" ]] && : || no_power
#if [[ "`upower -d | grep on-battery | awk -F: '{print $2}' | tr -d '\ '`" == "no" ]]; then
#    echo "WARNING"
#else
#    echo "OK"
#fi

