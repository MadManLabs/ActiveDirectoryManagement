---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-DomainInfo
schema: 2.0.0
---

# Get-DomainInfo

## SYNOPSIS
Get basic information about the current domain

## SYNTAX

```
Get-DomainInfo [[-TargetDomain] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get basic information about the current domain, or from an external domain
that you have rights to by setting TargetDomain to it's FQDN.

## EXAMPLES

### EXAMPLE 1
```
Get-DomainInfo
```

Forest                  : company.com
DomainControllers       : {dc1.company.com,dc2.company.com}
Children                : {}
DomainMode              : Windows2003Domain
Parent                  :
PdcRoleOwner            : dc1.company.com
RidRoleOwner            : dc1.company.com
InfrastructureRoleOwner : dc1.company.com
Name                    : company.com

Description
-----------
Show the basic syntax of the command.

## PARAMETERS

### -TargetDomain
The FQDN of the domain to return information from.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : Get-DomainInfo
Created by   : jspatton
Date Coded   : 03/14/2012 15:56:20

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-DomainInfo](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-DomainInfo)

