---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-AdObject
schema: 2.0.0
---

# Get-AdObject

## SYNOPSIS
Returns a list of objects from ActiveDirectory

## SYNTAX

```
Get-AdObject [[-ADSPath] <String>] [[-SearchFilter] <String>] [[-SearchScope] <String>]
 [[-ADProperties] <Array>] [[-CacheResults] <Boolean>] [[-Tombstone] <Boolean>] [[-Credential] <PSCredential>]
 [[-DirSync] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function will return a list of objects from ActiveDirectory.
It will start at the provided ADSPath
and find each object that matches the provided SearchFilter.
For each object returned only the
specified properties will be provided.

## EXAMPLES

### EXAMPLE 1
```
Get-AdObject -ADSPath "LDAP://OU=Workstations,DC=company,DC=com"
```

Path                                                                  Properties
----                                                                  ----------
LDAP://CN=Computer-pc01,OU=Workstations,DC=company,DC=com             {name, adspath}
LDAP://CN=Computer-pc02,OU=Workstations,DC=company,DC=com             {name, adspath}
LDAP://CN=Computer-pc03,OU=Workstations,DC=company,DC=com             {name, adspath}
LDAP://CN=Computer-pc04,OU=Workstations,DC=company,DC=com             {name, adspath}

Description
-----------
When specifying just the ADSPath computer objects and their associated name properties are returned
by default.

### EXAMPLE 2
```
Get-AdObject -ADSPath "LDAP://OU=Workstations,DC=company,DC=com" `
```

-ADProperties "name","distinguishedName"

Path                                                                  Properties
----                                                                  ----------
LDAP://CN=Computer-pc01,OU=Workstations,DC=company,DC=com             {name, adspath, distinguishedname}
LDAP://CN=Computer-pc02,OU=Workstations,DC=company,DC=com             {name, adspath, distinguishedname}
LDAP://CN=Computer-pc03,OU=Workstations,DC=company,DC=com             {name, adspath, distinguishedname}
LDAP://CN=Computer-pc04,OU=Workstations,DC=company,DC=com             {name, adspath, distinguishedname}

Description
-----------
This example shows the format for ADProperties, each property is composed of a string enclosed in quotes
seperated by commas.

### EXAMPLE 3
```
Get-AdObject -ADSPath "LDAP://OU=Groups,DC=company,DC=com" `
```

-ADProperties "name","distinguishedName" -SearchFilter group

Path                                                                  Properties
----                                                                  ----------
LDAP://CN=Group-01,OU=Groups,DC=Company,DC=com                        {name, adspath, distinguishedname}
LDAP://CN=Group-02,OU=Groups,DC=Company,DC=com                        {name, adspath, distinguishedname}
LDAP://CN=Group-03,OU=Groups,DC=Company,DC=com                        {name, adspath, distinguishedname}
LDAP://CN=Group-04,OU=Groups,DC=Company,DC=com                        {name, adspath, distinguishedname}

Description
-----------
This example shows multiple properties as well as setting the SearchFilter to be groups that are
returned.

## PARAMETERS

### -ADSPath
This is the LDAP URI of the location within ActiveDirectory you would like to search.
This can be an
OU, CN or even the root of your domain.

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

### -SearchFilter
This parameter is specified in the same format as an LDAP Search Filter.
For more information on the
format please visit Microsoft (http://msdn.microsoft.com/en-us/library/aa746475.aspx).
If nothing is
specified on the command-line the default filter is used:
    (objectCategory=computer)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (objectCategory=computer)
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchScope
{{ Fill SearchScope Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Subtree
Accept pipeline input: False
Accept wildcard characters: False
```

### -ADProperties
If you want specific properties returned like name, or distinguishedName
provide a comma seperated list.

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CacheResults
{{ Fill CacheResults Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tombstone
{{ Fill Tombstone Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
{{ Fill Credential Description }}

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DirSync
{{ Fill DirSync Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
The script runs under the users context, so the user account must have permissions
to view the objects within the domain that the function is currently running
against.

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-AdObject](https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-AdObject)

