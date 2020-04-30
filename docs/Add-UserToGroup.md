---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-UserToGroup
schema: 2.0.0
---

# Add-UserToGroup

## SYNOPSIS
Add a domain user to a domain group

## SYNTAX

```
Add-UserToGroup [[-GroupDN] <Object>] [[-UserDN] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function adds a domain user account to a domain group.

## EXAMPLES

### EXAMPLE 1
```
Add-UserToGroup -GroupDN 'CN=AdminStaff,OU=Groups,DC=company,DC=com' -UserDN 'CN=UserAccount,OU=Employees,DC=company,DC=com'
```

GroupDN : LDAP://CN=AdminStaff,OU=Groups,DC=company,DC=com
UserDN  : LDAP://CN=UserAccount,OU=Employees,DC=company,DC=com
Added   : True

Description
-----------
This example shows the syntax of the command.

## PARAMETERS

### -GroupDN
The distinguishedName of the group to add to

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

### -UserDN
The distinguishedName of the user account to add

```yaml
Type: Object
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
FunctionName : Add-UserToGroup
Created by   : Jeff Patton
Date Coded   : 09/22/2011 14:18:33

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-UserToGroup](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-UserToGroup)

