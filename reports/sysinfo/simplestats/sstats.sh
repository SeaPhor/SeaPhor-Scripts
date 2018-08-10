#!/bin/bash
function gpl_info
{
###################################################################################
#####	GNU/GPL Info
###################################################################################
  echo -e "\n$(tput setaf 14)
####c4#############################################################################
###										###
##			GNU/GPL info 						###
##		SysInfo ver. 4.1-5						###
##		Forked for sstats.sh						###
##	Released under GPL v2.0, See www.gnu.org for full license info		###
##	Copyright (C) 2006  Shawn Miller					###
##	  email- shawn@woodbeeco.com						###
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
##	Script Originally GPL licenced as version 1.0-1, November, 2006		###
##	First used and modified for HP in version 2.5-0 in 2010			###
##	Name modified and fully used for HP in version 3.0 in 2011		###
##	Officially given to SUSE as hp-sysinfo version 3.0 in 2011		###
##	Officially given to HP as hp-sysinfo version 3.0 in 2011		###
##		Maintained Original version as seaphor				###
##										###
###################################################################################
$(tput sgr 0)\n"
}
#
###################################################
#  Description and Usage
##	This script is meant to be used to gather information from remote machines
##	This script Requires 3 parameters from the SOURCE machine
##	This script Requires 2 parameters on the TARGET machines (already in the remote command)
##	Usage-
###	  SCRIPTNAME OPTION LISTNAME
##	Example-
###	  SCRIPTNAME -l LISTNAME - [sstats.sh -l mylist]
##	Example 'mylist' [Remove the '#' and ALL witespace/empty lines]-
# serverhostname1
# serverhostname2
# serverhostname3
# serverhostname4
#  END of Description and Usage
############################################################################
# Variables
    PROGNAME=$(basename $0)
    HOSTA=`hostname`
    DDATE=`date +%Y-%d-%b`
    WRKDIR=`pwd`
    #
    NAMA="SELinux Status"
    if [[ "`cat /etc/*release | grep -i redhat`" != "" ]]; then
      CHKA="`getenforce`"
    else
      CHKA="SELinux Not Installed"
    fi
    NAMB="Firewall Status"
    if [[ "`cat /etc/*release | grep -i redhat`" != "" ]]; then
      CHKB="`systemctl status firewalld.service`"
    else
      CHKB="`systemctl status SuSEfirewall2`"
    fi
    NAMC="Uname -m"
    CHKC="`uname -m`"
    NAMD="Uname -r"
    CHKD="`uname -r`"
    NAME="Free -m"
    CHKE="`free -m`"
    NAMF="Host ID"
    CHKF="`hostid`"
    NAMG="OS Release"
    CHKG="`cat /etc/*release`"
    NAMH="Host$Name"
    CHKH="`hostname`"
    NAMI="DNS"
    CHKI="`nslookup $CHKH`"
    NAMJ="Partitioning"
    CHKJ="`lsblk -ap --output=NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT`"
    NAMK="CPU Core ID"
    CHKK="`cat /proc/cpuinfo | grep -Ec '^core id'`"
    NAML="CPU AES Flags"
    CHKL="`cat /proc/cpuinfo | grep -Ec '^flags.*aes'`"
    NAMM="NTP Status"
    CHKM="`ntpq -p 2>&1`"
    NAMN="NTP Command"
    CHKN="`ntpstat`"
#    NAMO="Placeholder for NAMO"
#    CHKO="Placeholder for CHKO"
    NAMP="Date"
    CHKP="`date`"
    NAMQ="Another SELinux Check"
    if [[ "`echo $CHKA | grep 'Not'`" == "" ]]; then
      CHKQ="`grep '^SELINUX=' /etc/selinux/config`"
    else
      CHKQ="SELinux Not Installed"
    fi
    NAMR="DNSMask Status"
    CHKR="`systemctl status dnsmasq.service`"
    NAMT="Interfaces"
    CHKT="`ifconfig`"
# Functions
function get_stats
{
#
###################################################################################
#####   Checking for root, setting error exit
###################################################################################
  function error_exit
  {
    echo "${PROGNAME}: ${1:-"you are not root, please run as root"}" >&2
    exit 1
  }
###
  [[ "$UID" == "0" ]] && : || error_exit
###################################################################################
  echo -e "\n $NAMH\n$CHKH" > /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMA\n$CHKA" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMB\n$CHKB" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMC\n$CHKC" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMD\n$CHKD" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAME\n$CHKE" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMF\n$CHKF" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMG\n$CHKG" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMI\n$CHKI" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMJ\n$CHKJ" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMK\n$CHKK" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAML\n$CHKL" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMM\n$CHKM" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMN\n$CHKN" >> /tmp/$HOSTA-CheckList.txt
#  echo -e "\n $NAMO\n$CHKO" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMP\n$CHKP" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMQ\n$CHKQ" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMR\n$CHKR" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n $NAMT\n$CHKT" >> /tmp/$HOSTA-CheckList.txt
  echo -e "\n\n\n" >> /tmp/$HOSTA-CheckList.txt
}
# Execution
#
case $1 in
  "-r")
    get_stats
    exit 0
    ;;
  "-l")
    for i in `cat $2`; do scp $PROGNAME root@$i:/root/. ; ssh root@$i chmod +x /root/$PROGNAME ; ssh root@$i sh /root/$PROGNAME -r; scp root@$i:/tmp/*CheckList.txt /tmp/. ; ssh root@$i rm /tmp/*CheckList.txt ; done
    ;;
  "-g")
    gpl_info
    exit 0
    ;;
  *)
    exit $?
    ;;
esac
cat /tmp/*CheckList.txt > $DDATE-CheckList.txt
chown -R `pwd | awk -F/ '{print $3}'`. `pwd`
rm /tmp/*CheckList.txt
exit $?
# END of script
