#!/bin/bash

states=('PA' 'AZ' 'OR' "Cali" "HI")

for state in ${states[4]};
 do
   if [ $state = 'HI' ]
 then 
  echo "$state Is the best!"
 else 
  echo "I'm not fond of Hawaii"
fi
done


