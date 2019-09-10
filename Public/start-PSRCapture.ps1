<#
.Synopsis
   Start Screen Capture with Problem Screen Recorder (PSR)
   MIT License Copyright 2019, nickatwork.com
.DESCRIPTION

    Start Screen Capture with Problem Screen Recorder (PSR)

.PARAMETER captureFile

.PARAMETER gui

.PARAMETER logErrors

.PARAMETER logfile

    Specify a logfile. Default is c:\utility\logs\PSRCapture.log

.PARAMETER recipe

    For logging is FRMT

.EXAMPLE

start-PSRCapture

.Notes
.LINK
https://github.com/nickak/logasaurus
https://github.com/nickatwork

#>
function start-PSRCapture {
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$false, HelpMessage="Enter an output file. For example c:\utility\bobblahblah.zip")]
        [string]$captureFile,
        [int32]$recordPID,
        [switch]$captureScreenshots,
        [switch]$gui,
        [switch]$logEvents,
        [string]$logfile,
        [string]$recipe,
        [switch]$test

    )

    if(!$recipe){
        $recipe = "start-PSRCapture"
    }
    if($logEvents){
        if(!$logfile){
            $logFile = "c:\utility\logs\PSRCapture-log"
        }
        if(-not (test-path $logfile)){
            new-item $logfile -type file -Force
        }
    }

    if($gui){
        $guiID = 1
    }
    if(!$gui){
        $guiID = 0
    }
    if(!$captureFile){
        $dateme = Get-Date -Format yyyyMMddhhmmss
        $fileToCapture = "$dateme-capture.zip"
        $captureFile = "$env:USERPROFILE\Documents\$fileToCapture"

    }
    try{
        New-Variable -name CaptureFile -Value "$captureFile" -Scope global -Force
    }
    catch{
        $formatstring = "{0} : {1}`n{2}`n" +
        "    + CategoryInfo          : {3}`n"
        "    + FullyQualifiedErrorId : {4}`n"
       $fields = $_.InvocationInfo.MyCommand.Name,
        $_.ErrorDetails.Message,
        $_.InvocationInfo.PositionMessage,
        $_.CategoryInfo.ToString(),
       $_.FullyQualifiedErrorId
       $messageverbose = "$formatstring -f $fields"
       $dateme = get-date
       $msg = "level=[error] host='$env:COMPUTERNAME' time='$dateme' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"
       Write-Warning $msg
    }
    if($recordPID){
        $buildCmd = "/start /output $captureFile /sc 1 /gui $guiID /stopevent 123456"
    }
    if(!$recordPID){
        $buildCmd = "/start /output $captureFile /sc 1 /gui $guiID /stopevent 123456"
    }
        try{
            start-process -filepath c:\windows\system32\psr.exe -argumentlist $buildCmd
        }
        catch{
            $formatstring = "{0} : {1}`n{2}`n" +
            "    + CategoryInfo          : {3}`n"
            "    + FullyQualifiedErrorId : {4}`n"
           $fields = $_.InvocationInfo.MyCommand.Name,
            $_.ErrorDetails.Message,
            $_.InvocationInfo.PositionMessage,
            $_.CategoryInfo.ToString(),
           $_.FullyQualifiedErrorId
           $messageverbose = "$formatstring -f $fields"
           $dateme = get-date
           $msg = "level=[error] host='$env:COMPUTERNAME' time='$dateme' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"
           Write-Warning $msg
        }
}

Export-ModuleMember -Function start-PSRCapture