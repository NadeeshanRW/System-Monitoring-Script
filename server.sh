#! /bin/bash 


 REPORT="/home/nadiya/Desktop/report.txt"

date=$(date "+%y-%m-%d")
time=$(date "+%H:%M:%S")

 
echo "===========SEVER REPORT=============" 

echo "DATE OF REPORT :- $date"     
echo "TIME OF THE REPORT :- $time"  

echo =============================================== 

echo "cpu  Usage: "

top -bn1 | grep "Cpu(s)" | awk '{print  $2 + $4 "%"}'

echo=================================================
echo
echo "uptime: $(uptime -p)"
echo 
echo=================================================
echo

echo "Memory  Usage: " 
echo

free -h 

echo =================================================


echo "Disk Usage: " 
df -h
echo "disk space: "

df --total -h | grep "total"





