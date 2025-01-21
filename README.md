# System-Monitoring-Script


This repository contains two Bash scripts designed for monitoring system performance metrics like **CPU usage, memory usage, disk space, and system uptime.** These scripts generate reports in both **CSV and plain text**  formats for further analysis.

Scripts

 * 1.server_report.sh
This script generates a detailed server report in CSV format, including information about CPU usage, memory usage, disk usage, and uptime. It appends the report to a file called server_report.csv located on the desktop.

 * 2.ascii_server_report.sh
This script creates a system performance report in a visually appealing text format, displayed with ASCII art headers and including CPU usage, memory usage, and disk statistics. The report is printed to the console and stored in report.txt.

Usage
          
Running the Scripts Manually
server_report.sh

This script will generate a CSV report. You can run it from the terminal:


    ./server_report.sh

  *The report will be saved in /home/nadiya/Desktop/server_report.csv.

ascii_server_report.sh

This script will generate a system report in text format with ASCII art. You can run it by:


    ./ascii_server_report.sh

The report will be displayed in the terminal and saved as /home/**HOST COMPUTER NAME **/Desktop/report.txt.

 Automating with Crontab
      
To run these scripts automatically at regular intervals, you can use cron jobs. Below are the 

 steps to set up automation:

Open the crontab editor by running:



    crontab -e

Add the following lines to schedule the scripts:

To run server_report.sh every day at midnight (00:00):



    0 0 * * * /bin/bash /home/nadiya/Desktop/server_report.sh

To run ascii_server_report.sh every day at 8:00 AM:



    0 8 * * * /bin/bash /home/nadiya/Desktop/ascii_server_report.sh


Save and exit the crontab editor. Now, the scripts will run automatically based on the schedule you set.



 Example Crontab Entry

Here’s an example of a crontab -e configuration to run both scripts:



    0 0 * * * /bin/bash /home/nadiya/Desktop/server_report.sh

or 

    0 8 * * * /bin/bash /home/nadiya/Desktop/ascii_server_report.sh


This will generate:

  * A CSV report daily at midnight.
  * A text report with ASCII art daily at 8:00 AM.

System Requirements

 * Bash shell
 * Linux-based operating system (e.g., Ubuntu)
 * top, df, and free commands (pre-installed on most Linux systems)
