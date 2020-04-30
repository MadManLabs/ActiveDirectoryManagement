---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/ConvertFrom-Sid.md#convertfrom-sid
schema: 2.0.0
---

# ConvertFrom-Sid

## SYNOPSIS
Convert a Sid byte array to a string

## SYNTAX

```
ConvertFrom-Sid [[-ObjectSid] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function takes the Sid as a byte array and returns it as an
object that has the Sid as a string.

## EXAMPLES

### EXAMPLE 1
```powershell
ConvertFrom-Sid -ObjectSid $Sid

BinaryLength AccountDomainSid                       Value
------------ ----------------                       -----
          28 S-1-5-21-57989841-1078081533-682003330 S-1-5-21-57989841-1078081533-682003330-159172
```

Description
-----------
This is the basic syntax of the command and shows the default output.

### EXAMPLE 2
```powershell
(ConvertFrom-Sid -ObjectSid $Computer.objectSid).Value

S-1-5-21-57989841-1078081533-682003330-159172
```

Description
-----------
This example shows how to display just the Sid as a string.

## PARAMETERS

### -ObjectSid
This is a Sid object, these are usually stored in a binary form inside the
object in Active Directory. When displayed they typically appear to be a column
of numbers like this:

    1
    5
    0
    0
    0
    0
    0
    5
    21
    0
    0
    0
    209
    218
    116
    3
    253
    55
    66
    64
    130
    139
    166
    40
    196
    109
    2
    0
    0
This is converted to an object of type System.Security.Principal.IdentityReference.

```yaml
Type: Object
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
FunctionName : ConvertFrom-Sid
Created by   : jspatton
Date Coded   : 06/26/2012 09:41:02

## RELATED LINKS

[ConvertFrom-Sid](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/ConvertFrom-Sid.md#convertfrom-sid)

