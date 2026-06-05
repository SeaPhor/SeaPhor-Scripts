#!/bin/bash
csv_dir="S{HOME}/Downloads"
my_file="${HOME}/repos/mylist.txt"
file_pattern="$csv_dir/my_app_202*.csv"
files=( $(ls -1t $file_pattern 2>/dev/null) )
file_count=${#files[@]}
if [[ $file_count -lt 1 ]]; then
    echo "..."
    exit 0
elif [[ $file_count -gt 1 ]]; then
    for ((i=1; i<file_count; i++)); do
        rm -f "${files[$i]}"
    done
fi
csv_file=$(ls $file_pattern)
txt_lst="${HOME}/mgmnt/needed.txt"
csv_lst="${HOME}/mgmnt/needed.csv"
[[ -e $txt_lst ]] && rm $txt_lst
tail -n +2 "$csv_file" | while IFS=',' read -r field1 field2 field4; do
    hostnm=$(echo "$hostname" | xargs)
    match=$(grep "^$hostnm,|" "$my_file")
    if [[ -n "$match" ]]; then
        px1=$(echo "$match" | awk -F',|' '{print $1}')
        px1=$(echo "$match" | awk -F',|' '{print $3}')
        px1=$(echo "$match" | awk -F',|' '{print $5}')
        echo "${hostnm} ${px3} ${px1} ${valid_days} Days >> $txt_lst"
    fi
done
cat $txt_lst | column -s'|' -t > $csv_lst
cat $csv_lst
exit 0
