---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-AdGroupMember
schema: 2.0.0
---

# Get-AdGroupMember

## SYNOPSIS
Return a collection of users in an ActiveDirectory group.

## SYNTAX

```
Get-AdGroupMember [[-UserGroup] <String>] [[-ADSPath] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function returns an object that contains all the properties of a user object.
This function
works for small groups as well as groups in excess of 1000.

## EXAMPLES

### EXAMPLE 1
```
Get-AdGroupMember -UserGroup Managers |Format-Table -Property name, distinguishedName, cn
```

name                             distinguishedName                cn
----                             -----------------                --
{Steve Roberts}                  {CN=Steve Roberts,CN=Users,DC...
{Steve Roberts}
{S-1-5-21-57989841-1078081533...
{CN=S-1-5-21-57989841-1078081...
{S-1-5-21-57989841-1078081533...
{S-1-5-21-57989841-1078081533...
{CN=S-1-5-21-57989841-1078081...
{S-1-5-21-57989841-1078081533...
{Matt Temple}                    {CN=Matt Temple,CN=Users,DC=c...
{Matt Temple}
...
Description
-----------
This example shows passing in a group name, but leaving the default domain name in place.

## PARAMETERS

### -UserGroup
The name of the group to get membership from.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Managers
Accept pipeline input: False
Accept wildcard characters: False
```

### -ADSPath
The LDAP URL of the domain that the group resides in.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (([ADSI]"").distinguishedName)
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Object[]
## NOTES
The context under which this script is run must have rights to pull infromation from ActiveDirectory.

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-AdGroupMember](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-AdGroupMember)

