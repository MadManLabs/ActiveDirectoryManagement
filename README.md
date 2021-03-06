[![GitHub issues](https://img.shields.io/github/issues/jeffpatton1971/ActiveDirectoryManagement)](https://github.com/jeffpatton1971/ActiveDirectoryManagement/issues)
[![GitHub forks](https://img.shields.io/github/forks/jeffpatton1971/ActiveDirectoryManagement)](https://github.com/jeffpatton1971/ActiveDirectoryManagement/network)
[![GitHub license](https://img.shields.io/github/license/jeffpatton1971/ActiveDirectoryManagement)](https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/master/LICENSE)
## [Set-AccountDisabled](docs/Set-AccountDisabled.md)
```

NAME
    Set-AccountDisabled
    
SYNOPSIS
    Disable an account object in Active Directory
    
    
SYNTAX
    Set-AccountDisabled [-ADSPath] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function will disable an object in Active Directory, regardless of whether the object
    is a user or computer.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-AccountDisabled

REMARKS
    To see the examples, type: "get-help Set-AccountDisabled -examples".
    For more information, type: "get-help Set-AccountDisabled -detailed".
    For technical information, type: "get-help Set-AccountDisabled -full".
    For online help, type: "get-help Set-AccountDisabled -online"
```
## [ConvertTo-Accountname](docs/ConvertTo-Accountname.md)
```
NAME
    ConvertTo-Accountname
    
SYNOPSIS
    Return the accountname from the SID
    
    
SYNTAX
    ConvertTo-Accountname [[-ObjectSid] <IdentityReference>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns the accountname from the underlying SID of an object
    in Active Directory.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Accountname

REMARKS
    To see the examples, type: "get-help ConvertTo-Accountname -examples".
    For more information, type: "get-help ConvertTo-Accountname -detailed".
    For technical information, type: "get-help ConvertTo-Accountname -full".
    For online help, type: "get-help ConvertTo-Accountname -online"
```
## [Get-ADGroupMembers](docs/Get-ADGroupMembers.md)
```
NAME
    Get-ADGroupMembers
    
SYNOPSIS
    Return a collection of users in an ActiveDirectory group.
    
    
SYNTAX
    Get-ADGroupMembers [[-UserGroup] <String>] [[-ADSPath] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns an object that contains all the properties of a user object. This function
    works for small groups as well as groups in excess of 1000.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ADGroupMembers

REMARKS
    To see the examples, type: "get-help Get-ADGroupMembers -examples".
    For more information, type: "get-help Get-ADGroupMembers -detailed".
    For technical information, type: "get-help Get-ADGroupMembers -full".
    For online help, type: "get-help Get-ADGroupMembers -online"
```
## [Rename-Adobject](docs/Rename-Adobject.md)
```
NAME
    Rename-Adobject
    
SYNOPSIS
    Rename an object in Active Directory
    
    
SYNTAX
    Rename-Adobject [[-Adobject] <Object>] [[-Name] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will rename the object provided. It updates the cn,
    the sAMAccountName and the userPrincipalName to represent the passed
    in Name parameter.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/ActiveDirectoryManagement#Rename-Adobject

REMARKS
    To see the examples, type: "get-help Rename-Adobject -examples".
    For more information, type: "get-help Rename-Adobject -detailed".
    For technical information, type: "get-help Rename-Adobject -full".
    For online help, type: "get-help Rename-Adobject -online"
```
## [Set-ADObjectProperties](docs/Set-ADObjectProperties.md)
```
NAME
    Set-ADObjectProperties
    
SYNOPSIS
    Set the properties of a given object in AD
    
    
SYNTAX
    Set-ADObjectProperties [[-ADObject] <Object>] [[-PropertyPairs] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will set the properties of a given object in AD. The
    function takes a comma seperated Propertyname, PropertyValue and sets
    the value of that property on the object.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-ADObjectProperties

REMARKS
    To see the examples, type: "get-help Set-ADObjectProperties -examples".
    For more information, type: "get-help Set-ADObjectProperties -detailed".
    For technical information, type: "get-help Set-ADObjectProperties -full".
    For online help, type: "get-help Set-ADObjectProperties -online"
```
## [Get-ADObjects](docs/Get-ADObjects.md)
```
NAME
    Get-ADObjects
    
SYNOPSIS
    Returns a list of objects from ActiveDirectory
    
    
SYNTAX
    Get-ADObjects [[-ADSPath] <String>] [[-SearchFilter] <String>] [[-SearchScope] <String>] [[-ADProperties] <Array>] [[-CacheResults] <Boolean>] [[-Tombstone] <Boolean>] [[-Credential] <PSCredential>] [[-DirSync] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will return a list of objects from ActiveDirectory. It will start at the provided ADSPath 
    and find each object that matches the provided SearchFilter. For each object returned only the 
    specified properties will be provided.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ADObjects

REMARKS
    To see the examples, type: "get-help Get-ADObjects -examples".
    For more information, type: "get-help Get-ADObjects -detailed".
    For technical information, type: "get-help Get-ADObjects -full".
    For online help, type: "get-help Get-ADObjects -online"
```
## [ConvertTo-Canonical](docs/ConvertTo-Canonical.md)
```

CommonParameters         : True
WorkflowCommonParameters : False
details                  : @{name=ConvertTo-Canonical; noun=; verb=}
Syntax                   : @{syntaxItem=System.Object[]}
parameters               : @{parameter=System.Object[]}
inputTypes               : @{inputType=}
returnValues             : @{returnValue=}
aliases                  : None
                           
remarks                  : None
alertSet                 : 
description              : 
examples                 : 
Synopsis                 : 
                           ConvertTo-Canonical [-Name] <string> [[-InitType] <int>] [[-ConnectionObject] <string>] [<CommonParameters>]
                           
ModuleName               : ActiveDirectoryManagement
nonTerminatingErrors     : 
xmlns:command            : http://schemas.microsoft.com/maml/dev/command/2004/10
xmlns:dev                : http://schemas.microsoft.com/maml/dev/2004/10
xmlns:maml               : http://schemas.microsoft.com/maml/2004/10
Name                     : ConvertTo-Canonical
Category                 : Function
Component                : 
Role                     : 
Functionality            : 

```
## [Reset-ComputerAccount](docs/Reset-ComputerAccount.md)
```
NAME
    Reset-ComputerAccount
    
SYNOPSIS
    Reset computer account password
    
    
SYNTAX
    Reset-ComputerAccount [-ADSPath] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function will reset the computer account password for a single computer
    or for an OU of computers.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Reset-ComputerAccount

REMARKS
    To see the examples, type: "get-help Reset-ComputerAccount -examples".
    For more information, type: "get-help Reset-ComputerAccount -detailed".
    For technical information, type: "get-help Reset-ComputerAccount -full".
    For online help, type: "get-help Reset-ComputerAccount -online"
```
## [Set-ComputerName](docs/Set-ComputerName.md)
```
NAME
    Set-ComputerName
    
SYNOPSIS
    Change the name of the computer
    
    
SYNTAX
    Set-ComputerName [[-NewName] <String>] [[-ComputerName] <String>] [[-Credentials] <Object>] [[-Reboot] <Boolean>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will rename the local or optionally remote computer to the
    computername of your choice. In addition you can force the computer to
    reboot to finish the change.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-ComputerName

REMARKS
    To see the examples, type: "get-help Set-ComputerName -examples".
    For more information, type: "get-help Set-ComputerName -detailed".
    For technical information, type: "get-help Set-ComputerName -full".
    For online help, type: "get-help Set-ComputerName -online"
```
## [ConvertTo-Display](docs/ConvertTo-Display.md)
```

CommonParameters         : True
WorkflowCommonParameters : False
details                  : @{name=ConvertTo-Display; noun=; verb=}
Syntax                   : @{syntaxItem=System.Object[]}
parameters               : @{parameter=System.Object[]}
inputTypes               : @{inputType=}
returnValues             : @{returnValue=}
aliases                  : None
                           
remarks                  : None
alertSet                 : 
description              : 
examples                 : 
Synopsis                 : 
                           ConvertTo-Display [-Name] <string> [[-InitType] <int>] [[-ConnectionObject] <string>] [<CommonParameters>]
                           
ModuleName               : ActiveDirectoryManagement
nonTerminatingErrors     : 
xmlns:command            : http://schemas.microsoft.com/maml/dev/command/2004/10
xmlns:dev                : http://schemas.microsoft.com/maml/dev/2004/10
xmlns:maml               : http://schemas.microsoft.com/maml/2004/10
Name                     : ConvertTo-Display
Category                 : Function
Component                : 
Role                     : 
Functionality            : 

```
## [Add-DomainGroupToLocalGroup](docs/Add-DomainGroupToLocalGroup.md)
```
NAME
    Add-DomainGroupToLocalGroup
    
SYNOPSIS
    Add a Domain security group to a local computer group
    
    
SYNTAX
    Add-DomainGroupToLocalGroup [-ComputerName] <String> [-DomainGroup] <String> [[-LocalGroup] <String>] [[-UserDomain] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will add a Domain security group to a local computer group.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-DomainGroupToLocalGroup

REMARKS
    To see the examples, type: "get-help Add-DomainGroupToLocalGroup -examples".
    For more information, type: "get-help Add-DomainGroupToLocalGroup -detailed".
    For technical information, type: "get-help Add-DomainGroupToLocalGroup -full".
    For online help, type: "get-help Add-DomainGroupToLocalGroup -online"
```
## [Get-DomainInfo](docs/Get-DomainInfo.md)
```
NAME
    Get-DomainInfo
    
SYNOPSIS
    Get basic information about the current domain
    
    
SYNTAX
    Get-DomainInfo [[-TargetDomain] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Get basic information about the current domain, or from an external domain
    that you have rights to by setting TargetDomain to it's FQDN.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-DomainInfo

REMARKS
    To see the examples, type: "get-help Get-DomainInfo -examples".
    For more information, type: "get-help Get-DomainInfo -detailed".
    For technical information, type: "get-help Get-DomainInfo -full".
    For online help, type: "get-help Get-DomainInfo -online"
```
## [Get-DomainName](docs/Get-DomainName.md)
```
NAME
    Get-DomainName
    
SYNOPSIS
    Get the FQDN of the domain from an LDAP Url
    
    
SYNTAX
    Get-DomainName [[-LdapUrl] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns the FQDN of a domain based on the LDAP Url.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-DomainName

REMARKS
    To see the examples, type: "get-help Get-DomainName -examples".
    For more information, type: "get-help Get-DomainName -detailed".
    For technical information, type: "get-help Get-DomainName -full".
    For online help, type: "get-help Get-DomainName -online"
```
## [Get-ForestInfo](docs/Get-ForestInfo.md)
```
NAME
    Get-ForestInfo
    
SYNOPSIS
    Get basic information aobut the current forest.
    
    
SYNTAX
    Get-ForestInfo [[-TargetDomain] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Get basic information about the current forest, or from an external domain
    that you have rights to by setting TargetDomain to it's FQDN.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ForestInfo

REMARKS
    To see the examples, type: "get-help Get-ForestInfo -examples".
    For more information, type: "get-help Get-ForestInfo -detailed".
    For technical information, type: "get-help Get-ForestInfo -full".
    For online help, type: "get-help Get-ForestInfo -online"
```
## [Get-Fqdn](docs/Get-Fqdn.md)
```
NAME
    Get-Fqdn
    
SYNOPSIS
    A simple function to return the FQDN from a distinguishedName
    
    
SYNTAX
    Get-Fqdn [[-DistinguishedName] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function converts the distinguishedName into a proper
    FQDN (Fully Qualified Domain Name).
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-Fqdn

REMARKS
    To see the examples, type: "get-help Get-Fqdn -examples".
    For more information, type: "get-help Get-Fqdn -detailed".
    For technical information, type: "get-help Get-Fqdn -full".
    For online help, type: "get-help Get-Fqdn -online"
```
## [Get-FSMORoleOwner](docs/Get-FSMORoleOwner.md)
```

CommonParameters         : True
WorkflowCommonParameters : False
details                  : @{name=Get-FSMORoleOwner; noun=; verb=}
Syntax                   : @{syntaxItem=System.Object[]}
parameters               : @{parameter=System.Object[]}
inputTypes               : @{inputType=}
returnValues             : @{returnValue=}
aliases                  : None
                           
remarks                  : None
alertSet                 : 
description              : 
examples                 : 
Synopsis                 : 
                           Get-FSMORoleOwner [[-TargetDomain] <string>] [<CommonParameters>]
                           
ModuleName               : ActiveDirectoryManagement
nonTerminatingErrors     : 
xmlns:command            : http://schemas.microsoft.com/maml/dev/command/2004/10
xmlns:dev                : http://schemas.microsoft.com/maml/dev/2004/10
xmlns:maml               : http://schemas.microsoft.com/maml/2004/10
Name                     : Get-FSMORoleOwner
Category                 : Function
Component                : 
Role                     : 
Functionality            : 

```
## [Convert-FspToUsername](docs/Convert-FspToUsername.md)
```
NAME
    Convert-FspToUsername
    
SYNOPSIS
    Convert a FSP to a sAMAccountName
    
    
SYNTAX
    Convert-FspToUsername [-UserSID] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This function converts FSP's to sAMAccountName's.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Convert-FspToUsername

REMARKS
    To see the examples, type: "get-help Convert-FspToUsername -examples".
    For more information, type: "get-help Convert-FspToUsername -detailed".
    For technical information, type: "get-help Convert-FspToUsername -full".
    For online help, type: "get-help Convert-FspToUsername -online"
```
## [Get-GPO](docs/Get-GPO.md)
```
NAME
    Get-GPO
    
SYNOPSIS
    Return a list of all GPO's in a domain.
    
    
SYNTAX
    Get-GPO [[-Domain] <String>] [[-GpoID] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of all GPO's in the specified domain.
    

RELATED LINKS
    http://scripts.patton-tech.com/wiki/PowerShell/ActiveDirectoryManagement#Get-GPO
    http://blogs.technet.com/b/grouppolicy/archive/2011/06/10/listing-all-gpos-in-the-current-forest.aspx
    http://www.microsoft.com/download/en/search.aspx?q=gpmc
    http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools

REMARKS
    To see the examples, type: "get-help Get-GPO -examples".
    For more information, type: "get-help Get-GPO -detailed".
    For technical information, type: "get-help Get-GPO -full".
    For online help, type: "get-help Get-GPO -online"
```
## [Get-GpoLink](docs/Get-GpoLink.md)
```

CommonParameters         : True
WorkflowCommonParameters : False
details                  : @{name=Get-GpoLink; noun=; verb=}
Syntax                   : @{syntaxItem=System.Object[]}
parameters               : @{parameter=System.Object[]}
inputTypes               : @{inputType=}
returnValues             : @{returnValue=}
aliases                  : None
                           
remarks                  : None
alertSet                 : 
description              : 
examples                 : 
Synopsis                 : 
                           Get-GpoLink [[-Gpo] <string>] [-Path] [<CommonParameters>]
                           
ModuleName               : ActiveDirectoryManagement
nonTerminatingErrors     : 
xmlns:command            : http://schemas.microsoft.com/maml/dev/command/2004/10
xmlns:dev                : http://schemas.microsoft.com/maml/dev/2004/10
xmlns:maml               : http://schemas.microsoft.com/maml/2004/10
Name                     : Get-GpoLink
Category                 : Function
Component                : 
Role                     : 
Functionality            : 

```
## [ConvertTo-Guid](docs/ConvertTo-Guid.md)
```

CommonParameters         : True
WorkflowCommonParameters : False
details                  : @{name=ConvertTo-Guid; noun=; verb=}
Syntax                   : @{syntaxItem=System.Object[]}
parameters               : @{parameter=System.Object[]}
inputTypes               : @{inputType=}
returnValues             : @{returnValue=}
aliases                  : None
                           
remarks                  : None
alertSet                 : 
description              : 
examples                 : 
Synopsis                 : 
                           ConvertTo-Guid [-Name] <string> [[-InitType] <int>] [[-ConnectionObject] <string>] [<CommonParameters>]
                           
ModuleName               : ActiveDirectoryManagement
nonTerminatingErrors     : 
xmlns:command            : http://schemas.microsoft.com/maml/dev/command/2004/10
xmlns:dev                : http://schemas.microsoft.com/maml/dev/2004/10
xmlns:maml               : http://schemas.microsoft.com/maml/2004/10
Name                     : ConvertTo-Guid
Category                 : Function
Component                : 
Role                     : 
Functionality            : 

```
## [Get-LocalGroupMembers](docs/Get-LocalGroupMembers.md)
```
NAME
    Get-LocalGroupMembers
    
SYNOPSIS
    Return a list of user accounts that are in a specified group.
    
    
SYNTAX
    Get-LocalGroupMembers [-ComputerName] <String> [-GroupName] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of accounts from the provided group. The
    object returned holds the Name, Domain and type of account that is a member,
    either a user or group.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-LocalGroupMembers

REMARKS
    To see the examples, type: "get-help Get-LocalGroupMembers -examples".
    For more information, type: "get-help Get-LocalGroupMembers -detailed".
    For technical information, type: "get-help Get-LocalGroupMembers -full".
    For online help, type: "get-help Get-LocalGroupMembers -online"
```
## [Set-NetlogonDebugging](docs/Set-NetlogonDebugging.md)
```
NAME
    Set-NetlogonDebugging
    
SYNOPSIS
    This function enables/disables debugging on the netlogon service
    
    
SYNTAX
    Set-NetlogonDebugging [-Enable] [<CommonParameters>]
    
    
DESCRIPTION
    This function enables/disables debugging on the netlogon service when passed the
    Enable switch. When not present this has the effect of turning off debugging.
    
    Please see the support article under the related links section.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-NetlogonDebugging
    http://support.microsoft.com/kb/109626

REMARKS
    To see the examples, type: "get-help Set-NetlogonDebugging -examples".
    For more information, type: "get-help Set-NetlogonDebugging -detailed".
    For technical information, type: "get-help Set-NetlogonDebugging -full".
    For online help, type: "get-help Set-NetlogonDebugging -online"
```
## [Get-NetlogonLog](docs/Get-NetlogonLog.md)
```
NAME
    Get-NetlogonLog
    
SYNOPSIS
    Parse the netlogon.log file
    
    
SYNTAX
    Get-NetlogonLog [[-LogPath] <String>] [-DebugLog] [<CommonParameters>]
    
    
DESCRIPTION
    This function will read in the netlogon.log file and return a properly 
    formatted object. A regex is used to split up each line of the file and
    build fields for the returned output.
    
    Some entries in the log will have an octal code, this code if found is 
    processed and a definition is returned as part of the object.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-NetlogonLog

REMARKS
    To see the examples, type: "get-help Get-NetlogonLog -examples".
    For more information, type: "get-help Get-NetlogonLog -detailed".
    For technical information, type: "get-help Get-NetlogonLog -full".
    For online help, type: "get-help Get-NetlogonLog -online"
```
## [ConvertTo-Nt4](docs/ConvertTo-Nt4.md)
```

CommonParameters         : True
WorkflowCommonParameters : False
details                  : @{name=ConvertTo-Nt4; noun=; verb=}
Syntax                   : @{syntaxItem=System.Object[]}
parameters               : @{parameter=System.Object[]}
inputTypes               : @{inputType=}
returnValues             : @{returnValue=}
aliases                  : None
                           
remarks                  : None
alertSet                 : 
description              : 
examples                 : 
Synopsis                 : 
                           ConvertTo-Nt4 [-Name] <string> [[-InitType] <int>] [[-ConnectionObject] <string>] [<CommonParameters>]
                           
ModuleName               : ActiveDirectoryManagement
nonTerminatingErrors     : 
xmlns:command            : http://schemas.microsoft.com/maml/dev/command/2004/10
xmlns:dev                : http://schemas.microsoft.com/maml/dev/2004/10
xmlns:maml               : http://schemas.microsoft.com/maml/2004/10
Name                     : ConvertTo-Nt4
Category                 : Function
Component                : 
Role                     : 
Functionality            : 

```
## [Enable-OUProtectedMode](docs/Enable-OUProtectedMode.md)
```
NAME
    Enable-OUProtectedMode
    
SYNOPSIS
    Turn on the protect object from accidental deletion bit
    
    
SYNTAX
    Enable-OUProtectedMode [-OU] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function will accept one or more ldap OU path's from the pipline and set its and its
    childrens accidental deletetion bit to on. It does this by setting the Delete and Deletetree
    right to Deny for the group Everyone.
    
    The end result is that you should see once this function runs, that the checkbox on the object
    property page for the OU is checked for, protect this object from accidental deletion.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Enable-OUProtectedMode

REMARKS
    To see the examples, type: "get-help Enable-OUProtectedMode -examples".
    For more information, type: "get-help Enable-OUProtectedMode -detailed".
    For technical information, type: "get-help Enable-OUProtectedMode -full".
    For online help, type: "get-help Enable-OUProtectedMode -online"
```
## [ConvertTo-Rfc1779](docs/ConvertTo-Rfc1779.md)
```

CommonParameters         : True
WorkflowCommonParameters : False
details                  : @{name=ConvertTo-Rfc1779; noun=; verb=}
Syntax                   : @{syntaxItem=System.Object[]}
parameters               : @{parameter=System.Object[]}
inputTypes               : @{inputType=}
returnValues             : @{returnValue=}
aliases                  : None
                           
remarks                  : None
alertSet                 : 
description              : 
examples                 : 
Synopsis                 : 
                           ConvertTo-Rfc1779 [-Name] <string> [[-InitType] <int>] [[-ConnectionObject] <string>] [<CommonParameters>]
                           
ModuleName               : ActiveDirectoryManagement
nonTerminatingErrors     : 
xmlns:command            : http://schemas.microsoft.com/maml/dev/command/2004/10
xmlns:dev                : http://schemas.microsoft.com/maml/dev/2004/10
xmlns:maml               : http://schemas.microsoft.com/maml/2004/10
Name                     : ConvertTo-Rfc1779
Category                 : Function
Component                : 
Role                     : 
Functionality            : 

```
## [ConvertFrom-Sid](docs/ConvertFrom-Sid.md)
```
NAME
    ConvertFrom-Sid
    
SYNOPSIS
    Convert a Sid byte array to a string
    
    
SYNTAX
    ConvertFrom-Sid [[-ObjectSid] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function takes the Sid as a byte array and returns it as an
    object that has the Sid as a string.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertFrom-Sid

REMARKS
    To see the examples, type: "get-help ConvertFrom-Sid -examples".
    For more information, type: "get-help ConvertFrom-Sid -detailed".
    For technical information, type: "get-help ConvertFrom-Sid -full".
    For online help, type: "get-help ConvertFrom-Sid -online"
```
## [ConvertTo-Sid](docs/ConvertTo-Sid.md)
```
NAME
    ConvertTo-Sid
    
SYNOPSIS
    Convert a string Sid back to a byte array
    
    
SYNTAX
    ConvertTo-Sid [[-StringSid] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function takes the Sid as a string and converts it back to a byte array
    that can be used by other functions which may be looking for the Sid as
    a byte.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Sid

REMARKS
    To see the examples, type: "get-help ConvertTo-Sid -examples".
    For more information, type: "get-help ConvertTo-Sid -detailed".
    For technical information, type: "get-help ConvertTo-Sid -full".
    For online help, type: "get-help ConvertTo-Sid -online"
```
## [Get-StaleComputerAccounts](docs/Get-StaleComputerAccounts.md)
```
NAME
    Get-StaleComputerAccounts
    
SYNOPSIS
    Return a collection of computer accounts older than a set number of days.
    
    
SYNTAX
    Get-StaleComputerAccounts [[-ADSPath] <String>] [[-DayOffset] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    This function can be used to get a list of computer accounts within your Active Directory
    that are older than a certain number of days. Typically a computer account will renew it's
    own password every 90 days, so any account where the 'whenChanged' attribute is older than 
    90 would be considered old.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-StaleComputerAccounts

REMARKS
    To see the examples, type: "get-help Get-StaleComputerAccounts -examples".
    For more information, type: "get-help Get-StaleComputerAccounts -detailed".
    For technical information, type: "get-help Get-StaleComputerAccounts -full".
    For online help, type: "get-help Get-StaleComputerAccounts -online"
```
## [Get-UnlinkedGPO](docs/Get-UnlinkedGPO.md)
```
NAME
    Get-UnlinkedGPO
    
SYNOPSIS
    Return a list of unlinked Group Policy Objects
    
    
SYNTAX
    Get-UnlinkedGPO [[-Domain] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will return a list of unlinked Group Policy Objects from
    the specified domain.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-UnlinkedGPO
    http://blogs.technet.com/b/heyscriptingguy/archive/2009/02/10/how-can-get-a-list-of-all-my-orphaned-group-policy-objects.aspx
    http://www.microsoft.com/download/en/search.aspx?q=gpmc
    http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools

REMARKS
    To see the examples, type: "get-help Get-UnlinkedGPO -examples".
    For more information, type: "get-help Get-UnlinkedGPO -detailed".
    For technical information, type: "get-help Get-UnlinkedGPO -full".
    For online help, type: "get-help Get-UnlinkedGPO -online"
```
## [ConvertTo-Upn](docs/ConvertTo-Upn.md)
```

CommonParameters         : True
WorkflowCommonParameters : False
details                  : @{name=ConvertTo-Upn; noun=; verb=}
Syntax                   : @{syntaxItem=System.Object[]}
parameters               : @{parameter=System.Object[]}
inputTypes               : @{inputType=}
returnValues             : @{returnValue=}
aliases                  : None
                           
remarks                  : None
alertSet                 : 
description              : 
examples                 : 
Synopsis                 : 
                           ConvertTo-Upn [-Name] <string> [[-InitType] <int>] [[-ConnectionObject] <string>] [<CommonParameters>]
                           
ModuleName               : ActiveDirectoryManagement
nonTerminatingErrors     : 
xmlns:command            : http://schemas.microsoft.com/maml/dev/command/2004/10
xmlns:dev                : http://schemas.microsoft.com/maml/dev/2004/10
xmlns:maml               : http://schemas.microsoft.com/maml/2004/10
Name                     : ConvertTo-Upn
Category                 : Function
Component                : 
Role                     : 
Functionality            : 

```
## [Get-UserGroupMembership](docs/Get-UserGroupMembership.md)
```
NAME
    Get-UserGroupMembership
    
SYNOPSIS
    Get a list of groups as displayed on the user objects Member of tab
    
    
SYNTAX
    Get-UserGroupMembership [-UserDN] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a listing of groups that the user is a direct
    member of. This is the same list that should appear in the Member Of
    tab in Active Directory Users and Computers.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-UserGroupMembership

REMARKS
    To see the examples, type: "get-help Get-UserGroupMembership -examples".
    For more information, type: "get-help Get-UserGroupMembership -detailed".
    For technical information, type: "get-help Get-UserGroupMembership -full".
    For online help, type: "get-help Get-UserGroupMembership -online"
```
## [Add-UserToGroup](docs/Add-UserToGroup.md)
```
NAME
    Add-UserToGroup
    
SYNOPSIS
    Add a domain user to a domain group
    
    
SYNTAX
    Add-UserToGroup [[-GroupDN] <Object>] [[-UserDN] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function adds a domain user account to a domain group.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-UserToGroup

REMARKS
    To see the examples, type: "get-help Add-UserToGroup -examples".
    For more information, type: "get-help Add-UserToGroup -detailed".
    For technical information, type: "get-help Add-UserToGroup -full".
    For online help, type: "get-help Add-UserToGroup -online"
```
## [Add-UserToLocalGroup](docs/Add-UserToLocalGroup.md)
```
NAME
    Add-UserToLocalGroup
    
SYNOPSIS
    Add a domain user to a local group.
    
    
SYNTAX
    Add-UserToLocalGroup [[-ComputerName] <String>] [-UserName] <String> [-LocalGroup] <String> [[-UserDomain] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Add a domain user to a local group on a computer.
    

RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-UserToLocalGroup

REMARKS
    To see the examples, type: "get-help Add-UserToLocalGroup -examples".
    For more information, type: "get-help Add-UserToLocalGroup -detailed".
    For technical information, type: "get-help Add-UserToLocalGroup -full".
    For online help, type: "get-help Add-UserToLocalGroup -online"
```


