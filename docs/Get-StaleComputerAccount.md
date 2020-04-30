---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-StaleComputerAccount
schema: 2.0.0
---

# Get-StaleComputerAccount

## SYNOPSIS
Return a collection of computer accounts older than a set number of days.

## SYNTAX

```
Get-StaleComputerAccount [[-ADSPath] <String>] [[-DayOffset] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function can be used to get a list of computer accounts within your Active Directory
that are older than a certain number of days.
Typically a computer account will renew it's
own password every 90 days, so any account where the 'whenChanged' attribute is older than
90 would be considered old.

## EXAMPLES

### EXAMPLE 1
```
Get-StaleComputerAccount -ADSPath "LDAP://DC=company,DC=com" -DayOffset 90
```

name                             adspath                          whenchanged
----                             -------                          -----------
{desktop1}                       {LDAP://CN=desktop1,OU=Sales ...
{11/17/2010 9:19:01 AM}
{workstation}                    {LDAP://CN=workstation,OU=Ser...
{2/10/2011 7:05:28 PM}
{computer09}                     {LDAP://CN=computer09,OU=Admi...
{10/25/2010 3:40:32 PM}
{workstation01}                  {LDAP://CN=workstation01,OU=S...
{6/2/2010 4:29:08 PM}

Description
-----------
This is the typical usage from the command-line as well as sample output.

## PARAMETERS

### -ADSPath
This is an LDAP url that will become the base of your search.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: (([ADSI]"").distinguishedName)
Accept pipeline input: False
Accept wildcard characters: False
```

### -DayOffset
Am integer that represents the number of days in which an account is considered stale.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 90
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
90 is a default value, when run in production you should use the number of days that you
consider an account to be stale.
The If statement that checks if adsPath contains OU=Servers is specifically for our production
environment.
All "servers", regardless of OS, are placed in the Servers OU in their respective
hierarchy.
I treat server accounts slightly differently than I do workstations accounts, so I
wanted a way to differentiate the two.

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-StaleComputerAccount](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-StaleComputerAccount)

