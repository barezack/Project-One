#!/bin/bash
#user=$user
output=/home/$user/research/sys_into.txt

ip=$(ip addr | grep inet | tail -2 | head -1)

ex=(find /home -type f -perm 777)
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


echo "A Quick System Audit Script" >$output
date >>$output
echo "" >>$output
echo "Machine Type Info:" >>$output
echo $MACHTYPE >>$output
echo -e "Uname info: $(uname -a) \n" >>$output
#echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >>$output
echo -e $ip >>$output
echo -e "Hostname: $(hostname -s) \n" >>$output
echo "DNS Servers: " >>$output
cat /etc/resolv.conf >>$output
echo -e "\nMemory Info:" >>$output
free >>$output
echo -e "\nCPU Info:" >>$output
lscpu | grep CPU >>$output
echo -e "\nDisk Usage:" >>$output
df -H | head -2 >>$output
echo -e "\nWho is logged in: \n $(who -a) \n" >>$output
echo -e "\nExec Files:" >>$output
#find /home -type f -perm 777 >>$output
echo -e $ex >>$output
echo -e "\nTop 10 Processes" >>$output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >>$output

#for user in $(le /home);
#do
#sudo -lu $user












