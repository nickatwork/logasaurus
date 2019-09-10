<#
.Synopsis
   Stops Screen Capture with Problem Screen Recorder (PSR)
   MIT License Copyright 2019, nickatwork.com
.DESCRIPTION

    Stops Screen Capture with Problem Screen Recorder (PSR)

.PARAMETER captureFile

.PARAMETER copyCaptureFile

    Copy the screen capture file

.PARAMETER logEvents

    To trigger logging events

.PARAMETER logfile

    Specify a logfile. Default is c:\utility\logs\PSRCapture.log

.PARAMETER recipe

    For logging is FRMT

.EXAMPLE

stop-PSRCapture

.Notes
.LINK
https://github.com/nickak/logasaurus
https://github.com/nickatwork

#>
function stop-PSRCapture {
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$false, HelpMessage="Enter an output file. For example c:\utility\bobblahblah.zip")]
        [string]$captureFile,
        [switch]$copyCaptureFile,
        [switch]$moveCaptureFile,
        [string]$CaptureFileDestination,
        [switch]$logEvents,
        [string]$logfile,
        [string]$recipe

    )
    write-verbose "capturefile: $capturefile"
    if(!$recipe){
        $recipe = "stop-PSRCapture"
    }
    if($logEvents){
        if(!$logfile){
            $logFile = "c:\utility\logs\PSRCapture-log"
        }
        if(-not (test-path $logfile)){
            new-item $logfile -type file -Force
        }
    }

        $buildCmd = "/stop"

        try{
            start-process -filepath c:\windows\system32\psr.exe -argumentlist $buildCmd
            start-sleep -s 15
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
        if($copyCaptureFile){
            try{
                copy-item -path $captureFile -Destination $CaptureFileDestination
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
        if($moveCaptureFile){
            try{
                move-item -Path $captureFile -Destination $CaptureFileDestination
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
               $msg  ="level=[error] host='$env:COMPUTERNAME' time='$dateme' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"
               Write-Warning $msg
            }
        }





}

Export-ModuleMember -Function stop-PSRCapture