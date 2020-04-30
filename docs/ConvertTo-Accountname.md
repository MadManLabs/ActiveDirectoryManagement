---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/ConvertTo-Accountname.md#convertto-accountname
schema: 2.0.0
---

# ConvertTo-Accountname

## SYNOPSIS
Return the accountname from the SID

## SYNTAX

```
ConvertTo-Accountname [[-ObjectSid] <IdentityReference>] [<CommonParameters>]
```

## DESCRIPTION
This function returns the accountname from the underlying SID of an object
in Active Directory.

## EXAMPLES

### EXAMPLE 1
```powershell
ConvertTo-Accountname -ObjectSID (ConvertFrom-Sid -ObjectSid $me.objectsid)

Value
-----
HOME\jspatton
```

Description
-----------
This example shows how to use the function to convert a security principal object
to the underlying account name.

## PARAMETERS

### -ObjectSid
This needs to ne a security principal object

```yaml
Type: IdentityReference
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
FunctionName : ConvertTo-Accountname
Created by   : jspatton
Date Coded   : 06/26/2012 14:24:49

## RELATED LINKS

[ConvertTo-Accountname](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/ConvertTo-Accountname.md#convertto-accountname)

