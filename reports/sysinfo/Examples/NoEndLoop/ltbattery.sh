#!/bin/bash
# This script will show you the Status of she system (Until S3/S4)
# On Battery- Displays battery time remaining every 60 seconds [acpi –b]
#   Set up logrotation first!
if [[ "`rpm -qa | grep -w acpi`" == "" ]]; then
    echo -e "\n\tInstall acpi"
    exit $?
fi
PROGNAME=$(basename $0)
LOGFIL=/tmp/ltbat.btlog
if [[ "`egrep -Re $PROGNAME /etc/logrotate.d/*`" == "" ]]; then
    echo -e "\tYou really should setup logrotation before using this...\n"
    echo -e "\tWARNING! logrotation NOT setup...\n" >> $LOGFIL
fi
VMHOST=""
MYVM=""
MYUSER=""
MYVMHOSTNAME=""
#
function ltbat_check
{
ACSTAT="no"
for (( ; ; ))
    do
    while [ "$ACSTAT" == "no" ]; do
        if [[ "`upower -d | grep on-battery | awk -F: '{print $2}' | tr -d '\ '`" == "no" ]]; then
            if [[ "`echo $HOST`" == $VMHOST ]]; then
                if [[ "`ps -ef | grep VBoxHeadless | grep $MYVM`" == "" ]]; then
                    su -l -c ""/usr/bin/VBoxManage" startvm $MYVM --type headless" $MYUSER
                fi
            fi
##  Un-Comment the following line if you want to log AC status.
#            echo "System is on AC Power.. Sleeping 1 minute" >> $LOGFIL
            sleep 60
        else
            echo "WARNING! System is NOT on AC Power.." >> $LOGFIL
            echo -e "\tChecking Battery Life Remaining...\n\tLog files in /tmp/battery.log" >> $LOGFIL
            echo `date` >> $LOGFIL
            acpi –b 2>&1 >> $LOGFIL
            echo "" >> $LOGFIL
            if [[ "`echo $HOST`" == $VMHOST ]]; then
                ssh $MYVMHOSTNAME shutdown -h 1
                echo -e "\t`date`\n\tShutting down $MYVMHOSTNAME VM... in 1 minute" >> $LOGFIL
                echo -e "\t`date`\n\tShutting down $MYVMHOSTNAME ... in 1 minute" | wall
            fi
            sleep 60
        fi
    done
done
}
case $1 in
    "start")
        ltbat_check 2>&1 >> $LOGFIL
    ;;
    "stop")
        echo -e "\t------$PROGNAME killed by user------\n" >> $LOGFIL
        for i in `ps -ef | grep $PROGNAME | grep -v grep | awk '{print $2}'`; do
            kill -9 $i 2>&1 >> $LOGFIL
        done
        exit $?
    ;;
    *)
        echo -e "\n\tRequires 1 parameter- sh <command> start\n"
        exit $?
    ;;
esac
##./batt1.sh | tee battery.log to see in realtime
# Useful for overnight testing.

