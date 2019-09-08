<#
.Synopsis
   Log tailing
   MIT License Copyright 2019, nickatwork.com
.DESCRIPTION

     get-log changes the current location to the file that was most recently pushed onto the stack.

.PARAMETER logDirectory

    The directory to search for last modified log file

.PARAMETER tailLines

    Number of lines to tail

.EXAMPLE

    get-log /var/log -taillines 100

.Notes
.LINK

https://github.com/nickatwork/logasaurus
#>



function get-log{

	[CmdletBinding()]
	param(
        [string]$logdirectory,
        [int32]$tailLines,
		[switch]$test
    )

	if(!$logdirectory){
	$logdirectory = "./logs"
    }
    if(!$tailLines){
        $tailLines = 25
    }

    $currentlog = Get-ChildItem $logdirectory | Sort-Object LastWriteTime | select-object -last 1

    if($IsWindows -eq $true){
	    Get-ChildItem $logdirectory/$currentlog -tail $tailLines -wait
    }
    if($IsMacOS -eq $true){
        write-host $currentlog
        tail -n $tailLines -F $currentlog
    }

}

Export-ModuleMember -Function get-log -Variable *