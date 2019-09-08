---
external help file: logasaur-help.xml
Module Name: logasaur
online version: https://github.com/nickatwork/logasaurus
schema: 2.0.0
---

# set-logasaur

## SYNOPSIS
Set logging levels globally throughout Logasaurus
MIT License Copyright 2019, nickatwork.com

## SYNTAX

```
set-logasaur [[-loglevel] <String>] [-json] [-logfmt] [[-logfmtKeyPairs] <String>] [-test] [-LogErrors]
 [<CommonParameters>]
```

## DESCRIPTION
set-log changes the logging format and logging levels globally throughout the Logasaurus family.

## EXAMPLES

### EXAMPLE 1
```
set-log -loglevel 20 -logfmt
```

## PARAMETERS

### -loglevel
Logging Level, INFO or DEBUG.
Default is Informational

"NOTSET" = 0
"ERROR" = 5
"WARNING" =15
"INFO" = 20
"DEBUG" = 30

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

### -json
Switch to use json formatting globally

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

### -logfmt
Switch to simply log data as a series of one or more key/value pairs

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

### -logfmtKeyPairs
Location of configuration file for logfmt key/value pairs

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

### -test
{{Fill test Description}}

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

### -LogErrors
{{Fill LogErrors Description}}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/nickatwork/logasaurus](https://github.com/nickatwork/logasaurus)

