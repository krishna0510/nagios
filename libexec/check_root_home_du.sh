#!/bin/bash

homeUsage=$(du -s /root/ | cut -f1)

if (($homeUsage<=$((1024*1024)))); then
                echo "OK - Root home usage is $(du -sh /root/ | cut -f1)"
                exit 0
        elif (($((1024*1024))<$homeUsage && $homeUsage<=$((3*1024*1024)))); then
                echo "WARNING - Root home usage is $(du -sh /root/ | cut -f1)"
                exit 1
        elif (($((3*1024*1024))<$homeUsage)); then
                echo "CRITICAL - Root home usage is $(du -sh /root/ | cut -f1)"
                exit 2
        else
                echo "UNKNOWN - Value received: $homeUsage"
                exit 3
fi
