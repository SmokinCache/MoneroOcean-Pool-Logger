# MoneroOcean Pool Logger
This is my first attempt and any form of scripting or using git hub. Please be gentle

This powershell script logs the global data from https://MoneroOcean.stream (MO) for the designated payment address.

The logger creates a .csv file with the followning column order:
("timeStamp, amtdue, amtpaid, totalhashes, lasthash, validshares, invalidshares")

Here is a sample row from the log. 
2018-11-04_20:38:40, 3263648605382, 3234001479599, 4, 103824009732, 1541381876, 295510, 11

# Usage
Edit the User Entered Variables with desired settings. The user must eneter thier wallet address all other setttings can
be left as is. If left as is create a folder on C: drive named "poollogs" and start the script. Default settings will log the info hourly in a seperate file for each month.

Create a task in Windows Task Scheduler to run the srcipt on start to ensure the script will run after a reboot.
Here is a good read on how to create the task. https://community.spiceworks.com/how_to/17736-run-powershell-scripts-from-task-scheduler

Enter miner address here between quotes. This is the payment address used when mining at MO

$mineraddress = "ADD ADDRESS HERE"

Enter desired logfile path. !!!ENSURE PATH EXSISTS!!! Script will fail if path does not exist.

The log name will be appended with the date data based on the log file length variable setting. 

$logpath = "c:\poollogs\"

$logname = "poollog"

Enter log frequecy in seconds 3600 seconds = 1 hour, 86400 seconds = 1 day

$logfreq = "3600"

Log file length before creating a new file. Enter "D" for Daily log or Y" for yearly log files. Defaults to Monthly log files

$lognew = "M"

Powershell 3.0 or later is required




