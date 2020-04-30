---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Set-AccountDisabled.md#set-accountdisabled
schema: 2.0.0
---

# Set-AccountDisabled

## SYNOPSIS
Disable an account object in Active Directory

## SYNTAX

```
Set-AccountDisabled [-ADSPath] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function will disable an object in Active Directory, regardless of whether the object
is a user or computer.

## EXAMPLES

### EXAMPLE 1
```
Set-AccountDisabled -ADSPath "LDAP://CN=Desktop-01,OU=Workstations,DC=Company,DC=com"
```

## PARAMETERS

### -ADSPath
The full LDAP URI of the object to disable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
The context under which this function is run needs to have rights to modify the
object in Active Directory.
The error I catch is specifically an Access is Denied message.

## RELATED LINKS

[Set-AccountDisabled](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Set-AccountDisabled.md#set-accountdisabled)

