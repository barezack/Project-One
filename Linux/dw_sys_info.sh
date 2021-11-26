#!/bin/bash
output=~/Research/sys_info.txt
#the command below is checking for root
if [ $UID = 0 ]
 then 
        echo "Don't run this as root!"
exit 
fi
#the command below is checking for a Research directory
if [ ! -d ~/Research ]
 then 
	mkdir ~/Research
fi
#this tell the script is output exists then remove it
if [ -f $output ]
	then 
	  rm $output
fi

touch $output
echo "A Quick System Audit Script" > $output
date >> $output
echo "" >> $output
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> $output
echo "Hostname: $(hostname -s) " >> $output
echo -e "\n777 Files:" >>  $output
find / -type f -perm 777 >> $output
echo -e "\nTop 10 Processes" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output



