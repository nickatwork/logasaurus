<#
.Synopsis
   Set logging levels globally throughout Logasaurus
   MIT License Copyright 2019, nickatwork.com
.DESCRIPTION

     set-log changes the logging format and logging levels globally throughout the Logasaurus family.


.PARAMETER logDirectory

    The directory to search for last modified log file

.PARAMETER loglevel

    Logging Level, INFO or DEBUG. Default is Informational

    "NOTSET" = 0
    "ERROR" = 5
    "WARNING" =15
    "INFO" = 20
    "DEBUG" = 30

.PARAMETER json

    Switch to use json formatting globally

.PARAMETER logfmt

    Switch to simply log data as a series of one or more key/value pairs

.PARAMETER logfmtKeyPairs

    Location of configuration file for logfmt key/value pairs

.PARAMETER test

.PARAMETER LogErrors


.EXAMPLE

    set-log -loglevel 20 -logfmt

.Notes
.LINK

https://github.com/nickatwork/logasaurus
#>

function set-logasaur {

    [CmdletBinding()]
  param(
    [string]$loglevel,
    [switch]$json,
    [switch]$logfmt,
    [string]$logfmtKeyPairs,
    [switch]$test,
    [switch]$LogErrors
    )

    if(!$logfmtKeyPairs){
        $pathKeyPair = get-module -name logasaur | select ModuleBase
        $pathKeyPair = $pathKeyPair.ModuleBase
        $logfmtKeyPairs = get-content -path "$pathKeyPair/Public/keypairs.conf"
    }



} # end set-log


Export-ModuleMember -Function set-logasaur -Variable *