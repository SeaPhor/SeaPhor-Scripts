#!/bin/bash
#    Requires 1 parameter- Identifying name of file/s
##     command Name
for filename in $1*; do newname=`echo $filename | sed -e 's/_-_/_/g' | sed -e 's/__/_/g' | sed -e 's/(//g' | sed -e 's/)//g' | sed -e 's/%//g'`; mv $filename $newname; done
ls
