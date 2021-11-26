#!/bin/bash

free -h > ~/backup/freemem/free_mem.txt
du -bch | head -4 > ~/backup/diskuse/free_disk.txt
ps aux > ~/backup/openlist/ope_list.txt
df -h > ~/backup/freedisk/free_disk.txt
