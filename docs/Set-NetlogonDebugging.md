---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-NetlogonDebugging
schema: 2.0.0
---

# Set-NetlogonDebugging

## SYNOPSIS
This function enables/disables debugging on the netlogon service

## SYNTAX

```
Set-NetlogonDebugging [-Enable] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function enables/disables debugging on the netlogon service when passed the
Enable switch.
When not present this has the effect of turning off debugging.

Please see the support article under the related links section.

## EXAMPLES

### EXAMPLE 1
```
Set-NetlogonDebugging -Enable
```

Description
-----------
This example shows how to turn on debugging.

### EXAMPLE 2
```
Set-NetlogonDebugging
```

Description
-----------
This example shows how to turn off debugging.

## PARAMETERS

### -Enable
This parameter if present will enable debugging.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
FunctionName : Set-NetlogonDebugging
Created by   : jspatton
Date Coded   : 11/08/2012 15:51:51

You may need to run this from an elevated prompt.

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-NetlogonDebugging](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-NetlogonDebugging)

[http://support.microsoft.com/kb/109626](http://support.microsoft.com/kb/109626)

