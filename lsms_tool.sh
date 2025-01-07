#!/bin/bash

REPORT="/home/nadiya/Desktop/report.txt"

date=$(date "+%y-%m-%d")
time=$(date "+%H:%M:%S")

# ASCII Art - Linux Server Report
echo "██████╗ ███████╗███╗   ███╗███████╗"
echo "██╔══██╗██╔════╝████╗ ████║██╔════╝"
echo "██████╔╝███████╗██╔████╔██║███████╗"
echo "██╔═══╝ ╚════██║██║╚██╔╝██║╚════██║"
echo "██║     ███████║██║ ╚═╝ ██║███████║"
echo "╚═╝     ╚══════╝╚═╝     ╚═╝╚══════╝"
echo
echo "===========SERVER REPORT============="
echo "DATE OF REPORT :- $date"
echo "TIME OF THE REPORT :- $time"
echo "======================================"

echo "CPU Usage: "
top -bn1 | grep "Cpu(s)" | awk '{print  $2 + $4 "%"}'

echo "======================================"
echo
echo "Uptime: $(uptime -p)"
echo
echo "======================================"
echo

echo "Memory Usage: "
free -h

echo "======================================"
echo

echo "Disk Usage: "
df -h
echo "Disk Space: "
df --total -h | grep "total"
