---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-NetlogonLog
schema: 2.0.0
---

# Get-NetlogonLog

## SYNOPSIS
Parse the netlogon.log file

## SYNTAX

```
Get-NetlogonLog [[-LogPath] <String>] [-DebugLog] [<CommonParameters>]
```

## DESCRIPTION
This function will read in the netlogon.log file and return a properly
formatted object.
A regex is used to split up each line of the file and
build fields for the returned output.

Some entries in the log will have an octal code, this code if found is
processed and a definition is returned as part of the object.

## EXAMPLES

### EXAMPLE 1
```
Get-NetlogonLog
```

Date  Time     Message         Computer        Address
----  ----     -------         --------        -------
10/13 15:08:30 NO_CLIENT_SITE: EBL2006         169.147.3.25
10/13 15:38:30 NO_CLIENT_SITE: EBL2006         169.147.3.25
10/13 16:08:30 NO_CLIENT_SITE: EBL2006         169.147.3.25

Description
-----------
This example shows the basic syntax of the command when parsing a regular
log file.

### EXAMPLE 2
```
Get-NetlogonLog -DebugLog
```

Date  Time     Type  Message
----  ----     ----  -------
11/08 12:23:01 LOGON HOME: NlPickDomainWithAccount: WORKGROUP\Administrator:...
11/08 12:23:01 LOGON HOME: SamLogon: Transitive Network logon of WORKGROUP\A...
11/08 12:23:01 LOGON HOME: SamLogon: Transitive Network logon of WORKGROUP\A...
11/08 12:23:01 LOGON HOME: NlPickDomainWithAccount: WORKGROUP\Administrator:...
11/08 12:23:01 LOGON HOME: SamLogon: Transitive Network logon of WORKGROUP\A...

Description
-----------
This example shows using the command with the DebugLog switch to parse
the debug version of the netlogon.log file.

## PARAMETERS

### -LogPath
The path to where netlogon.log can be found, this is set to the default
location

C:\Windows\Debug\netlogon.log

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: C:\Windows\Debug\netlogon.log
Accept pipeline input: False
Accept wildcard characters: False
```

### -DebugLog
This switch if present directs the script to parse the debug version of
the log as opposed to what normally shows up in the log.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : Get-NetlogonLog
Created by   : jspatton
Date Coded   : 11/08/2012 15:24:47

You will need to be at an elevated prompt in order for this to work properly.

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-NetlogonLog](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-NetlogonLog)

