---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/mod-posh/wiki/ActiveDirectoryManagement#Rename-Adobject
schema: 2.0.0
---

# Rename-Adobject

## SYNOPSIS
Rename an object in Active Directory

## SYNTAX

```
Rename-Adobject [[-Adobject] <Object>] [[-Name] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function will rename the object provided.
It updates the cn,
the sAMAccountName and the userPrincipalName to represent the passed
in Name parameter.

## EXAMPLES

### EXAMPLE 1
```
Rename-Adobject -Adobject $Adobject.Path -Name zomg
```

distinguishedName : {CN=zomg,OU=testing,DC=company,DC=com}
Path              : LDAP://cn=zomg,OU=testing,DC=company,DC=com

Description
-----------
This shows the basic syntax of this function

## PARAMETERS

### -Adobject
An LDAP path

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

### -Name
The new name

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
FunctionName : Rename-Adobject
Created by   : jspatton
Date Coded   : 01/06/2015 10:16:39

## RELATED LINKS

[https://github.com/jeffpatton1971/mod-posh/wiki/ActiveDirectoryManagement#Rename-Adobject](https://github.com/jeffpatton1971/mod-posh/wiki/ActiveDirectoryManagement#Rename-Adobject)

