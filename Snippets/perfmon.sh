#!/bin/bash
#
##########################################
####    Declare Global Variables
##########################################
progname=$(basename $0)
progvers="1.3.3-04"
progdate="10-Nov-2019"
##########################################
####    Declare Environment Variables
##########################################
ldate="$(date +%Y-%m-%d_%H-%M-%S)"
logdir=/tmp/perflogs
[[ -d $logdir ]] && rm -rf /tmp/perflogs
mkdir $logdir
ts_log=${logdir}/ts
vm_log=${logdir}/memstats
ld_log=${logdir}/loadlogs
cp_log=${logdir}/cpulogs
repdir=/tmp/permon-reports
[[ ! -d $repdir ]] && mkdir $repdir
##########################################
####    Set Help and Usage
##########################################

##########################################
####    Check args
##########################################
[[ $1 == "help" ]] && { usage; exit 0; }
[[ $1 ]] && declare -i times=$1 || declare -i times=300
totmins="$(expr $times \* 2 / 60)"
declare -i count=0
##########################################
####    Monitor function
##########################################
mon_load () {
until (( times == count )); do
    echo $ldate >> $ts_log
    echo "" >> $ld_log
    vmstat -s | grep "used memory" | awk '{print $1}' >> $vm_log &
    uptime | awk -F, '{print $3}' | sed 's/[^0-9,.]//g' >> $ld_log
    awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' <(grep 'cpu ' /proc/stat) <(sleep .5;grep 'cpu ' /proc/stat) >> cp_log &
    sleep 2
    ((++count))
done
}
##########################################
####    Begin Monitor
##########################################
mon_load
##########################################
####    Format logs
##########################################
sed -i '/^\s*$/d' $cp_log
sed -i '/^\s*$/d' $ld_log
mem_use=${logdir}/used_mem
> $used_mem
for i in $(cat $vm_log); do
    expr $i / 1024 >> $mem_use
done
sed -i 's/$/ MB/g' $mem_use
##########################################
####    Generate CSV Report
##########################################
echo -e "Date_Time_Stamp,Memory_Use,Load_Avg,CPU_Use" > ${repdir}/performance.csv
paste $ts_log $mem_use $ld_log $cp_log | column -s $'\t' -t | sed -e 's/  /,/g' | sed -e 's/,,/,/g' | sed -e 's/,,/,/g' | sed -e 's/\s//g' >> ${repdir}/performance.csv
##########################################
####    Cleanup and exit
##########################################
mv ${repdir}/performance.csv ${repdir}/performance${ldate}.csv
chmod 755 ${repdir}/performance${ldate}.csv
#rm -rf /tmp/perflogs
find ${repdir}/* -name "*.csv" -type f -mtime +2 -delete
echo -e "\nThe CSV Report was generated at ${repdir}/performance${ldate}.csv\n"
exit 0

