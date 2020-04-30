---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Set-AdObjectProperty.md#set-adobjectproperty
schema: 2.0.0
---

# Set-AdObjectProperty

## SYNOPSIS
Set the properties of a given object in AD

## SYNTAX

```
Set-AdObjectProperty [[-ADObject] <Object>] [[-PropertyPairs] <Object>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This function will set the properties of a given object in AD. The function
takes a comma seperated Propertyname, PropertyValue and sets the value of that
property on the object.

## EXAMPLES

### EXAMPLE 1
```powershell
Set-AdObjectProperty -ADObject 'LDAP://CN=UserAccount,CN=Users,DC=company,DC=com' -PropertyPairs "Description,New User Account"
```

Description
-----------
This is the basic syntax of this function.

## PARAMETERS

### -ADObject
The object within AD to be modified

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PropertyPairs
The PropertyName and PropertyValue to be set. This can be an array of values as
such:
    "Description,UserAccount","Office,Building 1"
The PropertyName should always be listed first, followed by the values of the
property.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
FunctionName : Set-AdObjectProperty
Created by   : Jeff Patton
Date Coded   : 09/23/2011 14:27:19

## RELATED LINKS

[Set-AdObjectProperty](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Set-AdObjectProperty.md#set-adobjectproperty)

