---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Reset-ComputerAccount
schema: 2.0.0
---

# Reset-ComputerAccount

## SYNOPSIS
Reset computer account password

## SYNTAX

```
Reset-ComputerAccount [-ADSPath] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function will reset the computer account password for a single computer
or for an OU of computers.

## EXAMPLES

### EXAMPLE 1
```
Reset-ComputerAccount -ADSPath "LDAP://CN=Desktop-PC01,OU=Workstations,DC=company,DC=com"
```

Description
-----------
Example usage showing single computer account reset.

## PARAMETERS

### -ADSPath
The ADSPath of the computer account, or containing OU.

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

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Reset-ComputerAccount](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Reset-ComputerAccount)

