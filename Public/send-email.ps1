<#
.Synopsis
   Creates mailbox
   MIT License Copyright 2019, nickatwork.com
.DESCRIPTION

    Sends HTML formatted email to recipient

.PARAMETER mailuser

    SMTP relay username

.PARAMETER password

    Sender password for SMTP relay access

.PARAMETER cc

    Carbon copy recipents

.PARAMETER recipient

    Email recipient

.PARAMETER body

    Email body

.PARAMETER subject

    Email subject

.PARAMETER SMTPhost

    SMTP relay host

.PARAMETER SMTPport

    SMTP port - default 587

.PARAMETER test

.PARAMETER logErrors

    Logs errors to ./logs.log

.EXAMPLE

send-mail.ps1 -recipient ad.rock@bb.com -subject "Gonna kick your root down" -cc "mike.d@bb.com,mixmaster.mike@neverrockfila.com"

.Notes

.LINK

    https://github.com/nickatwork/logasaurus

#>


function send-email {
    #Parameters

        [CmdletBinding()]
        param(
        [string]$ErrorLog = './log.log',
        [string]$username,
        [string]$mailuser,
        [string]$password,
        [string]$recipient,
        [string]$body,
        [string]$cc,
        [string]$subject,
        [string]$transaction,
        [string]$SMTPhost,
        [int32]$SMTPport,
        [switch]$test,
        [switch]$LogErrors

        )

        $secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
        $seccreds = New-Object System.Management.Automation.PSCredential ("$mailuser", $secpasswd)

        if(!$body){
            $body = Get-Content "./hello.html"
        }
        else{
            $body = Get-Content "$body"
        }
        if(!$SMTPport){
            $SMTPPort = 587
        }

        $mailParams=@{
            To = "$recipient"
            From = "$mailuser"
            cc = "$cc"
            Subject = "$subject"
            SMTPServer = "$SMTPhost"
            Body = $Body
            BodyAsHTML = $True
            Port = $SMTPport
            UseSSL = $True
            Credential = $seccreds
            }

        try{
            Send-MailMessage @mailParams -ErrorAction stop
        }
        Catch{
            if($LogErrors){

                              $formatstring = "{0} : {1}`n{2}`n" +
                               "    + CategoryInfo          : {3}`n"
                              "    + FullyQualifiedErrorId : {4}`n"
                              $fields = $_.InvocationInfo.MyCommand.Name,
                              $_.ErrorDetails.Message,
                              $_.InvocationInfo.PositionMessage,
                              $_.CategoryInfo.ToString(),
                              $_.FullyQualifiedErrorId
                              write-verbose ($formatstring -f $fields)
                  } #end if
              } #end catch
    }

    Export-ModuleMember -Function send-email -Variable *