    ---
external help file: logasaur-help.xml
Module Name: logasaur
online version: https://github.com/nickatwork/logasaurus
schema: 2.0.0
---

# send-sumo

## SYNOPSIS
Send logasaur log to aggregate logging service.

## SYNTAX

```
send-sumo [[-AggregateUrl] <String>] [[-Aggregatekey] <String>] [[-loglevel] <String>] [[-number] <Int32>]
 [[-message] <String>] [[-recipe] <String>] [[-time] <String>] [[-sourceCategory] <String>]
 [[-sourceName] <String>] [[-sourcehost] <String>] [-json] [-logfmt] [[-file] <String>] [-test] [-LogErrors]
 [<CommonParameters>]
```

## DESCRIPTION

 Dumps JSON or single line message or file to Sumologic aggregate logging service

## EXAMPLES

### Example 1
```powershell
PS C:\> send-sumo -logfmt -message "$errordump" -loglevel info -aggregratekey "w8TNJtizSsYETc6kxLExYFL373Qo2XFUU6J
```

Sends a [logfmt style](https://www.brandur.org/logfmt) message to SumoLogic

### Example 2
```powershell
PS C:\> send-sumo -json -message "$errordump" -loglevel info -aggregratekey "w8TNJtizSsYETc6kxLExYFL373Qo2XFUU6J
```

Sends a [json]() message to SumoLogic

## PARAMETERS

### -AggregateUrl

SumoLogic HTTP URL target minus the Sumologic Key

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

The key after the default api v1 sumologic URL, **https://endpoint1.collection.us2.sumologic.com/receiver/v1/http/YOURKEY**

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogErrors
Logs errors to console

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
Not implemented yet - Sending a huge log dump + attaching a json or xml

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
  Formatting of information in sumologic as JSON

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: logfmt
Accept pipeline input: False
Accept wildcard characters: False
```

### -logfmt
  Formatting of information in sumologic as logfmt style. Simply a series of one or more key values.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: logfmt
Accept pipeline input: False
Accept wildcard characters: False
```

### -loglevel
    The logging level: NOTSET, DEBUG, INFO, WARNING, ERROR or any category. The default is NOTSET

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: NOTSET
Accept pipeline input: False
Accept wildcard characters: False
```

### -message
 Message contents for log

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -number
 Number for error message

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
 For logging, the recipe refers to the module name and version

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: module name + module version
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
 THe Sumologic sourceName see https://help.sumologic.com/03Send-Data/Sources/02Sources-for-Hosted-Collectors/HTTP-Source/Upload_Metrics_to_an_HTTP_Source

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

 Populated commonly by the hostname.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: HOSTNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### -test

 Submits no data, just a console output of all the parameters. Used in conjunction with the -verbose switch

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

Optional override to default unix style timestamp generated at time of http put script execution

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: get-date -uformat %s
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
