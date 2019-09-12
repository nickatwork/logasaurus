<#
.Synopsis
   Creates SMTP style message

   MIT License Copyright 2019, nickatwork.com
.DESCRIPTION

    Creates SMTP style message

.PARAMETER userNameEmail

    SMTP authenicating user

.PARAMETER mailuser

    SMTP relay username

.PARAMETER passwordEmail

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

    Sends email with exporting to console with -verbose tag

.PARAMETER logErrors

    Switch to enable errors to console

.EXAMPLE

send-mail -recipient ad.rock@bb.com -subject "Gonna kick your root down" -cc "mike.d@bb.com,mixmaster.mike@neverrockfila.com" -body "Text stream"

.Notes

.LINK

    https://github.com/nickatwork/logasaurus

#>


function send-email {
        [CmdletBinding()]
        param(
        [parameter(Mandatory=$true, HelpMessage="Email authenicator sender is required")]
        [string]$userNameEmail,
        [parameter(Mandatory=$false, HelpMessage="Email sender, can be the same as userNameEmail is expected")]
        [string]$mailuser,
        [parameter(Mandatory=$true, HelpMessage="Email credentials are crucial.")]
        [string]$passwordEmail,
        [parameter(Mandatory=$true, HelpMessage="Email recipent is expected")]
        [string]$recipient,
        [parameter(Mandatory=$true, HelpMessage="Email body is expected. Think of the reader! What is this email!")]
        [string]$body,
        [string]$cc,
        [parameter(Mandatory=$true, HelpMessage="Email subject is expected. Help the reader.")]
        [string]$subject,
        [string]$transaction,
        [parameter(Mandatory=$true, HelpMessage="SMTP host is necessary to send the message.")]
        [string]$SMTPhost,
        [parameter(Mandatory=$false, HelpMessage="SMTP port is necessary to send the message. Default is port 587")]
        [int32]$SMTPport,
        [switch]$test,
        [switch]$LogErrors
        )

        $secpasswd = ConvertTo-SecureString $passwordEmail -AsPlainText -Force
        $seccreds = New-Object System.Management.Automation.PSCredential ("$usernameEmail", $secpasswd)

        if(!$SMTPport){
            $SMTPPort = 587
        }
        if(!$mailuser){
            $mailuser = $userNameEmail
        }
        if($cc){
            $mailParams=@{
                To = "$recipient"
                From = "$mailuser"
                cc = "$cc"
                Subject = "$subject"
                SMTPServer = "$SMTPhost"
                Body = $Body
                Port = $SMTPport
                UseSSL = $True
                Credential = $seccreds
                }
        }
        if(!$cs){
            $mailParams=@{
                To = "$recipient"
                From = "$mailuser"
                Subject = "$subject"
                SMTPServer = "$SMTPhost"
                Body = $Body
                Port = $SMTPport
                UseSSL = $True
                Credential = $seccreds
                }
        }
        if($test){
            write-verbose "Recipent: $recipient"
            write-verbose "From mailuser: $mailuser"
            write-verbose "Subject: $subject"
            write-verbose "Body: $body"
            foreach($item in $mailParams){
                write-verbose "Item: $item"
            }
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