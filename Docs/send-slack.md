---
external help file: logasaurus-help.xml
Module Name: logasaurus
online version: https://github.com/nickatwork/logasaurus
schema: 2.0.0
---

# send-slack

## SYNOPSIS
Send a message to Slack
MIT License Copyright 2019, nickatwork.com

## SYNTAX

```
send-slack [-channel] <String> [[-iconemoji] <String>] [[-slackuser] <String>] [[-message] <String>]
 [-slackURI] <String> [[-logfmt] <String>] [[-payload] <String>] [[-timestamp] <String>] [-LogErrors]
 [[-ErrorLogs] <String>] [<CommonParameters>]
```

## DESCRIPTION
Sends message to Slack channel.

## EXAMPLES

### EXAMPLE 1
```
send-slack -channel "#WHATTHETRUCK" -
```

## PARAMETERS

### -channel
Enter valid Slack channel name, include #

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

### -iconemoji
{{Fill iconemoji Description}}

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

### -slackuser
{{Fill slackuser Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -message
{{Fill message Description}}

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

### -slackURI
Enter HTTPS Slack integration URL

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -logfmt
{{Fill logfmt Description}}

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

### -payload
{{Fill payload Description}}

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

### -timestamp
Timestamp variable to return

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

### -LogErrors
Logs errors to ./logs.log

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ErrorLogs
{{Fill ErrorLogs Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: ./log.log
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/nickatwork/logasaurus](https://github.com/nickatwork/logasaurus)

