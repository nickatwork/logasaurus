---
external help file: logasaurus-help.xml
Module Name: logasaurus
online version:
schema: 2.0.0
---

# send-email

## SYNOPSIS
Creates SMTP style message

## SYNTAX

```
send-email [-userNameEmail] <String> [[-mailuser] <String>] [-passwordEmail] <String> [-recipient] <String>
 [-body] <String> [[-cc] <String>] [-subject] <String> [[-transaction] <String>] [-SMTPhost] <String>
 [[-SMTPport] <Int32>] [-test] [-LogErrors] [<CommonParameters>]
```

## DESCRIPTION
Creates SMTP style message

## EXAMPLES

### Example 1
'''send-mail -recipient ad.rock@bb.com -subject "Gonna kick your root down" -cc "mike.d@bb.com,mixmaster.mike@neverrockfila.com" -body "Text stream"'''

## PARAMETERS

### -LogErrors
{{ Fill LogErrors Description }}

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

### -SMTPhost
SMTP host is necessary to send the message.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SMTPport
SMTP port is necessary to send the message.
Default is port 587

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -body
Email body is expected.
Think of the reader!
What is this email!

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

### -cc
{{ Fill cc Description }}

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

### -mailuser
Email sender, can be the same as userNameEmail is expected

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

### -passwordEmail
Email credentials are crucial.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -recipient
Email recipent is expected

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -subject
Email subject is expected.
Help the reader.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -test
{{ Fill test Description }}

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

### -transaction
{{ Fill transaction Description }}

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

### -userNameEmail
Email authenicator sender is required

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
