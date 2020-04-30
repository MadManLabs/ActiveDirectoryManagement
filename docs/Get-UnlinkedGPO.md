---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-UnlinkedGPO.md#get-unlinkedgpo
schema: 2.0.0
---

# Get-UnlinkedGPO

## SYNOPSIS
Return a list of unlinked Group Policy Objects

## SYNTAX

```
Get-UnlinkedGPO [[-Domain] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function will return a list of unlinked Group Policy Objects from
the specified domain.

## EXAMPLES

### EXAMPLE 1
```powershell
Get-UnlinkedGPO

DisplayName                 : No Offline Files GPO
Path                        : cn={7BE5802A-3A76-411E-B685-C2DE9A8DE8B9},cn=policies,cn=system,DC=COMPANY,DC=COM
ID                          : {7BE5802A-3A76-411E-B685-C2DE9A8DE8B9}
DomainName                  : COMPANY.COM
CreationTime                : 11/2/2005 11:06:34 AM
ModificationTime            : 6/14/2011 10:21:38 AM
UserDSVersionNumber         : 0
ComputerDSVersionNumber     : 14
UserSysvolVersionNumber     : 0
ComputerSysvolVersionNumber : 14
Description                 :
```

Description
-----------
This shows the basic syntax of the command.

### EXAMPLE 2
```powershell
Get-UnlinkedGPO -Domain COMPANY.NET

DisplayName                 : PartialPath
Path                        : cn={D074F8A6-CA41-464F-96A6-9155C96B486B},cn=policies,cn=system,DC=COMPANY,DC=NET
ID                          : {D074F8A6-CA41-464F-96A6-9155C96B486B}
DomainName                  : COMPANY.NET
CreationTime                : 1/11/2010 11:11:14 AM
ModificationTime            : 6/14/2011 10:21:40 AM
UserDSVersionNumber         : 0
ComputerDSVersionNumber     : 4
UserSysvolVersionNumber     : 0
ComputerSysvolVersionNumber : 4
Description                 :
```

Description
-----------
This example shows using the domain parameter to specify an alternate domain.

## PARAMETERS

### -Domain
The FQDN of the domain to search

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
FunctionName : Get-UnlinkedGPO
Created by   : Jeff Patton
Date Coded   : 03/13/2012 18:54:38

You will need the Group Policy Management Console or RSAT installed

## RELATED LINKS

[Get-UnlinkedGPO](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-UnlinkedGPO.md#get-unlinkedgpo)

[Listing GPOs in Forest](http://blogs.technet.com/b/grouppolicy/archive/2011/06/10/listing-all-gpos-in-the-current-forest.aspx)

[GPMC](http://www.microsoft.com/download/en/search.aspx?q=gpmc)

[RSAT](http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools)

