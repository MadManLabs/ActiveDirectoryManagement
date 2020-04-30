---
external help file: ActiveDirectoryManagement-help.xml
Module Name: ActiveDirectoryManagement
online version: https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/ConvertTo-Rfc1779.md#convertto-rfc1779
schema: 2.0.0
---

# ConvertTo-Rfc1779

## SYNOPSIS
Convert a name to a DN following RFC1779

## SYNTAX

```
ConvertTo-Rfc1779 [-Name] <String> [[-InitType] <Int32>] [[-ConnectionObject] <String>] [<CommonParameters>]
```

## DESCRIPTION
Convert a name to a DN following RFC1779

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ConnectionObject
adsPath for the Domain

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InitType
{{ Fill InitType Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:
Accepted values: 1, 2, 3

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
{{ Fill Name Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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
    FunctionName : ConvertTo-Rfc1779
    Created by   : jspatton
    Date Coded   : 07/24/2012 16:06:10
## RELATED LINKS
[ConvertTo-Rfc1779](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/ConvertTo-Rfc1779.md#convertto-rfc1779)

[rfc1779](https://tools.ietf.org/html/rfc1779)

[IADsNameTranslate](https://docs.microsoft.com/en-us/windows/win32/api/iads/nf-iads-iadsnametranslate-init?redirectedfrom=MSDN)

[ADS_NAME_TYPE_ENUM](https://docs.microsoft.com/en-us/windows/win32/api/iads/ne-iads-ads_name_type_enum?redirectedfrom=MSDN)