---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Sid
schema: 2.0.0
---

# ConvertTo-Sid

## SYNOPSIS
Convert a string Sid back to a byte array

## SYNTAX

```
ConvertTo-Sid [[-StringSid] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function takes the Sid as a string and converts it back to a byte array
that can be used by other functions which may be looking for the Sid as
a byte.

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-Sid -StringSid S-1-5-21-57989841-1078081533-682003330
```

BinaryLength AccountDomainSid                       Value
------------ ----------------                       -----
          28 S-1-5-21-57989841-1078081533-682003330 S-1-5-21-57989841-1078081533-682003330-233119

Description
-----------

## PARAMETERS

### -StringSid
A string representation of a Sid object, for example:

    S-1-5-21-57989841-1078081533-682003330

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : ConvertTo-Sid
Created by   : jspatton
Date Coded   : 06/26/2012 09:41:06

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Sid](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Sid)

