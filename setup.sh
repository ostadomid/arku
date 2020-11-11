#!/bin/bash

export PATH=$PWD:$PATH
chmod 777 /app/rclone

export PATH=$PWD:$PATH

# Create download folder
mkdir -p downloads

# DHT

# Tracker
tracker_list=$(cat ./all.txt |awk NF|sed ":a;N;s/\n/,/g;ta")
echo "bt-tracker=$tracker_list" >> aria2c.conf

echo $PATH > PATH
