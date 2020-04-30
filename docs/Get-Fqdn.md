---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-Fqdn
schema: 2.0.0
---

# Get-Fqdn

## SYNOPSIS
A simple function to return the FQDN from a distinguishedName

## SYNTAX

```
Get-Fqdn [[-DistinguishedName] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function converts the distinguishedName into a proper
FQDN (Fully Qualified Domain Name).

## EXAMPLES

### EXAMPLE 1
```
Get-Fqdn -DistinguishedName 'DC=Company,DC=com'
```

Company.com

Description
-----------
This is the only syntax for this command.

## PARAMETERS

### -DistinguishedName
A proper dn, for example:
    DC=Company,DC=com

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: ([adsi]"").DistinguishedName
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : Get-Fqdn
Created by   : jspatton
Date Coded   : 06/29/2012 16:32:23

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-Fqdn](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-Fqdn)

