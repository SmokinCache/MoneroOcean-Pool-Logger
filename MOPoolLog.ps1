########################################
######## User entered variables ########
########################################

# Enter miner address here between quotes. 
$mineraddress = "ADD ADDRESS HERE"
# Enter desired logfile path and name here between quotes !!!ENSURE PATH EXSISTS!!! Script will fail if path does not exist.
$logpath = "c:\poollogs\"
$logname = "poollog"
#Enter log frequecy in seconds 3600 seconds = 1 hour, 86400 seconds = 1 day
$logfreq = "3600"
#Enter "D" for Daily log or Y" for yearly log files. Defaults to Monthly log files
$lognew = "M"

# Columns are as follows ("timeStamp, amtdue, amtpaid, totalhashes, lasthash, validshares, invalidshares")

##########################################
######## End User enter variables ########
##########################################


# This section decides log file length
IF ($lognew -eq "D")
    {$logdateformat = "yyyy-MM-dd"}
elseif ($lognew -eq "Y") 
    {$logdateformat = "yyyy"}
else {$logdateformat = "yyyy-MM"}



$ver = "0.2"
#Pool data will be logged as long as flag is TRUE. Anything else will cause script to end.
$flag = "TRUE"
#log file location and naming.
$Logfile = "$logpath$logname-$(get-date -f $logdateformat).csv"

#Future Add test path - create path funtion here

Function log-Write
{
	Param ([string]$logstring)
	If ($Logfile)
	{
		Add-content $Logfile -value $logstring
	}
}
    
Function Poll-Pool
{
do {
    $timeStamp = "{0:yyyy-MM-dd_HH:mm:ss}" -f (Get-Date)
    $rawdata = Invoke-WebRequest -UseBasicParsing -Uri "https://api.moneroocean.stream/miner/$mineraddress/stats/"
    $data = $rawdata | ConvertFrom-Json
	    $hash = $data.hash
        $hash1 = $data.hash2
        $indentifier = $data.identifier
        $lasthash = $data.lastHash
        $totalhashes = $data.totalHashes
        $validshares = $data.validShares
        $invalidshares = $data.invalidShares
        $amtpaid = $data.amtPaid
        $amtdue = $data.amtDue
        $txncount = $data.txnCount
    log-Write ("$timeStamp, $amtdue, $amtpaid, $txncount, $totalhashes, $lasthash, $validshares, $invalidshares")
    start-sleep $logfreq
    
} while ($flag -eq "TRUE")
}
    
#Future test-path
#Future test if headers present and add if not

poll-pool


