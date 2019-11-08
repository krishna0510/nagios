#!/bin/bash

loadavg=$( uptime | awk -F: '{print $5}' | xargs )

load1int=$( echo $loadavg | cut -d "." -f 1 )
load5int=$( echo $loadavg | awk -F, '{print $2}' | xargs | cut -d "." -f 1 )
load15int=$( echo $loadavg | awk -F, '{print $3}' | xargs | cut -d "." -f 1 )

load1=$( echo $loadavg | awk -F, '{print $1}' )
load5=$( echo $loadavg | awk -F, '{print $2}' )
load15=$( echo $loadavg | awk -F, '{print $3}' )

output="Load Average: $loadavg | Load_1min=$load1, Load_5min=$load5, Load_15min=$load15"

if [ $load1int -le 1 -a $load5int -le 1 -a $load15int -le 1 ]
then
echo "OK- $output"
exit 0
elif [ $load1int -le 2 -a $load5int -le 2 -a $load15int -le 2 ]
then
echo "WARNING- $output"
exit 1
elif [ $load1int -gt 2 -a $load5int -gt 2 -a $load15int -gt 2 ]
then
echo "CRITICAL- $output"
exit 2
else
echo "UNKNOWN- $output"
exit 3
fi
