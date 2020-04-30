---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-FSMORoleOwner.md#get-fsmoroleowner
schema: 2.0.0
---

# Get-FSMORoleOwner

## SYNOPSIS
Retrieves the list of FSMO role owners of a forest and domain

## SYNTAX

```
Get-FSMORoleOwner [[-TargetDomain] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves the list of FSMO role owners of a forest and domain

## EXAMPLES

### Example 1
```powershell
            Get-FSMORoleOwner

            DomainNamingMaster  : dc1.rivendell.com
            Domain              : rivendell.com
            RIDOwner            : dc1.rivendell.com
            Forest              : rivendell.com
            InfrastructureOwner : dc1.rivendell.com
            SchemaMaster        : dc1.rivendell.com
            PDCOwner            : dc1.rivendell.com

```

Description
-----------
Retrieves the FSMO role owners each domain in a forest. Also lists the domain and forest.

## PARAMETERS

### -TargetDomain
The FQDN of the domain to query on

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
[Get-FsmoRoleOwner](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-FSMORoleOwner.md#get-fsmoroleowner)