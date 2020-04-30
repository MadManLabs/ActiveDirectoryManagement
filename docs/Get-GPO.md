---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: http://scripts.patton-tech.com/wiki/PowerShell/ActiveDirectoryManagement#Get-GPO
schema: 2.0.0
---

# Get-GPO

## SYNOPSIS
Return a list of all GPO's in a domain.

## SYNTAX

```
Get-GPO [[-Domain] <String>] [[-GpoID] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function returns a list of all GPO's in the specified domain.

## EXAMPLES

### EXAMPLE 1
```
Get-GPO
```

DisplayName                 : Default Domain Policy
Path                        : cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=COM
ID                          : {31B2F340-016D-11D2-945F-00C04FB984F9}
DomainName                  : COMPANY.COM
CreationTime                : 9/1/2004 10:49:52 AM
ModificationTime            : 6/14/2011 10:21:20 AM
UserDSVersionNumber         : 33
ComputerDSVersionNumber     : 255
UserSysvolVersionNumber     : 33
ComputerSysvolVersionNumber : 255
Description                 :

Description
-----------
This example shows the basic syntax of the command.

### EXAMPLE 2
```
Get-GPO -Domain COMPANY.NET
```

DisplayName                 : Default Domain Policy
Path                        : cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=NET
ID                          : {31B2F340-016D-11D2-945F-00C04FB984F9}
DomainName                  : COMPANY.NET
CreationTime                : 9/1/2004 10:49:52 AM
ModificationTime            : 6/14/2011 10:21:20 AM
UserDSVersionNumber         : 33
ComputerDSVersionNumber     : 255
UserSysvolVersionNumber     : 33
ComputerSysvolVersionNumber : 255
Description                 :

Description
-----------
This example shows using the domain parameter to specify an alternate domain.

### EXAMPLE 3
```
Get-GPO -GpoID '31B2F340-016D-11D2-945F-00C04FB984F9'
```

DisplayName                 : Default Domain Policy
Path                        : cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=NET
ID                          : {31B2F340-016D-11D2-945F-00C04FB984F9}
DomainName                  : COMPANY.NET
CreationTime                : 9/1/2004 10:49:52 AM
ModificationTime            : 6/14/2011 10:21:20 AM
UserDSVersionNumber         : 33
ComputerDSVersionNumber     : 255
UserSysvolVersionNumber     : 33
ComputerSysvolVersionNumber : 255
Description                 :

Description
-----------
This example shows passing the GUID of a gpo into the function.

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

### -GpoID
The GUID of the GPO you are looking for.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : Get-GPO
Created by   : Jeff Patton
Date Coded   : 03/13/2012 18:37:08

You will need the Group Policy Managment console or RSAT installed.

## RELATED LINKS

[http://scripts.patton-tech.com/wiki/PowerShell/ActiveDirectoryManagement#Get-GPO](http://scripts.patton-tech.com/wiki/PowerShell/ActiveDirectoryManagement#Get-GPO)

[http://blogs.technet.com/b/grouppolicy/archive/2011/06/10/listing-all-gpos-in-the-current-forest.aspx](http://blogs.technet.com/b/grouppolicy/archive/2011/06/10/listing-all-gpos-in-the-current-forest.aspx)

[http://www.microsoft.com/download/en/search.aspx?q=gpmc](http://www.microsoft.com/download/en/search.aspx?q=gpmc)

[http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools](http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools)

