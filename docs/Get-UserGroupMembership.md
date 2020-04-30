---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-UserGroupMembership
schema: 2.0.0
---

# Get-UserGroupMembership

## SYNOPSIS
Get a list of groups as displayed on the user objects Member of tab

## SYNTAX

```
Get-UserGroupMembership [-UserDN] <Object> [<CommonParameters>]
```

## DESCRIPTION
This function returns a listing of groups that the user is a direct
member of.
This is the same list that should appear in the Member Of
tab in Active Directory Users and Computers.

## EXAMPLES

### EXAMPLE 1
```
Get-UserGroupMembership -UserDN "CN=useraccount,OU=employees,DC=company,DC=com"
```

GroupDN
-------
CN=AdminStaff,OU=Groups,DC=company,DC=com
CN=ServerAdmin,OU=Groups,DC=Company,DC=com

Description
-----------
This shows the basic syntax of a user in the local domain.

### EXAMPLE 2
```
Get-UserGroupMembership -UserDN "CN=S-1-5-17,CN=ForeignSecurityPrincipals,DC=company,DC=com"
```

GroupDN
-------
CN=IIS_IUSRS,CN=Builtin,DC=company,DC=com

Description
-----------
This function also works against FSP's in your domain.

## PARAMETERS

### -UserDN
The DistinguishedName of the user object

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
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
FunctionName : Get-UserGroupMembership
Created by   : Jeff Patton
Date Coded   : 09/22/2011 12:53:23

This script runs in the context of the user and as such the user
will need to have the requisite permissions to view the group membership
of a given user object.

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-UserGroupMembership](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-UserGroupMembership)

