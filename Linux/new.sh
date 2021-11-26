#!bin/bash

ip=$(ip addr | head -9 | tail -1)
ex=$(find /home -f -perm777)

echo $ip
echo $ex


