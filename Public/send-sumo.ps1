

function send-sumo {
<#
.Synopsis
   Send logasaur log to aggregate logging service.
   MIT License Copyright 2019, nickatwork.com

.DESCRIPTION

    Dumps JSON or single line message or file to sumologic

.PARAMETER AggregateUrl

  SumoLogic HTTP URL target minus the Sumologic Key

.PARAMETER Aggregatekey

  HTTPS Key

.PARAMETER file

  Not implemented yet - Sending a huge log dump + attaching a json or xml

.PARAMETER loglevel

    NOTSET
    DEBUG
    INFO
    WARNING
    ERROR

.PARAMETER number

  Number for error message

.PARAMETER message

  Message contents for log

.PARAMETER recipe

  Recipe file name for tagging log specifics

.PARAMETER time

  Optional override to default unix style timestamp generated at time of http put script execution

.PARAMETER sourceCategory

  sumologic sourceCategory see https://help.sumologic.com/03Send-Data/Sources/02Sources-for-Hosted-Collectors/HTTP-Source/Upload_Metrics_to_an_HTTP_Source

.PARAMETER sourceName

  Sumologic sourceName see https://help.sumologic.com/03Send-Data/Sources/02Sources-for-Hosted-Collectors/HTTP-Source/Upload_Metrics_to_an_HTTP_Source

.PARAMETER sourcehost

  Option to override the hostname of host executing the http PUT

.PARAMETER json

  Formatting of logging message in Sumologic as JSON

.PARAMETER logfmt

  Formatting of logging message in Sumologic as logfmt style. Simply a series of one or more key values.

.PARAMETER test

 Print Console output of parameters

.PARAMETER logErrors

  Logs errors to console

.EXAMPLE sumologic logfmt message with debug level information

  send-sumo -logfmt -message "$errordump" -loglevel info -aggregratekey "w8TNJtizSsYETc6kxLExYFL373Qo2XFUU6Js"

.EXAMPLE sumologic json message with specificed sumologic category and information log level informational

  send-sumo -json -message "$dinodump" -loglevel error -sourceCategory "prod/API/infrastructure.nickatwork.com"


.Notes
.LINK

https://github.com/nickatwork/logasaurus

#>
    [CmdletBinding()]
  param(
    [parameter(Mandatory=$false, HelpMessage="The URL To SumoLogic's v1 API, https://endpoint1.collection.us2.sumologic.com/receiver/v1/http")]
    [string]$AggregateUrl,
    [parameter(Mandatory=$true, HelpMessage="Your SumoLogic's API key to submit an HTTP log entry")]
    [string]$Aggregatekey,
    [parameter(Mandatory=$false, HelpMessage="Your logging level, examples: DEBUG ,INFO, WARNING, or ERROR. The default is INFO")]
    [string]$loglevel,
    [parameter(Mandatory=$false, HelpMessage="Your error log or eventid number. Must be an integer")]
    [int32]$number,
    [parameter(Mandatory=$true, HelpMessage="Your error message. Fill it up as necesary")]
    [string]$message,
    [parameter(Mandatory=$false, HelpMessage="Recipe is an additional filter option for logging. The default is the name of the module and version")]
    [string]$recipe,
    [parameter(Mandatory=$false, HelpMessage="The timestamp of the logging event. The Default is in Unix time")]
    [string]$time,
    [parameter(Mandatory=$TRUE, HelpMessage="The sumologic sourceCategory see https://help.sumologic.com/03Send-Data/Sources/02Sources-for-Hosted-Collectors/HTTP-Source/Upload_Metrics_to_an_HTTP_Source")]
    [string]$sourceCategory,
    [parameter(Mandatory=$false, HelpMessage="Sumologic sourceName see https://help.sumologic.com/03Send-Data/Sources/02Sources-for-Hosted-Collectors/HTTP-Source/Upload_Metrics_to_an_HTTP_Source")]
    [string]$sourceName,
    [parameter(Mandatory=$false, HelpMessage="The source of the logging event. The default is the hostname of the node running the event")]
    [string]$sourcehost,
    [parameter(Mandatory=$false, HelpMessage="Enable JSON for JSON style formating submission of the Sumologic message header.")]
    [switch]$json,
    [parameter(Mandatory=$false, HelpMessage="Enable logfmt for logfmt style formating.")]
    [switch]$logfmt,
    [parameter(Mandatory=$false, HelpMessage="Not implemented. In a future release it will allow the submission of logfile attachment to Sumologics")]
    [string]$file,
    [parameter(Mandatory=$false, HelpMessage="The TEST switch flag will not submit any data but log everything to the concole")]
    [switch]$test,
    [parameter(Mandatory=$false, HelpMessage="The Logerrors switch will output to console in conjunction with the -verbose parameter")]
    [switch]$LogErrors
    )
    #checks
    $version = Get-Module -Name logasaurus
      foreach($item in $version){
        $moduleversions = $item.version
        $modulename = $item.name
        }
    $pstype = get-host
    $psversion = $pstype.version
    if($psversion -lt 6.0.0){
      $messageverbose = "PowerShell version is $psversion, setting working environment to legacy"
      write-debug "level=[debug] host='$sourcehost' time='$time' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"
      $pscheck = "legacy"
    }
    #default overrides

    if(!$json){
      if(!$logfmt){
        $logfmt = $true
      }
    }
    if(!$Aggregatekey){
      $Aggregatekey = "Get a key at SumoLogic"
    }
    if(!$AggregateUrl){
      $AggregateUrl = "https://endpoint1.collection.us2.sumologic.com/receiver/v1/http/$Aggregatekey"
    }
    if(!$loglevel){
      $loglevel = 'INFO'
    }
    $loglevel = $loglevel.toupper()
    if(!$sourcehost){
      $sourcehost = "$env:computername"
      if($env:SHELL -eq "/bin/bash"){

        try{
        $sourcehost = [System.Net.DNS]::GetHostByName('').HostName
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
            $messageverbose = "$formatstring -f $fields"
            write-warning "level=[error] host='$sourcehost' time='$time' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"

            } #end if
          } #end catch

          $messageverbose = "Detected unix based system"
          write-debug "level=[debug] host='$sourcehost' time='$time' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"
      }
    }
    if(!$sourceName){
      $sourceName = "NOTSET"
    }
    if(!$time){
      $time = get-date -uformat %s
    }
    if(!$recipe){
      $recipe = "$modulename v.'$moduleversions'"
    }
    if(!$sourceCategory){
      $sourceCategory = "NOTSET"
    }

    if($json){

      $subMessage = [pscustomobject]@{
        Loglevel = "$loglevel";
        ComputerName = "$sourcehost";
        Time = "$time";
        SourceName = "$sourceCategory";
        Recipe = "$recipe";
        number = "$number";
      }
      # $subfields = [pscustomobject]@{
      #   message = "$subMessage"
      # }
      $subSource = [PSCustomObject]@{
        sourceType = "HTTP";
        name = "$recipe";
        messagePerRequest = "false";
        multilineProcessingEnabled = "true";
        useAutolineMatching = "true";
        hostName = "$sourcehost";
        category = "$sourceCategory";

      }
      $fields = [PSCustomObject]@{
        'api.version' = "v1"
        source = $subSource
        message = $submessage
      }
      $body =  ConvertTo-Json -InputObject $fields
    }
    if($logfmt){
      #$Tab = [char]9
      $body = "level=$loglevel host='$sourcehost' time='$time' source='$sourceName' script='$recipe' msg='$message' number=$number"
    }
    $head = @{"X-Sumo-Host"="$sourcehost"
    "X-Sumo-Dimensions"="ComputerName,Time,LogLevel,Recipe,message"
    "X-Sumo-Category"="$sourceCategory"
    "X-Sumo-Name"="$sourceName"
    }


    If($test){

      $headformated = $head | convertto-json


      $settings = "==================parameters=============== `n
       AggregateUrl $AggregateUrl `n
       Aggregatekey: $Aggregatekey `n
       loglevel: $loglevel `n
       message: $message `n
       recipe: $recipe `n
       time: $time `n
       sourceCategory: $sourceCategory `n
       sourceName: $sourceName `n
       sourcehost: $sourcehost `n
       message json: $json `n
       message logfmt: $logfmt `n
       Sumologic headers: $headformated `n
       File: $file `n
       test: $test `n
       ================generated values=========== `n
       fields: $fields `n
       body: $body"

      Write-Output $settings

    }

    if( -not ($test)){
      $head = @{"X-Sumo-Host"="$sourcehost"
        "X-Sumo-Dimensions"="ComputerName,Time,LogLevel,Recipe,message"
        "X-Sumo-Category"="$sourceCategory"
        "X-Sumo-Name"="$sourceName"
      }
      if( -not ($logfmt)){
        $head = @{"X-Sumo-Host"="$sourcehost"
          "X-Sumo-Category"="$sourceCategory"
          "X-Sumo-Name"="$sourceName"
        }
      }

      if(!$file){
        if($pscheck -ne "legacy"){
          try{
            $messageverbose = "Sending nonLegacy invoke-restmethod body: $body"
            write-debug "level=[debug] host='$sourcehost' time='$time' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"
            $sendit = Invoke-RestMethod -Uri $AggregateUrl -Method "POST" -Body $body -Headers $head
            return $sendit
            write-verbose "Sendit: $sendit"
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
              $messageverbose = "$formatstring -f $fields"
              write-warning "level=[error] host='$sourcehost' time='$time' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"
                } #end if
            } #end catch
          } # end ps legacy
      } # end not file upload check

      if($file){
        try{
          $sendit = Invoke-RestMethod -Uri $AggregateUrl -Method "POST" -Body $body -Headers $head -infile $file
              return $sendit
              write-verbose "Sendit: $sendit"
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
             $messageverbose = "$formatstring -f $fields"
             write-warning "level=[error] host='$sourcehost' time='$time' source='$sourceName' script='$recipe' msg='$messageverbose' number=$number"
                  } #end if
              } #end catch

            }#end if
    }#end if test mode


  }

  Export-ModuleMember -Function send-sumo -Variable *