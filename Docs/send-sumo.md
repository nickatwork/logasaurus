---
external help file: logasaurus-help.xml
Module Name: logasaurus
online version: https://github.com/nickatwork/logasaurus
schema: 2.0.0
---

# send-sumo

## SYNOPSIS
Send logasaur log to aggregate logging service.



## SYNTAX

```
send-sumo [[-AggregateUrl] <String>] [-Aggregatekey] <String> [[-loglevel] <String>] [[-number] <Int32>]
 [-message] <String> [[-recipe] <String>] [[-time] <String>] [[-sourceCategory] <String>]
 [[-sourceName] <String>] [[-sourcehost] <String>] [-json] [-logfmt] [[-file] <String>] [-test] [-LogErrors]
 [<CommonParameters>]
```

## DESCRIPTION
Dumps JSON or single line message, in logfmt styel, or file to Sumologic aggregate logging service

## EXAMPLES

### Example 1
```PS C:\> send-sumo -logfmt -message "$errordump" -loglevel info -aggregratekey "w8TNJtizSsYETc6kxLExYFL373Qo2XFUU6J

```

### Example 2
```PS C:\> send-sumo -json -message "$errordump" -loglevel info -aggregratekey "w8TNJtizSsYETc6kxLExYFL373Qo2XFUU6J
```

## PARAMETERS

### -AggregateUrl
The URL To SumoLogic's v1 API, https://endpoint1.collection.us2.sumologic.com/receiver/v1/http

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Aggregatekey
Your SumoLogic's API key to submit an HTTP log entry

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogErrors
The Logerrors switch will output to console in conjunction with the -verbose parameter

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -file
Not implemented.
In a future release it will allow the submission of logfile attachment to Sumologics

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -json
Enable JSON for JSON style formating submission of the Sumologic message header.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -logfmt
Enable logfmt for logfmt style formating.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -loglevel
Your logging level, examples: DEBUG ,INFO, WARNING, or ERROR.
The default is INFO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -message
Your error message.
Fill it up as necesary

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -number
Your error log or eventid number.
Must be an integer

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -recipe
Recipe is an additional filter option for logging.
The default is the name of the module and version

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -sourceCategory
The sumologic sourceCategory see https://help.sumologic.com/03Send-Data/Sources/02Sources-for-Hosted-Collectors/HTTP-Source/Upload_Metrics_to_an_HTTP_Source

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -sourceName
Sumologic sourceName see https://help.sumologic.com/03Send-Data/Sources/02Sources-for-Hosted-Collectors/HTTP-Source/Upload_Metrics_to_an_HTTP_Source

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -sourcehost
The source of the logging event.
The default is the hostname of the node running the event

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -test
The TEST switch flag will not submit any data but log everything to the concole

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -time
The timestamp of the logging event.
The Default is in Unix time

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
