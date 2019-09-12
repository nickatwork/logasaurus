#curl -d "stat=user created&ezkey=me@nickatwork.com&count=1" http://api.stathat.com/ez
#json or ez


function send-stathat {
    <#
    .Synopsis
       Send StatHAT log to aggregate logging service.
       MIT License Copyright 2019, nickatwork.com
    
    .DESCRIPTION
    
        Dumps JSON or EZ message or file to StatHAT
    
    .PARAMETER statHatURLEZ
    
      StatHAT HTTP URL target minus the StatHAT Key

    .PARAMETER file
    
      Not implemented yet - Sending a huge log dump + attaching a json
    
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
    
   .PARAMETER sourcehost
    
      Option to override the hostname of host executing the http PUT
    
    .PARAMETER json
    
      Formatting of logging message in StatHAT as JSON
    
    .PARAMETER logfmt
    
      Formatting of logging message in StatHAT as logfmt style. Simply a series of one or more key values.
    
    .PARAMETER test
    
     Print Console output of parameters
    
    .PARAMETER logErrors
    
      Logs errors to console
    
    .EXAMPLE StatHAT logfmt message with debug level information
    
      send-StatHAT -logfmt -message "$errordump" -loglevel info -aggregratekey "w8TNJtizSsYETc6kxLExYFL373Qo2XFUU6Js"
    
    .EXAMPLE StatHAT json message with specificed StatHAT category and information log level informational
    
      send-StatHAT -json -message "$dinodump" -loglevel error -sourceCategory "prod/API/infrastructure.nickatwork.com"
    
    
    .Notes
    .LINK
    
    https://github.com/nickatwork/logasaurus
    
    #>
        [CmdletBinding()]
      param(
        [parameter(Mandatory=$false, HelpMessage="The URL To StatHAT's EZ API, http://api.stathat.com/ez")]
        [string]$statHatURLEZ,
        [parameter(Mandatory=$false, HelpMessage="The StatHat EZ key. Usually your user name")]
        [string]$statHatEzKey,
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
         [parameter(Mandatory=$false, HelpMessage="The source of the logging event. The default is the hostname of the node running the event")]
        [string]$sourcehost,
        [parameter(Mandatory=$false, HelpMessage="Enable JSON for JSON style formating submission of the StatHat message header.")]
        [switch]$json,
        [parameter(Mandatory=$false, HelpMessage="Enable logfmt for logfmt style formating.")]
        [switch]$logfmt,
        [parameter(Mandatory=$false, HelpMessage="Not implemented. In a future release it will allow the submission of logfile attachment to StatHat")]
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
        if(!$statHatURLEZ){
            $statHatURLEZ = "http://api.stathat.com/ez"
          }
        if($json){

            $subEZKey = [PSCustomObject]@{
                ezkey = $statHatEzKey;
            }
            $subData0 = [PSCustomObject]@{
                stat = Value

            }
                    # {
                    #     "ezkey": "XXXYYYZZZ",
                    #     "data": [
                    #         {"stat": "page view", "count": 2},
                    #         {"stat": "messages sent~total,female,europe", "count": 1},
                    #         {"stat": "request time~total,messages", "value": 23.094},
                    #         {"stat": "ws0: load average", "value": 0.732, "t": 1363118126},
                    #     ]
                    # }
            $fields = [PSCustomObject]@{
                ezkey = $subEZKey
                data = $subData0
                }
        }


        try {
            $sendit = Invoke-RestMethod -Uri $statHatURLEZ -Method "POST" -Body $body -Headers $head -infile $file
        }
        catch {

        }
    }

    Export-ModuleMember -Function send-stathat -Variable *