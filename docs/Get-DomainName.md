---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-DomainName.md#get-domainname
schema: 2.0.0
---

# Get-DomainName

## SYNOPSIS
Get the FQDN of the domain from an LDAP Url

## SYNTAX

```
Get-DomainName [[-LdapUrl] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function returns the FQDN of a domain based on the LDAP Url.

## EXAMPLES

### EXAMPLE 1
```powershell
Get-DomainName -LdapUrl 'LDAP://CN=UserAccount,OU=Employees,DC=company,DC=com'

LdapUrl    : LDAP://CN=UserAccount,OU=Employees,DC=company,DC=com
DomainName : company.com
```

Description
-----------
This example shows the basic syntax of the commnand.

## PARAMETERS

### -LdapUrl
The LDAP URL for whatever object you need the FQDN for.

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
FunctionName : Get-DomainName
Created by   : Jeff Patton
Date Coded   : 09/22/2011 09:42:38

## RELATED LINKS

[Get-DomainName](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-DomainName.md#get-domainname)

