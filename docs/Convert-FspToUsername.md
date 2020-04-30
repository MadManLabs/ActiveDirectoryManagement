---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Convert-FspToUsername.md#convert-fsptousername
schema: 2.0.0
---

# Convert-FspToUsername

## SYNOPSIS
Convert a FSP to a sAMAccountName

## SYNTAX

```
Convert-FspToUsername [-UserSID] <Object> [<CommonParameters>]
```

## DESCRIPTION
This function converts FSP's to sAMAccountName's.

## EXAMPLES

### EXAMPLE 1
```powershell
Convert-FspToUsername -UserSID "S-1-5-11","S-1-5-17","S-1-5-20"

sAMAccountName                      Sid
--------------                      ---
NT AUTHORITY\Authenticated Users    S-1-5-11
NT AUTHORITY\IUSR                   S-1-5-17
NT AUTHORITY\NETWORK SERVICE        S-1-5-20
```

Description
===========
This example shows passing in multipe sids to the function

### EXAMPLE 2
```powershell
Get-AdObject -ADSPath "LDAP://CN=ForeignSecurityPrincipals,DC=company,DC=com" -SearchFilter "(objectClass=foreignSecurityPrincipal)"`
 | foreach {$_.Properties.name} |Convert-FspToUsername

sAMAccountName                      Sid
--------------                      ---
NT AUTHORITY\Authenticated Users    S-1-5-11
NT AUTHORITY\IUSR                   S-1-5-17
NT AUTHORITY\NETWORK SERVICE        S-1-5-20
```

Description
===========
This example takes the output of the Get-AdObject function, and pipes it through foreach to get to the name
property, and the resulting output is piped through Convert-FspToUsername.

## PARAMETERS

### -UserSID
This is the SID of the FSP in the form of S-1-5-20. These can be found in the
ForeignSecurityPrincipals container of your domain.

```yaml
Type: Object
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
This function currently expects a SID in the same format as you see being
displayed as the name property of each object in the ForeignSecurityPrincipals
container in your domain.

## RELATED LINKS

[Convert-FspToUsername](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Convert-FspToUsername.md#convert-fsptousername)

