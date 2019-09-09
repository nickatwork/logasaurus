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
    [parameter(Mandatory=$true,HelpMessage="Enter a valid Slack channel name, include #")]
    [string]$channel,
    [parameter(Mandatory=$false,HelpMessage="What Slack emoji will accompany the message. The default is :mailbox_with_no_mail:")]
    [string]$iconemoji,
    [parameter(Mandatory=$false,HelpMessage="What Slack user will accompany the message. The default is : messagebot")]
    [string]$slackuser,
    [parameter(Mandatory=$true,HelpMessage="What Slack message will be sent. This is a required parameter")]
    [string]$message,
    [parameter(Mandatory=$true,HelpMessage="Enter your HTTPS Slack integration URL")]
    [string]$slackURI,
    [parameter(Mandatory=$false,HelpMessage="To use logfmt style formatting.")]
    [switch]$logfmt,
    [parameter(Mandatory=$false,HelpMessage= " The payload is your message contents.")]
    [string]$payload,
    [parameter(Mandatory=$false,HelpMessage="Timestamp is when the event occurred. Enter no timestampt to utilize when Slack received the message")]
    [string]$timestamp,
    [parameter(Mandatory=$false,HelpMessage="Enable the Logerror switch to view error messages in the console. Requires the -verbose switch")]
    [switch]$LogErrors,
    [switch]$test
    )

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
           $message = @{
            "level" = "$loglevel";
            "host" = "$sourcehost";
            "time" = "$timestamp";
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
    $payload1 = ConvertTo-Json -Compress -InputObject $payload
    if($test){
        write-verbose "Slack URL: $slackURI"
        write-verbose "Message: $message"
        write-verbose "Channel: $channel"
        write-verbose "Slack User: $slackuser"
        write-verbose "Test mode: $test"
        write-verbose "Payload: $Payload1"
        foreach($keys in $payload.keys){
            write-verbose "Each Item in Payload: $payload[$keys]"
        }
    }

    try{
        $return = Invoke-RestMethod -Uri $slackURI -Method POST -Body $payload -ContentType "application/json"
    }
    catch {
        if($LogErrors){
            $formatstring = "{0} : {1}`n{2}`n" +
            "    + CategoryInfo          : {3}`n"
            "    + FullyQualifiedErrorId : {4}`n"
            $fields = $_.InvocationInfo.MyCommand.Name,
            $_.ErrorDetails.Message,
            $_.InvocationInfo.PositionMessage,
            $_.CategoryInfo.ToString(),
            $_.FullyQualifiedErrorId
            $messageverbose = "$formatstring -f $fields"
            Write-Error "level=[error] host='$sourcehost' time='$time' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"
                 } #end if
    }
    if($test){
        write-verbose "RETURN: $return"
    }
}

Export-ModuleMember -Function send-slack -Variable *

