#!/bin/bash

OUTPUT_CSV="/home/nadiya/Desktop/server_report.csv"

DATE=$(date "+%y-%m-%d")
TIME=$(date "+%H:%M:%S")

if [ ! -f "$OUTPUT_CSV" ]; then
    echo "Date,Time,Uptime,CPU Usage,Memory Usage,Disk Space Total,Disk,Size,Used,Available,Usage%" > "$OUTPUT_CSV"
fi

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}')

UPTIME=$(uptime -p | sed 's/,//g')

MEMORY_USAGE=$(free -h | awk '/Mem:/ {print $3 "/" $2}')

DISK_TOTAL=$(df --total -h | awk '/total/ {print $3 "/" $2}')

DISK_INFO=$(df -h --output=source,size,used,avail,pcent | grep "^/dev")

while IFS= read -r line; do
    DISK_SOURCE=$(echo $line | awk '{print $1}')
    DISK_SIZE=$(echo $line | awk '{print $2}')
    DISK_USED=$(echo $line | awk '{print $3}')
    DISK_AVAIL=$(echo $line | awk '{print $4}')
    DISK_PCENT=$(echo $line | awk '{print $5}')
    echo "$DATE,$TIME,\"$UPTIME\",$CPU_USAGE,\"$MEMORY_USAGE\",$DISK_TOTAL,$DISK_SOURCE,$DISK_SIZE,$DISK_USED,$DISK_AVAIL,$DISK_PCENT" >> "$OUTPUT_CSV"
done <<< "$DISK_INFO"

echo "Server report saved to $OUTPUT_CSV"
