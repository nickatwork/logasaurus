<#
.Synopsis
   Send a message to Slack
   MIT License Copyright 2019, nickatwork.com
.DESCRIPTION

   Sends message to Slack channel.

.PARAMETER channel

.PARAMETER iconemoji

.PARAMETER slackuser

.PARAMETER slackstring

.PARAMETER slackURI

.PARAMETER timestamp

    Timestamp variable to return

.PARAMETER logErrors

    Logs errors to ./logs.log

.EXAMPLE

send-slack -channel "#WHATTHETRUCK" -

.Notes

.LINK

https://github.com/nickatwork/logasaurus

#>

Function send-slack{


    [CmdletBinding()]
    param(
    [parameter(Mandatory=$true,HelpMessage="Enter valid Slack channel name, include #")]
    [string]$channel,
    [string]$iconemoji,
    [string]$slackuser,
    [string]$message,
    [parameter(Mandatory=$true,HelpMessage="Enter HTTPS Slack integration URL")]
    [string]$slackURI,
    [string]$logfmt,
    [string]$payload,
    [string]$timestamp,
    [switch]$LogErrors,
    [string]$ErrorLogs = './log.log'

    )
        write-verbose "Slack URL: $slackURI"
    if(!$channel){
        $channel = "#NOTSET"
    }
    if(!$iconemoji){
        $iconemoji = ":mailbox_with_no_mail:"
    }
    if(!$slackuser){
        $slackuser = "makerbot"
    }
    if($logfmt){
        $Tab = [char]9
        #$body = "level=$loglevel host='$sourcehost' time='$time' source='$sourceName' script='$recipe' msg='$message' number=$number"
        $message = @{
            "level" = "$loglevel";
            "host" = "$sourcehost";
            "time" = "$time";
            "source" = "$sourceName";
            "script" = "$script";
            "msg" = "$message";
            "number" = "$number";
        }
      }
    if(!$payload){
        $payload = @{
        "channel" = "$channel";
        "icon_emoji" = "$iconemoji";
        "text" = "$message";
        "username" = "$slackuser";
        }
    }

    Invoke-WebRequest -Uri $slackURI -Method "POST" -Body (ConvertTo-Json -Compress -InputObject $payload)

}

Export-ModuleMember -Function send-slack -Variable *

