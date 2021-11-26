#!/bin/bash
#user=$user
output=$home/research/sys_into.txt
#the command below is checking for root
#if [ $UID = 0 ]
# then 
#        echo "Don't run this as root!"
#exit 
#fi
#the command below is checking for a Research directory
if [ ! -d ~/research ]
 then 
        mkdir ~/research
fi
#this tell the script is output exists then remove it
if [ -f $output ]
        then 
          rm $output
fi


echo "A Quick System Audit Script" >~/research/sys_info.txt
date >>~/research/sys_info.txt
echo "" >>~/research/sys_info.txt
echo "Machine Type Info:" >>~/research/sys_info.txt
echo $MACHTYPE >>~/research/sys_info.txt
echo -e "Uname info: $(uname -a) \n" >>~/research/sys_info.txt
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >>~/research/sys_info.txt
echo -e "Hostname: $(hostname -s) \n" >>~/research/sys_info.txt
echo "DNS Servers: " >>~/research/sys_info.txt
cat /etc/resolv.conf >>~/research/sys_info.txt
echo -e "\nMemory Info:" >>~/research/sys_info.txt
free >>~/research/sys_info.txt
echo -e "\nCPU Info:" >>~/research/sys_info.txt
lscpu | grep CPU >>~/research/sys_info.txt
echo -e "\nDisk Usage:" >>~/research/sys_info.txt
df -H | head -2 >>~/research/sys_info.txt
echo -e "\nWho is logged in: \n $(who -a) \n" >>~/research/sys_info.txt
echo -e "\nExec Files:" >>~/research/sys_info.txt
find /home -type f -perm 777 >>~/research/sys_info.txt
echo -e "\nTop 10 Processes" >>~/research/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >>~/research/sys_info.txt














