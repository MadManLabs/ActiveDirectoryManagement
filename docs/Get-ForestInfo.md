---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ForestInfo
schema: 2.0.0
---

# Get-ForestInfo

## SYNOPSIS
Get basic information aobut the current forest.

## SYNTAX

```
Get-ForestInfo [[-TargetDomain] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get basic information about the current forest, or from an external domain
that you have rights to by setting TargetDomain to it's FQDN.

## EXAMPLES

### EXAMPLE 1
```
Get-ForestInfo
```

Name                  : company.com
Sites                 :
Domains               : {company.com}
GlobalCatalogs        : {dc1.company.com}
ApplicationPartitions : {DC=DomainDnsZones,DC=company,DC=com, DC=ForestDnsZones,DC=company,DC=com}
ForestMode            : Windows2003Forest
RootDomain            : company.com
Schema                : CN=Schema,CN=Configuration,DC=company,DC=com
SchemaRoleOwner       : dc1.company.com
NamingRoleOwner       : dc1.company.com

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
FunctionName : Get-ForestInfo
Created by   : jspatton
Date Coded   : 03/14/2012 15:56:29

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ForestInfo](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ForestInfo)

