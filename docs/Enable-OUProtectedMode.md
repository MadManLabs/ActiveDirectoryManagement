---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Enable-OUProtectedMode
schema: 2.0.0
---

# Enable-OUProtectedMode

## SYNOPSIS
Turn on the protect object from accidental deletion bit

## SYNTAX

```
Enable-OUProtectedMode [-OU] <String> [<CommonParameters>]
```

## DESCRIPTION
This function will accept one or more ldap OU path's from the pipline and set its and its
childrens accidental deletetion bit to on.
It does this by setting the Delete and Deletetree
right to Deny for the group Everyone.

The end result is that you should see once this function runs, that the checkbox on the object
property page for the OU is checked for, protect this object from accidental deletion.

## EXAMPLES

### EXAMPLE 1
```
"LDAP://OU=Servers,DC=company,DC=com","OU=Workstations,DC=company,DC=com" |Enable-OUProtectedMode
```

Description
-----------
This example shows how to pass in multiple OU's on the pipeline.

### EXAMPLE 2
```
Get-ADOrganizationalUnit -SearchBase "ou=workstations,dc=copmany,dc=com" -Filter "*"
```

|Select-Object -ExpandProperty DistinguishedName |Enable-OUProtectedMode

Description
-----------
This example shows using a builtin AD Cmdlet to return all OU's from a specified SearchBase and
pass the result to Enable-OUProtectedMode.
The end result is that all of the provided OU's will
have their security set to prevent accidental deletion.

## PARAMETERS

### -OU
This is one or more paths in the form of LDAP://OU=Servers,DC=company,DC=com, if LDAP:// is not
specified in the path it is added, if it is sent in lowercase it is upper cased so the
function will work properly.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : Enable-OUProtectedMode
Created by   : jspatton
Date Coded   : 08/21/2013 14:17:46

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Enable-OUProtectedMode](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Enable-OUProtectedMode)

