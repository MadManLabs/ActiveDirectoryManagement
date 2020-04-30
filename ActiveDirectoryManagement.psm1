Function Get-AdObject {
    [CmdletBinding(HelpURI = 'https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-AdObject.md#get-adobject')]
    [OutputType([System.DirectoryServices.SearchResultCollection[]])]
    Param
    (
        [string]$ADSPath = (([ADSI]"").distinguishedName),
        [string]$SearchFilter = "(objectCategory=computer)",
        [ValidateSet("Base", "OneLevel", "Subtree")]
        [string]$SearchScope = "Subtree",
        [array]$ADProperties,
        [bool]$CacheResults = $False,
        [bool]$Tombstone = $false,
        [System.Management.Automation.PSCredential]$Credential,
        $DirSync
    )
    Begin {
        if ($ADSPath -notmatch "LDAP://*") {
            $ADSPath = "LDAP://$($ADSPath)"
        }
    }
    Process {
        Try {
            if ($Credential) {
                $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry($ADSPath, $Credential.UserName, $Credential.Password)
            }
            else {
                $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry($ADSPath)
            }
            if ($ADProperties) {
                $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher $DirectoryEntry, $SearchFilter, $AdProperties
            }
            else {
                $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher
                $DirectorySearcher.SearchRoot = $DirectoryEntry
                $DirectorySearcher.PageSize = 1000
                $DirectorySearcher.Filter = $SearchFilter
            }
            $DirectorySearcher.SearchScope = $SearchScope
            $DirectorySearcher.CacheResults = $CacheResults
            $DirectorySearcher.Tombstone = $TombStone
            if ($DirSync) {
                $DirectorySearcher.DirectorySynchronization = New-Object System.DirectoryServices.DirectorySynchronization $DirSync
            }
            $DirectorySearcher.FindAll()
        }
        Catch {
            Return $Error[0].Exception
        }
    }
    End {
    }
}
Function Get-AdGroupMember {
    [CmdletBinding(HelpUri = 'https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-AdGroupMember.md')]
    [OutputType([object[]])]
    Param
    (
        [string]$UserGroup = "Managers",
        [string]$ADSPath = (([ADSI]"").distinguishedName)
    )
    Begin {
        if ($ADSPath -notmatch "LDAP://*") {
            $ADSPath = "LDAP://$($ADSPath)"
        }

        $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry($ADSPath)
        $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher

        $LDAPFilter = "(&(objectCategory=Group)(name=$($UserGroup)))"

        $DirectorySearcher.SearchRoot = $DirectoryEntry
        $DirectorySearcher.PageSize = 1000
        $DirectorySearcher.Filter = $LDAPFilter
        $DirectorySearcher.SearchScope = "Subtree"

        $SearchResult = $DirectorySearcher.FindAll()

        $UserAccounts = @()
    }
    Process {
        foreach ($Item in $SearchResult) {
            $Group = $Item.GetDirectoryEntry()
            $Members = $Group.member

            If ($Null -ne $Members) {
                foreach ($User in $Members) {
                    $UserObject = New-Object System.DirectoryServices.DirectoryEntry("LDAP://$($User)")
                    If ($UserObject.objectCategory.Value.Contains("Group")) {
                    }
                    Else {
                        $ThisUser = New-Object -TypeName PSObject -Property @{
                            cn                     = [string]$UserObject.cn
                            distinguishedName      = [string]$UserObject.distinguishedName
                            name                   = [string]$UserObject.name
                            nTSecurityDescriptor   = $UserObject.nTSecurityDescriptor
                            objectCategory         = [string]$UserObject.objectCategory
                            objectClass            = $UserObject.objectClass
                            objectGUID             = $UserObject.objectGUID
                            objectSID              = $UserObject.objectSID
                            showInAdvancedViewOnly = $UserObject.showInAdvancedViewOnly
                        }
                    }
                    $UserAccounts += $ThisUser
                }
            }
        }
    }
    End {
        Return $UserAccounts
    }
}
Function Get-StaleComputerAccount {
    [CmdletBinding(HelpUri = 'https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-StaleComputerAccount.md#get-stalecomputeraccount')]
    [OutputType([object[]])]
    Param
    (
        [string]$ADSPath = (([ADSI]"").distinguishedName),
        [int]$DayOffset = 90
    )
    Begin {
        if ($ADSPath -notmatch "LDAP://*") {
            $ADSPath = "LDAP://$($ADSPath)"
        }

        $DateOffset = (Get-Date).AddDays(-$DayOffset)
        [string]$SearchFilter = "(objectCategory=computer)"
        [array]$ADProperties = "name", "whenChanged", "whenCreated"

        $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry($ADSPath)
        $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher
        $DirectorySearcher.SearchRoot = $DirectoryEntry
        $DirectorySearcher.PageSize = 1000
        $DirectorySearcher.Filter = $SearchFilter
        $DirectorySearcher.SearchScope = "Subtree"

        foreach ($Property in $ADProperties) {
            [void]$DirectorySearcher.PropertiesToLoad.Add($Property)
        }

        $ADObjects = $DirectorySearcher.FindAll()
    }
    Process {
        $StaleComputerAccounts = @()

        foreach ($ADObject in $ADObjects) {
            $WhenChanged = $ADObject.Properties.whenchanged
            $WhenCreated = $ADObject.Properties.whencreated
            if ($WhenChanged -lt $DateOffset -and $ADObject.Properties.adspath) {
                $ThisComputer = New-Object PSObject -Property @{
                    name        = [string]$ADObject.Properties.name
                    adspath     = [string]$ADObject.Properties.adspath
                    whenchanged = [string]$WhenChanged
                    whencreated = [string]$WhenCreated
                }
                $StaleComputerAccounts += $ThisComputer
            }
        }
    }
    End {
        Return $StaleComputerAccounts
    }
}
Function Set-AccountDisabled {
    [CmdletBinding(HelpURI = 'https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Set-AccountDisabled.md#set-accountdisabled',
        SupportsShouldProcess, ConfirmImpact = 'Medium')]
    Param
    (
        [Parameter(Mandatory = $true)]
        [string]$ADSPath
    )
    Begin {
        $DisableComputer = [ADSI]$ADSPath
    }
    Process {
        Try {
            if ($PSCmdlet.ShouldProcess()) {
                $DisableComputer.psbase.invokeset("AccountDisabled", "True")
                $DisableComputer.psbase.CommitChanges()
                if ($? -eq $true) {
                    $Result = New-Object -TypeName PSObject -Property @{
                        DisabledComputer = $DisabledComputer
                        Success          = $?
                    }
                }
            }
        }
        Catch {
            $Result = New-Object -TypeName PSObject -Property @{
                DisabledComputer = $DisabledComputer
                Success          = $Error[0].Exception.InnerException.Message.ToString().Trim()
            }
        }
    }
    End {
        Return $Result
    }
}
Function Reset-ComputerAccount {
    [CmdletBinding(HelpURI = 'https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Reset-ComputerAccount.md#reset-computeraccount',
        SupportsShouldProcess, ConfirmImpact = 'Medium')]
    Param
    (
        [Parameter(Mandatory = $true)]
        [String]$ADSPath
    )
    Begin {
        $Computer = [ADSI]$ADSPath
    }
    Process {
        Try {
            if ($PSCmdlet.ShouldProcess()) {
                $Computer.SetPassword($($Computer.name) + "$")
                if ($? -eq $true) {
                    $Result = New-Object -TypeName PSObject -Property @{
                        Computer = $Computer
                        Success  = $?
                    }
                }
            }
        }
        Catch {
            $Result = New-Object -TypeName PSObject -Property @{
                Computer = $Computer
                Success  = $Error[0].Exception.InnerException.Message.ToString().Trim()
            }
        }
    }
    End {
        Return $Result
    }
}
Function Get-FSMORoleOwner {
    [CmdletBinding(HelpUri = 'https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-FSMORoleOwner.md#get-fsmoroleowner')]
    Param
    (
        [string]$TargetDomain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
    )
    Begin {
        $ForestContext = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext("Forest", $TargetDomain)
        $Forest = [system.directoryservices.activedirectory.Forest]::GetForest($ForestContext)
    }
    Process {
        Try {
            ForEach ($domain in $forest.domains) {
                $forestproperties = @{
                    Forest              = $Forest.name
                    Domain              = $domain.name
                    SchemaMaster        = $forest.SchemaRoleOwner
                    DomainNamingMaster  = $forest.NamingRoleOwner
                    RIDOwner            = $Domain.RidRoleOwner
                    PDCOwner            = $Domain.PdcRoleOwner
                    InfrastructureOwner = $Domain.InfrastructureRoleOwner
                }
                $ForestObject = New-Object PSObject -Property $forestproperties
                $ForestObject.PSTypeNames.Insert(0, "ForestRoles")
            }
        }
        Catch {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
        }
    }
    End {
        Return $ForestObject
    }
}
Function Convert-FspToUsername {
    [CmdletBinding(HelpUri = 'https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Convert-FspToUsername.md#convert-fsptousername')]
    Param
    (
        [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true)]
        $UserSID
    )
    Begin {
    }
    Process {
        foreach ($Sid in $UserSID) {
            try {
                $SAM = (New-Object System.Security.Principal.SecurityIdentifier($Sid)).Translate([System.Security.Principal.NTAccount])
                $Result = New-Object -TypeName PSObject -Property @{
                    Sid            = $Sid
                    sAMAccountName = $SAM.Value
                }
                Return $Result
            }
            catch {
                $Result = New-Object -TypeName PSObject -Property @{
                    Sid            = $Sid
                    sAMAccountName = $Error[0].Exception.InnerException.Message.ToString().Trim()
                }
                Return $Result
            }
        }
    }
    End {
    }
}
Function Get-DomainName {
    [CmdletBinding(HelpUri = 'https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-DomainName.md#get-domainname')]
    Param
    (
        $LdapUrl
    )
    Begin {
        if ($LdapUrl.GetType().Name -eq "String") {
            Write-Verbose "LDAP Url is a string"
            $tempUrl = $LdapURL.ToUpper()
        }
        elseif ($LdapUrl.GetType().Name -eq "DirectoryEntry") {
            Write-Verbose "LDAP Url is an directory object"
            $tempUrl = $LdapUrl.Path.ToString().ToUpper()
        }
    }
    Process {
        Write-Verbose "Finding the first DC= and replacing it with a dot."
        $DomainName = ($tempUrl.SubString($tempUrl.IndexOf(",DC=") + 4)).Replace(",DC=", ".")
        $RetVal = New-Object -TypeName PSObject -Property @{
            LdapUrl    = $LdapUrl
            DomainName = $DomainName.ToLower()
        }
    }
    End {
        Return $RetVal
    }
}
Function Get-UserGroupMembership {
    [CmdletBinding(HelpUri = 'https://github.com/jeffpatton1971/ActiveDirectoryManagement/blob/1.1.0/docs/Get-UserGroupMembership.md#get-usergroupmembership')]
    Param
    (
        [Parameter(Mandatory = $true)]
        $UserDN
    )
    Begin {
        if ($UserDN -notmatch "LDAP://*") {
            $UserDN = "LDAP://$($UserDN)"
        }
        try {
            Write-Verbose "Attempting to connect to $($UserDN) to return a list of groups."
            $Groups = ([adsi]$UserDN).MemberOf
        }
        Catch {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
        }
    }
    Process {
        if ($Groups) {
            Write-Verbose "Object has group membership."
            $GroupMembership = @()
            foreach ($Group in $Groups) {
                Write-Verbose "Adding $($Group) to the collection to return."
                $GroupEntry = New-Object -TypeName PSObject -Property @{
                    GroupDN = $Group
                }
                $GroupMembership += $GroupEntry
            }
        }
    }
    End {
        Return $GroupMembership
    }
}
Function Add-UserToGroup {
    <#
        .SYNOPSIS
            Add a domain user to a domain group
        .DESCRIPTION
            This function adds a domain user account to a domain group.
        .PARAMETER GroupDN
            The distinguishedName of the group to add to
        .PARAMETER UserDN
            The distinguishedName of the user account to add
        .EXAMPLE
            Add-UserToGroup -GroupDN 'CN=AdminStaff,OU=Groups,DC=company,DC=com' -UserDN 'CN=UserAccount,OU=Employees,DC=company,DC=com'

            GroupDN : LDAP://CN=AdminStaff,OU=Groups,DC=company,DC=com
            UserDN  : LDAP://CN=UserAccount,OU=Employees,DC=company,DC=com
            Added   : True

            Description
            -----------
            This example shows the syntax of the command.
        .NOTES
            FunctionName : Add-UserToGroup
            Created by   : Jeff Patton
            Date Coded   : 09/22/2011 14:18:33
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-UserToGroup
    #>
    [CmdletBinding()]
    Param
    (
        $GroupDN,
        $UserDN
    )
    Begin {
        if ($GroupDN -notmatch "LDAP://*") {
            $GroupDN = "LDAP://$($GroupDN)"
        }
        if ($UserDN -notmatch "LDAP://*") {
            $UserDN = "LDAP://$($UserDN)"
        }
    }
    Process {
        try {
            ([adsi]$GroupDN).Add($UserDN)
            $RetVal = $?
        }
        catch {
            $RetVal = $Error[0].Exception.InnerException.Message.ToString().Trim()
        }
    }
    End {
        $GroupUpdated = New-Object -TypeName PSObject -Property @{
            GroupDN = $GroupDN
            UserDN  = $UserDN
            Added   = $RetVal
        }
        Return $GroupUpdated
    }
}
Function Set-AdObjectProperty {
    <#
        .SYNOPSIS
            Set the properties of a given object in AD
        .DESCRIPTION
            This function will set the properties of a given object in AD. The
            function takes a comma seperated Propertyname, PropertyValue and sets
            the value of that property on the object.
        .PARAMETER ADObject
            The object within AD to be modified
        .PARAMETER PropertyPairs
            The PropertyName and PropertyValue to be set. This can be an array
            of values as such:
                "Description,UserAccount","Office,Building 1"
            The PropertyName should always be listed first, followed by the
            values of the property.
        .EXAMPLE
            Set-AdObjectProperty -ADObject 'LDAP://CN=UserAccount,CN=Users,DC=company,DC=com' -PropertyPairs "Description,New User Account"

            Description
            -----------
            This is the basic syntax of this function.
        .NOTES
            FunctionName : Set-AdObjectProperty
            Created by   : Jeff Patton
            Date Coded   : 09/23/2011 14:27:19
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-AdObjectProperty
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
    Param
    (
        $ADObject,
        $PropertyPairs
    )
    Begin {
        if ($ADObject -notmatch "LDAP://*") {
            $ADObject = "LDAP://$($Adobject)"
        }
        Write-Verbose "Storing the object as a Directory Entry so we can modify it."
        $ADObject = New-Object DirectoryServices.DirectoryEntry $ADObject
    }
    Process {
        if ($PSCmdlet.ShouldProcess()) {
            Write-Verbose "Work through an array of 0 or more PropertyPairs."
            foreach ($PropertyPair in $PropertyPairs) {
                Write-Verbose "Split this PropertyPair on comma."
                $PropertyPair = $PropertyPair.Split(",")
                if ($PropertyPair.Count -eq 2) {
                    Write-Verbose "Assign PropertyName to PropertyPair[0]"
                    $PropertyName = $PropertyPair[0]
                    Write-Verbose "Assign PropertyValue to PropertyPair[1]"
                    $PropertyValue = $PropertyPair[1]

                    Write-Verbose "Assign the property of the object, the value"
                    $ADObject.Put($PropertyName, $PropertyValue)
                }
                elseif ($PropertyPair.Count -gt 2) {
                    Write-Verbose "Multi-valued property detected"
                    Write-Verbose "Assign PropertyName to PropertyPair[0]"
                    $PropertyName = $PropertyPair[0]
                    Write-Verbose "Assign remaining values to PropertyValues"
                    $PropertyValues = $PropertyPair[1..(($PropertyPair.Count) - 1)]

                    Write-Verbose "Assign the property of the object, the values"
                    $ADObject.PutEx(2, $PropertyName, $PropertyValues)
                }
                Write-Verbose "Save property changes to object"
                try {
                    $ADObject.SetInfo()
                    $ADObject.RefreshCache()
                }
                catch {
                    Return $Error[0]
                }
            }
        }
    }
    End {
        return $ADObject
    }
}
Function Rename-Adobject {
    <#
    .SYNOPSIS
        Rename an object in Active Directory
    .DESCRIPTION
        This function will rename the object provided. It updates the cn,
        the sAMAccountName and the userPrincipalName to represent the passed
        in Name parameter.
    .PARAMETER Adobject
        An LDAP path
    .PARAMETER Name
        The new name
    .EXAMPLE
        PS C:\Windows\system32> Rename-Adobject -Adobject $Adobject.Path -Name zomg


        distinguishedName : {CN=zomg,OU=testing,DC=company,DC=com}
        Path              : LDAP://cn=zomg,OU=testing,DC=company,DC=com

        Description
        -----------
        This shows the basic syntax of this function
    .NOTES
        FunctionName : Rename-Adobject
        Created by   : jspatton
        Date Coded   : 01/06/2015 10:16:39
    .LINK
        https://github.com/jeffpatton1971/mod-posh/wiki/ActiveDirectoryManagement#Rename-Adobject
#>
    [CmdletBinding()]
    Param
    (
        $Adobject,
        $Name
    )
    Begin {
        if ($ADObject -notmatch "LDAP://*") {
            $ADObject = "LDAP://$($Adobject)"
        }
        Write-Verbose "Storing the object as a Directory Entry so we can modify it."
        $ADObject = New-Object DirectoryServices.DirectoryEntry $ADObject
    }
    Process {
        try {
            $ErrorActionPreference = "Stop"
            $sAMAccountName = $Adobject.sAMAccountName.ToString()
            $userPrincipalName = $Adobject.userPrincipalName.ToString()
            $Adobject.Rename("cn=$($Name)")
            $Adobject.Put("sAMAccountName", $Name)
            $Adobject.SetInfo()
            $Adobject.RefreshCache()
            $Adobject.Put("userPrincipalName", $userPrincipalName.Replace($sAMAccountName, $Name))
            $Adobject.SetInfo()
            $Adobject.RefreshCache()
        }
        catch {
            Write-Error $Error[0]
        }
    }
    End {
        return $Adobject
    }
}
Function Get-GPO {
    <#
        .SYNOPSIS
            Return a list of all GPO's in a domain.
        .DESCRIPTION
            This function returns a list of all GPO's in the specified domain.
        .PARAMETER Domain
            The FQDN of the domain to search
        .PARAMETER GpoID
            The GUID of the GPO you are looking for.
        .EXAMPLE
            Get-GPO

            DisplayName                 : Default Domain Policy
            Path                        : cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=COM
            ID                          : {31B2F340-016D-11D2-945F-00C04FB984F9}
            DomainName                  : COMPANY.COM
            CreationTime                : 9/1/2004 10:49:52 AM
            ModificationTime            : 6/14/2011 10:21:20 AM
            UserDSVersionNumber         : 33
            ComputerDSVersionNumber     : 255
            UserSysvolVersionNumber     : 33
            ComputerSysvolVersionNumber : 255
            Description                 :

            Description
            -----------
            This example shows the basic syntax of the command.
        .EXAMPLE
            Get-GPO -Domain COMPANY.NET

            DisplayName                 : Default Domain Policy
            Path                        : cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=NET
            ID                          : {31B2F340-016D-11D2-945F-00C04FB984F9}
            DomainName                  : COMPANY.NET
            CreationTime                : 9/1/2004 10:49:52 AM
            ModificationTime            : 6/14/2011 10:21:20 AM
            UserDSVersionNumber         : 33
            ComputerDSVersionNumber     : 255
            UserSysvolVersionNumber     : 33
            ComputerSysvolVersionNumber : 255
            Description                 :

            Description
            -----------
            This example shows using the domain parameter to specify an alternate domain.
        .EXAMPLE
            Get-GPO -GpoID '31B2F340-016D-11D2-945F-00C04FB984F9'

            DisplayName                 : Default Domain Policy
            Path                        : cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=NET
            ID                          : {31B2F340-016D-11D2-945F-00C04FB984F9}
            DomainName                  : COMPANY.NET
            CreationTime                : 9/1/2004 10:49:52 AM
            ModificationTime            : 6/14/2011 10:21:20 AM
            UserDSVersionNumber         : 33
            ComputerDSVersionNumber     : 255
            UserSysvolVersionNumber     : 33
            ComputerSysvolVersionNumber : 255
            Description                 :

            Description
            -----------
            This example shows passing the GUID of a gpo into the function.
        .NOTES
            FunctionName : Get-GPO
            Created by   : Jeff Patton
            Date Coded   : 03/13/2012 18:37:08

            You will need the Group Policy Managment console or RSAT installed.
        .LINK
            http://scripts.patton-tech.com/wiki/PowerShell/ActiveDirectoryManagement#Get-GPO
        .LINK
            http://blogs.technet.com/b/grouppolicy/archive/2011/06/10/listing-all-gpos-in-the-current-forest.aspx
        .LINK
            http://www.microsoft.com/download/en/search.aspx?q=gpmc
        .LINK
            http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools
    #>
    [CmdletBinding()]
    Param
    (
        [string]$Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name,
        [string]$GpoID
    )
    Begin {
        Try {
            Write-Verbose "Instantiating GroupPolicy Management API"
            $GpoMgmt = New-Object -ComObject gpmgmt.gpm
        }
        catch {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
        }
        $GpoGuid = "{$($GpoID.Replace('{','').Replace('}',''))}"
    }
    Process {
        try {
            $GpoConstants = $GpoMgmt.GetConstants()
            $GpoDomain = $GpoMgmt.GetDomain($Domain, $null, $GpoConstants.UseAnyDC)
            $GpoSearchCriteria = $GpoMgmt.CreateSearchCriteria()
            if ($GpoID) {
                $GpoSearchCriteria.Add($GpoConstants.SearchPropertyGPOID, $GpoConstants.SearchOpEquals, $GpoGuid)
            }
            $GroupPolicyObjects = $GpoDomain.SearchGPOs($GpoSearchCriteria)
        }
        catch {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
        }
    }
    End {
        Return $GroupPolicyObjects
    }
}
Function Get-UnlinkedGPO {
    <#
        .SYNOPSIS
            Return a list of unlinked Group Policy Objects
        .DESCRIPTION
            This function will return a list of unlinked Group Policy Objects from
            the specified domain.
        .PARAMETER Domain
            The FQDN of the domain to search
        .EXAMPLE
            Get-UnlinkedGPO

            DisplayName                 : No Offline Files GPO
            Path                        : cn={7BE5802A-3A76-411E-B685-C2DE9A8DE8B9},cn=policies,cn=system,DC=COMPANY,DC=COM
            ID                          : {7BE5802A-3A76-411E-B685-C2DE9A8DE8B9}
            DomainName                  : COMPANY.COM
            CreationTime                : 11/2/2005 11:06:34 AM
            ModificationTime            : 6/14/2011 10:21:38 AM
            UserDSVersionNumber         : 0
            ComputerDSVersionNumber     : 14
            UserSysvolVersionNumber     : 0
            ComputerSysvolVersionNumber : 14
            Description                 :

            Description
            -----------
            This shows the basic syntax of the command.
        .EXAMPLE
            Get-UnlinkedGPO -Domain COMPANY.NET

            DisplayName                 : PartialPath
            Path                        : cn={D074F8A6-CA41-464F-96A6-9155C96B486B},cn=policies,cn=system,DC=COMPANY,DC=NET
            ID                          : {D074F8A6-CA41-464F-96A6-9155C96B486B}
            DomainName                  : COMPANY.NET
            CreationTime                : 1/11/2010 11:11:14 AM
            ModificationTime            : 6/14/2011 10:21:40 AM
            UserDSVersionNumber         : 0
            ComputerDSVersionNumber     : 4
            UserSysvolVersionNumber     : 0
            ComputerSysvolVersionNumber : 4
            Description                 :

            Description
            -----------
            This example shows using the domain parameter to specify an alternate domain.
        .NOTES
            FunctionName : Get-UnlinkedGPO
            Created by   : Jeff Patton
            Date Coded   : 03/13/2012 18:54:38

            You will need the Group Policy Management Console or RSAT installed
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-UnlinkedGPO
        .LINK
            http://blogs.technet.com/b/heyscriptingguy/archive/2009/02/10/how-can-get-a-list-of-all-my-orphaned-group-policy-objects.aspx
        .LINK
            http://www.microsoft.com/download/en/search.aspx?q=gpmc
        .LINK
            http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools
    #>
    [CmdletBinding()]
    Param
    (
        [string]$Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
    )
    Begin {
        Try {
            Write-Verbose "Instantiating GroupPolicy Management API"
            $GpoMgmt = New-Object -ComObject gpmgmt.gpm
        }
        catch {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
        }

        $unlinkedGPO = @()
    }
    Process {
        try {
            $GpoConstants = $GpoMgmt.GetConstants()
            $GpoDomain = $GpoMgmt.GetDomain($Domain, $null, $GpoConstants.UseAnyDC)
            $GpoSearchCriteria = $GpoMgmt.CreateSearchCriteria()
            $GroupPolicyObjects = $GpoDomain.SearchGPOs($GpoSearchCriteria)

            foreach ($GroupPolicyObject in $GroupPolicyObjects) {
                $GpoSearchCriteria = $GpoMgmt.CreateSearchCriteria()
                $GpoSearchCriteria.Add($GpoConstants.SearchPropertySomLinks, $GpoConstants.SearchOpContains, $GroupPolicyObject)
                $GpoSomLinks = $GpoDomain.SearchSoms($GpoSearchCriteria)
                if ($GpoSomLinks.Count -eq 0) {
                    $unlinkedGPO += $GroupPolicyObject
                }
            }
        }
        catch {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
        }
    }
    End {
        Return $unlinkedGPO
    }
}
Function Get-DomainInfo {
    <#
        .SYNOPSIS
            Get basic information about the current domain
        .DESCRIPTION
            Get basic information about the current domain, or from an external domain
            that you have rights to by setting TargetDomain to it's FQDN.
        .PARAMETER TargetDomain
            The FQDN of the domain to return information from.
        .EXAMPLE
            Get-DomainInfo

            Forest                  : company.com
            DomainControllers       : {dc1.company.com,dc2.company.com}
            Children                : {}
            DomainMode              : Windows2003Domain
            Parent                  :
            PdcRoleOwner            : dc1.company.com
            RidRoleOwner            : dc1.company.com
            InfrastructureRoleOwner : dc1.company.com
            Name                    : company.com

            Description
            -----------
            Show the basic syntax of the command.
        .NOTES
            FunctionName : Get-DomainInfo
            Created by   : jspatton
            Date Coded   : 03/14/2012 15:56:20
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-DomainInfo
    #>
    [CmdletBinding()]
    Param
    (
        [string]$TargetDomain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
    )
    Begin {
        $ContextType = "Domain"
        Write-Verbose "Creating the Domain context to pass to the GetDomain method"
        $DomainContext = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext($ContextType, $TargetDomain)
    }
    Process {
        Write-Verbose "Call GetDomain to return information aobut the specified TargetDomain: $($TargetDomain)"
        $Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($DomainContext)
    }
    End {
        Return $Domain
    }
}
Function Get-ForestInfo {
    <#
        .SYNOPSIS
            Get basic information aobut the current forest.
        .DESCRIPTION
            Get basic information about the current forest, or from an external domain
            that you have rights to by setting TargetDomain to it's FQDN.
        .PARAMETER TargetDomain
            The FQDN of the domain to return information from.
        .EXAMPLE
            Get-ForestInfo

            Name                  : company.com
            Sites                 :
            Domains               : {company.com}
            GlobalCatalogs        : {dc1.company.com}
            ApplicationPartitions : {DC=DomainDnsZones,DC=company,DC=com, DC=ForestDnsZones,DC=company,DC=com}
            ForestMode            : Windows2003Forest
            RootDomain            : company.com
            Schema                : CN=Schema,CN=Configuration,DC=company,DC=com
            SchemaRoleOwner       : dc1.company.com
            NamingRoleOwner       : dc1.company.com

            Description
            -----------
            Show the basic syntax of the command.
        .NOTES
            FunctionName : Get-ForestInfo
            Created by   : jspatton
            Date Coded   : 03/14/2012 15:56:29
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ForestInfo
    #>
    [CmdletBinding()]
    Param
    (
        [string]$TargetDomain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
    )
    Begin {
        $ContextType = "Forest"
        Write-Verbose "Creating the Forest context to pass to the GetForest method"
        $ForestContext = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext($ContextType, $TargetDomain)
    }
    Process {
        Write-Verbose "Call GetForest to return information aobut the specified TargetDomain: $($TargetDomain)"
        $Forest = [system.directoryservices.activedirectory.Forest]::GetForest($ForestContext)
    }
    End {
        Return $Forest
    }
}
Function ConvertFrom-Sid {
    <#
        .SYNOPSIS
            Convert a Sid byte array to a string
        .DESCRIPTION
            This function takes the Sid as a byte array and returns it as an
            object that has the Sid as a string.
        .PARAMETER ObjectSid
            This is a Sid object, these are usually stored in a binary form inside
            the object in Active Directory. When displayed they typically appear to
            be a column of numbers like this:

                1
                5
                0
                0
                0
                0
                0
                5
                21
                0
                0
                0
                209
                218
                116
                3
                253
                55
                66
                64
                130
                139
                166
                40
                196
                109
                2
                0
                0
            This is converted to an object of type System.Security.Principal.IdentityReference.
        .EXAMPLE
            ConvertFrom-Sid -ObjectSid $Sid

            BinaryLength AccountDomainSid                       Value
            ------------ ----------------                       -----
                      28 S-1-5-21-57989841-1078081533-682003330 S-1-5-21-57989841-1078081533-682003330-159172

            Description
            -----------
            This is the basic syntax of the command and shows the default output.

        .EXAMPLE
            (ConvertFrom-Sid -ObjectSid $Computer.objectSid).Value

            S-1-5-21-57989841-1078081533-682003330-159172

            Description
            -----------
            This example shows how to display just the Sid as a string.

        .NOTES
            FunctionName : ConvertFrom-Sid
            Created by   : jspatton
            Date Coded   : 06/26/2012 09:41:02
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertFrom-Sid
    #>
    [CmdletBinding()]
    Param
    (
        $ObjectSid
    )
    Begin {
        $ErrorActionPreference = 'Stop'
    }
    Process {
        try {
            $Sid = New-Object System.Security.Principal.SecurityIdentifier($ObjectSid[0], 0)
            Return $Sid
        }
        catch {
            $Message = $Error[0].Exception
            Return $Message
        }
    }
    End {
    }
}
Function ConvertTo-Sid {
    <#
        .SYNOPSIS
            Convert a string Sid back to a byte array
        .DESCRIPTION
            This function takes the Sid as a string and converts it back to a byte array
            that can be used by other functions which may be looking for the Sid as
            a byte.
        .PARAMETER StringSid
            A string representation of a Sid object, for example:

                S-1-5-21-57989841-1078081533-682003330
        .EXAMPLE
            ConvertTo-Sid -StringSid S-1-5-21-57989841-1078081533-682003330

            BinaryLength AccountDomainSid                       Value
            ------------ ----------------                       -----
                      28 S-1-5-21-57989841-1078081533-682003330 S-1-5-21-57989841-1078081533-682003330-233119

            Description
            -----------

        .NOTES
            FunctionName : ConvertTo-Sid
            Created by   : jspatton
            Date Coded   : 06/26/2012 09:41:06
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Sid
    #>
    [CmdletBinding()]
    Param
    (
        [string]$StringSid
    )
    Begin {
        $ErrorActionPreference = 'Stop'
    }
    Process {
        try {
            $Sid = New-Object System.Security.Principal.SecurityIdentifier($StringSid)
            Return $Sid
        }
        catch {
            $Message = $Error[0].Exception
            Return $Message
        }
    }
    End {
    }
}
Function ConvertTo-Accountname {
    <#
        .SYNOPSIS
            Return the accountname from the SID
        .DESCRIPTION
            This function returns the accountname from the underlying SID of an object
            in Active Directory.
        .PARAMETER ObjectSid
            This needs to ne a security principal object
        .EXAMPLE
            ConvertTo-Accountname -ObjectSID (ConvertFrom-Sid -ObjectSid $me.objectsid)

            Value
            -----
            HOME\jspatton

            Description
            -----------
            This example shows how to use the function to convert a security principal object
            to the underlying account name.
        .NOTES
            FunctionName : ConvertTo-Accountname
            Created by   : jspatton
            Date Coded   : 06/26/2012 14:24:49
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Accountname
    #>
    [CmdletBinding()]
    Param
    (
        [System.Security.Principal.IdentityReference]$ObjectSid
    )
    Begin {
        $ErrorActionPreference = 'Stop'
    }
    Process {
        try {
            $AccountName = $ObjectSid.Translate([System.Security.Principal.NTAccount])
            Return $AccountName
        }
        catch {
            $Message = $Error[0].Exception
            Return $Message
        }
    }
    End {
    }
}
Function Get-Fqdn {
    <#
        .SYNOPSIS
            A simple function to return the FQDN from a distinguishedName
        .DESCRIPTION
            This function converts the distinguishedName into a proper
            FQDN (Fully Qualified Domain Name).
        .PARAMETER DistinguishedName
            A proper dn, for example:
                DC=Company,DC=com
        .EXAMPLE
            Get-Fqdn -DistinguishedName 'DC=Company,DC=com'
            Company.com

            Description
            -----------
            This is the only syntax for this command.
        .NOTES
            FunctionName : Get-Fqdn
            Created by   : jspatton
            Date Coded   : 06/29/2012 16:32:23
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-Fqdn
    #>
    [CmdletBinding()]
    Param
    (
        [string]$DistinguishedName = ([adsi]"").DistinguishedName
    )
    Begin {
    }
    Process {
        $DnPart = $DistinguishedName.Split(',')
        foreach ($Attrib in $DnPart) {
            if ($Counter -ne ($DnPart.Count) - 1) {
                $Fqdn += $Attrib.Substring(3, $Attrib.Length - 3) + '.'
            }
            else {
                $Fqdn += $Attrib.Substring(3, $Attrib.Length - 3)
            }
            $Counter += 1
        }
    }
    End {
        Return $Fqdn
    }
}
Function ConvertTo-Rfc1779 {
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            FunctionName : ConvertTo-Rfc1779
            Created by   : jspatton
            Date Coded   : 07/24/2012 16:06:10
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Rfc1779
        .LINK
            http://msdn.microsoft.com/en-us/library/aa706049(v=vs.85)
        .LINK
            http://msdn.microsoft.com/en-us/library/aa772267(v=vs.85).aspx
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [ValidateSet(1, 2, 3)]
        [int]$InitType = 3,
        [string]$ConnectionObject
    )
    Begin {
        $AdsNameType = 4
        $ReturnType = 1

        if ($Name.IndexOf('cn=') -ne -1) { $AdsNameType = 1 }
        if ($Name.IndexOf('/') -ne -1) { $AdsNameType = 2 }
        if ($Name.IndexOf('\') -ne -1) { $AdsNameType = 3 }
        if ($Name.IndexOf('@') -ne -1) { $AdsNameType = 5 }
        if ($Name.IndexOf('{') -ne -1) { $AdsNameType = 7 }

        if (($InitType -eq 1) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to domain'
            $ConnectionObject = ([adsi]"").Name
        }
        if (($InitType -eq 2) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to dc'
            $Forest = [system.directoryservices.activedirectory.forest]::GetCurrentForest()
            $ConnectionObject = $Forest.SchemaRoleOwner.Name
        }
        if ($InitType -eq 3) { $ConnectionObject = $null }
    }
    Process {
        $NameTranslate = New-Object -ComObject NameTranslate
        $type = $NameTranslate.GetType()
        $type.InvokeMember("Init", "InvokeMethod", $null, $NameTranslate, ($InitType, $ConnectionObject))
        $type.InvokeMember("Set", "InvokeMethod", $null, $NameTranslate, ($AdsNameType, $Name))
        try {
            $NameTranslated = $type.InvokeMember("Get", "InvokeMethod", $null, $NameTranslate, $ReturnType)
            $ADS_NAME_TYPE_1779 = New-Object -TypeName PSObject -Property @{
                Name          = $Name
                ADS_NAME_TYPE = $AdsNameType
                Value         = $NameTranslated
            }
        }
        catch {
            Write-Error $Error[0]
            break
        }
    }
    End {
        Return $ADS_NAME_TYPE_1779
    }
}
Function ConvertTo-Canonical {
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            FunctionName : ConvertTo-Canonical
            Created by   : jspatton
            Date Coded   : 07/24/2012 16:57:11
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Canonical
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [ValidateSet(1, 2, 3)]
        [int]$InitType = 3,
        [string]$ConnectionObject
    )
    Begin {
        $AdsNameType = 4
        $ReturnType = 2

        if ($Name.IndexOf('dc=') -ne -1) { $AdsNameType = 1 }
        if ($Name.IndexOf('/') -ne -1) { $AdsNameType = 2 }
        if ($Name.IndexOf('\') -ne -1) { $AdsNameType = 3 }
        if ($Name.IndexOf('@') -ne -1) { $AdsNameType = 5 }
        if ($Name.IndexOf('{') -ne -1) { $AdsNameType = 7 }

        if (($InitType -eq 1) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to domain'
            $ConnectionObject = ([adsi]"").Name
        }
        if (($InitType -eq 2) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to dc'
            $Forest = [system.directoryservices.activedirectory.forest]::GetCurrentForest()
            $ConnectionObject = $Forest.SchemaRoleOwner.Name
        }
        if ($InitType -eq 3) { $ConnectionObject = $null }
    }
    Process {
        $NameTranslate = New-Object -ComObject NameTranslate
        $type = $NameTranslate.GetType()
        $type.InvokeMember("Init", "InvokeMethod", $null, $NameTranslate, ($InitType, $ConnectionObject))
        $type.InvokeMember("Set", "InvokeMethod", $null, $NameTranslate, ($AdsNameType, $Name))
        try {
            $NameTranslated = $type.InvokeMember("Get", "InvokeMethod", $null, $NameTranslate, $ReturnType)
            $ADS_NAME_TYPE_CANONICAL = New-Object -TypeName PSObject -Property @{
                Name          = $Name
                ADS_NAME_TYPE = $AdsNameType
                Value         = $NameTranslated
            }
        }
        catch {
            Write-Error $Error[0]
            break
        }
    }
    End {
        Return $ADS_NAME_TYPE_CANONICAL
    }
}
Function ConvertTo-Nt4 {
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            FunctionName : ConvertTo-Nt4
            Created by   : jspatton
            Date Coded   : 07/24/2012 16:57:30
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Nt4
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [ValidateSet(1, 2, 3)]
        [int]$InitType = 3,
        [string]$ConnectionObject
    )
    Begin {
        $AdsNameType = 4
        $ReturnType = 3

        if ($Name.IndexOf('cn=') -ne -1) { $AdsNameType = 1 }
        if ($Name.IndexOf('/') -ne -1) { $AdsNameType = 2 }
        if ($Name.IndexOf('\') -ne -1) { $AdsNameType = 3 }
        if ($Name.IndexOf('@') -ne -1) { $AdsNameType = 5 }
        if ($Name.IndexOf('{') -ne -1) { $AdsNameType = 7 }

        if (($InitType -eq 1) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to domain'
            $ConnectionObject = ([adsi]"").Name
        }
        if (($InitType -eq 2) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to dc'
            $Forest = [system.directoryservices.activedirectory.forest]::GetCurrentForest()
            $ConnectionObject = $Forest.SchemaRoleOwner.Name
        }
        if ($InitType -eq 3) { $ConnectionObject = $null }
    }
    Process {
        $NameTranslate = New-Object -ComObject NameTranslate
        $type = $NameTranslate.GetType()
        $type.InvokeMember("Init", "InvokeMethod", $null, $NameTranslate, ($InitType, $ConnectionObject))
        $type.InvokeMember("Set", "InvokeMethod", $null, $NameTranslate, ($AdsNameType, $Name))
        try {
            $NameTranslated = $type.InvokeMember("Get", "InvokeMethod", $null, $NameTranslate, $ReturnType)
            $ADS_NAME_TYPE_NT4 = New-Object -TypeName PSObject -Property @{
                Name          = $Name
                ADS_NAME_TYPE = $AdsNameType
                Value         = $NameTranslated
            }
        }
        catch {
            Write-Error $Error[0]
            break
        }
    }
    End {
        Return $ADS_NAME_TYPE_NT4
    }
}
Function ConvertTo-Upn {
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            FunctionName : ConvertTo-Upn
            Created by   : jspatton
            Date Coded   : 07/24/2012 16:58:06
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Upn
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [ValidateSet(1, 2, 3)]
        [int]$InitType = 3,
        [string]$ConnectionObject
    )
    Begin {
        $AdsNameType = 4
        $ReturnType = 9

        if ($Name.IndexOf('cn=') -ne -1) { $AdsNameType = 1 }
        if ($Name.IndexOf('/') -ne -1) { $AdsNameType = 2 }
        if ($Name.IndexOf('\') -ne -1) { $AdsNameType = 3 }
        if ($Name.IndexOf('@') -ne -1) { $AdsNameType = 5 }
        if ($Name.IndexOf('{') -ne -1) { $AdsNameType = 7 }

        if (($InitType -eq 1) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to domain'
            $ConnectionObject = ([adsi]"").Name
        }
        if (($InitType -eq 2) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to dc'
            $Forest = [system.directoryservices.activedirectory.forest]::GetCurrentForest()
            $ConnectionObject = $Forest.SchemaRoleOwner.Name
        }
        if ($InitType -eq 3) { $ConnectionObject = $null }
    }
    Process {
        $NameTranslate = New-Object -ComObject NameTranslate
        $type = $NameTranslate.GetType()
        $type.InvokeMember("Init", "InvokeMethod", $null, $NameTranslate, ($InitType, $ConnectionObject))
        $type.InvokeMember("Set", "InvokeMethod", $null, $NameTranslate, ($AdsNameType, $Name))
        try {
            $NameTranslated = $type.InvokeMember("Get", "InvokeMethod", $null, $NameTranslate, $ReturnType)
            $ADS_NAME_TYPE_USER_PRINCIPAL_NAME = New-Object -TypeName PSObject -Property @{
                Name          = $Name
                ADS_NAME_TYPE = $AdsNameType
                Value         = $NameTranslated
            }
        }
        catch {
            Write-Error $Error[0]
            break
        }
    }
    End {
        Return $ADS_NAME_TYPE_USER_PRINCIPAL_NAME
    }
}
Function ConvertTo-Guid {
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            FunctionName : ConvertTo-Guid
            Created by   : jspatton
            Date Coded   : 07/24/2012 16:58:46
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Guid
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [ValidateSet(1, 2, 3)]
        [int]$InitType = 3,
        [string]$ConnectionObject
    )
    Begin {
        $AdsNameType = 4
        $ReturnType = 7

        if ($Name.IndexOf('cn=') -ne -1) { $AdsNameType = 1 }
        if ($Name.IndexOf('/') -ne -1) { $AdsNameType = 2 }
        if ($Name.IndexOf('\') -ne -1) { $AdsNameType = 3 }
        if ($Name.IndexOf('@') -ne -1) { $AdsNameType = 5 }
        if ($Name.IndexOf('{') -ne -1) { $AdsNameType = 7 }

        if (($InitType -eq 1) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to domain'
            $ConnectionObject = ([adsi]"").Name
        }
        if (($InitType -eq 2) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to dc'
            $Forest = [system.directoryservices.activedirectory.forest]::GetCurrentForest()
            $ConnectionObject = $Forest.SchemaRoleOwner.Name
        }
        if ($InitType -eq 3) { $ConnectionObject = $null }
    }
    Process {
        $NameTranslate = New-Object -ComObject NameTranslate
        $type = $NameTranslate.GetType()
        $type.InvokeMember("Init", "InvokeMethod", $null, $NameTranslate, ($InitType, $ConnectionObject))
        $type.InvokeMember("Set", "InvokeMethod", $null, $NameTranslate, ($AdsNameType, $Name))
        try {
            $NameTranslated = $type.InvokeMember("Get", "InvokeMethod", $null, $NameTranslate, $ReturnType)
            $ADS_NAME_TYPE_GUID = New-Object -TypeName PSObject -Property @{
                Name          = $Name
                ADS_NAME_TYPE = $AdsNameType
                Value         = $NameTranslated
            }
        }
        catch {
            Write-Error $Error[0]
            break
        }
    }
    End {
        Return $ADS_NAME_TYPE_GUID
    }
}
Function ConvertTo-Display {
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            FunctionName : ConvertTo-Display
            Created by   : jspatton
            Date Coded   : 07/24/2012 16:58:55
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#ConvertTo-Display
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [ValidateSet(1, 2, 3)]
        [int]$InitType = 3,
        [string]$ConnectionObject
    )
    Begin {
        $AdsNameType = 4
        $ReturnType = 4

        if ($Name.IndexOf('cn=') -ne -1) { $AdsNameType = 1 }
        if ($Name.IndexOf('/') -ne -1) { $AdsNameType = 2 }
        if ($Name.IndexOf('\') -ne -1) { $AdsNameType = 3 }
        if ($Name.IndexOf('@') -ne -1) { $AdsNameType = 5 }
        if ($Name.IndexOf('{') -ne -1) { $AdsNameType = 7 }

        if (($InitType -eq 1) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to domain'
            $ConnectionObject = ([adsi]"").Name
        }
        if (($InitType -eq 2) -and ($ConnectionObject -eq "")) {
            Write-Output 'setting connectionobject to dc'
            $Forest = [system.directoryservices.activedirectory.forest]::GetCurrentForest()
            $ConnectionObject = $Forest.SchemaRoleOwner.Name
        }
        if ($InitType -eq 3) { $ConnectionObject = $null }
    }
    Process {
        $NameTranslate = New-Object -ComObject NameTranslate
        $type = $NameTranslate.GetType()
        $type.InvokeMember("Init", "InvokeMethod", $null, $NameTranslate, ($InitType, $ConnectionObject))
        $type.InvokeMember("Set", "InvokeMethod", $null, $NameTranslate, ($AdsNameType, $Name))
        try {
            $NameTranslated = $type.InvokeMember("Get", "InvokeMethod", $null, $NameTranslate, $ReturnType)
            $ADS_NAME_TYPE_DISPLAY = New-Object -TypeName PSObject -Property @{
                Name          = $Name
                ADS_NAME_TYPE = $AdsNameType
                Value         = $NameTranslated
            }
        }
        catch {
            Write-Error $Error[0]
            break
        }
    }
    End {
        Return $ADS_NAME_TYPE_DISPLAY
    }
}
Function Get-GpoLink {
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            FunctionName : Get-GpoLink
            Created by   : jspatton
            Date Coded   : 08/20/2012 14:44:26
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-GpoLink
    #>
    [CmdletBinding()]
    Param
    (
        [string]$Gpo,
        [switch]$Path
    )
    Begin {
        $AdsPath = "LDAP://" + ([adsi]"").distinguishedName
        if ($Path) {
            if ($Gpo -notmatch "LDAP://*") {
                $SearchFilter = "(gPlink=[LDAP://$($GPO);0])"
            }
            else {
                $SearchFilter = "(gPlink=[$($GPO);0])"
            }
        }
        else {
            $SearchFilter = "(gplink=[*$($Gpo)*;0])"
        }
    }
    Process {
        Try {
            $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry($ADSPath)
            $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher
            $DirectorySearcher.SearchRoot = $DirectoryEntry
            $DirectorySearcher.PageSize = 1000
            $DirectorySearcher.Filter = $SearchFilter
            $DirectorySearcher.SearchScope = "Subtree"

            $GpoLink = $DirectorySearcher.FindAll()
        }
        catch {
            throw $_
        }

    }
    End {
        Return $GpoLink
    }
}
Function Get-NetlogonLog {
    <#
        .SYNOPSIS
            Parse the netlogon.log file
        .DESCRIPTION
            This function will read in the netlogon.log file and return a properly
            formatted object. A regex is used to split up each line of the file and
            build fields for the returned output.

            Some entries in the log will have an octal code, this code if found is
            processed and a definition is returned as part of the object.
        .PARAMETER Logpath
            The path to where netlogon.log can be found, this is set to the default
            location

            C:\Windows\Debug\netlogon.log
        .PARAMETER DebugLog
            This switch if present directs the script to parse the debug version of
            the log as opposed to what normally shows up in the log.
        .EXAMPLE
            Get-NetlogonLog
            Date  Time     Message         Computer        Address
            ----  ----     -------         --------        -------
            10/13 15:08:30 NO_CLIENT_SITE: EBL2006         169.147.3.25
            10/13 15:38:30 NO_CLIENT_SITE: EBL2006         169.147.3.25
            10/13 16:08:30 NO_CLIENT_SITE: EBL2006         169.147.3.25

            Description
            -----------
            This example shows the basic syntax of the command when parsing a regular
            log file.
        .EXAMPLE
            Get-NetlogonLog -DebugLog

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
        .NOTES
            FunctionName : Get-NetlogonLog
            Created by   : jspatton
            Date Coded   : 11/08/2012 15:24:47

            You will need to be at an elevated prompt in order for this to work properly.
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-NetlogonLog
    #>
    [CmdletBinding()]
    Param
    (
        [string]$LogPath = "C:\Windows\Debug\netlogon.log",
        [switch]$DebugLog
    )
    Begin {
        $Codes = @{
            "0x0"        = "Successful Login"
            "0xC0000064" = "The specified user does not exist"
            "0xC000006A" = "The value provided as the current password is not correct"
            "0xC000006C" = "Password policy not met"
            "0xC000006D" = "The attempted logon is invalid due to bad user name"
            "0xC000006E" = "User account restriction has prevented successful login"
            "0xC000006F" = "The user account has time restrictions and may not be logged onto at this time"
            "0xC0000070" = "The user is restricted and may not log on from the source workstation"
            "0xC0000071" = "The user account's password has expired"
            "0xC0000072" = "The user account is currently disabled"
            "0xC000009A" = "Insufficient system resources"
            "0xC0000193" = "The user's account has expired"
            "0xC0000224" = "User must change his password before he logs on the first time"
            "0xC0000234" = "The user account has been automatically locked"
        }

        if ($DebugLog) {
            [regex]$regex = "^(?<Date>\d{1,2}/\d{1,2})\s{1}(?<Time>\d{1,2}:\d{1,2}:\d{1,2})\s{1}(?<Type>\[[A-Z]*\])\s{1}(?<Message>.*)"
            [regex]$Code = "(?<Code>(\d{1}[x]\d{1})|(\d{1}[x]{1}[C]{1}\d{1,}))"
        }
        else {
            [regex]$regex = "^(?<Date>\d{1,2}/\d{1,2})\s{1}(?<Time>\d{1,2}:\d{1,2}:\d{1,2})\s{1}(?<Message>.*[:])\s{1}(?<Computer>[-a-zA-Z0-9_']{1,15})\s{1}(?<Address>(?:\d{1,3}\.){3}\d{1,3})"
        }        $Object = @()
    }
    Process {
        foreach ($Line in (Get-Content $LogPath)) {
            Write-Verbose "Parse each line of the file to build object"
            $Line -match $regex | Out-Null
            if ($DebugLog) {
                $Item = New-Object -TypeName psobject -Property @{
                    Date    = $Matches.Date
                    Time    = $Matches.Time
                    Type    = $Matches.Type.Replace('[', '').Replace(']', '')
                    Message = $Matches.Message
                }

                Write-Verbose "Check to see if the Message contains a code"
                $Item.Message -match $Code | Out-Null
                if ($Matches.Code) {
                    Write-Verbose "Code found, adding definition to message"
                    $Item.Message += " : $($Codes.Item($Matches.Code))"
                }
                $Object += $Item | Select-Object -Property Date, Time, Type, Message
            }
            else {
                $Item = New-Object -TypeName psobject -Property @{
                    Date     = $Matches.Date
                    Time     = $Matches.Time
                    Message  = $Matches.Message.Replace(':', '')
                    Computer = $Matches.Computer
                    Address  = $Matches.Address
                }
                $Object += $Item | Select-Object -Property Date, Time, Message, Computer, Address
            }
        }
    }
    End {
        Write-Verbose "Returning parse logfile"
        Return $Object
    }
}
Function Set-NetlogonDebugging {
    <#
        .SYNOPSIS
            This function enables/disables debugging on the netlogon service
        .DESCRIPTION
            This function enables/disables debugging on the netlogon service when passed the
            Enable switch. When not present this has the effect of turning off debugging.

            Please see the support article under the related links section.
        .PARAMETER Enable
            This parameter if present will enable debugging.
        .EXAMPLE
            Set-NetlogonDebugging -Enable

            Description
            -----------
            This example shows how to turn on debugging.
        .EXAMPLE
            Set-NetlogonDebugging

            Description
            -----------
            This example shows how to turn off debugging.
        .NOTES
            FunctionName : Set-NetlogonDebugging
            Created by   : jspatton
            Date Coded   : 11/08/2012 15:51:51

            You may need to run this from an elevated prompt.
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-NetlogonDebugging
        .LINK
            http://support.microsoft.com/kb/109626
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    Param
    (
        [switch]$Enable
    )
    Begin {
    }
    Process {
        try {
            if ($PSCmdlet.ShouldProcess()) {
                if ($Enable) {
                    Write-Verbose "Running : nltest /dbflag:0x2080ffff"
                    (& nltest /dbflag:0x2080ffff)
                    Restart-Service -Name netlogon -Force
                }
                else {
                    Write-Verbose "Running : nltest /dbflag:0x0"
                    (& nltest /dbflag:0x0)
                    Restart-Service -Name netlogon -Force
                }
            }
        }
        catch {
            Write-Error $Error[0]
            break
        }
    }
    End {
    }
}
Function Enable-OUProtectedMode {
    <#
        .SYNOPSIS
            Turn on the protect object from accidental deletion bit
        .DESCRIPTION
            This function will accept one or more ldap OU path's from the pipline and set its and its
            childrens accidental deletetion bit to on. It does this by setting the Delete and Deletetree
            right to Deny for the group Everyone.

            The end result is that you should see once this function runs, that the checkbox on the object
            property page for the OU is checked for, protect this object from accidental deletion.
        .PARAMETER OU
            This is one or more paths in the form of LDAP://OU=Servers,DC=company,DC=com, if LDAP:// is not
            specified in the path it is added, if it is sent in lowercase it is upper cased so the
            function will work properly.
        .EXAMPLE
            "LDAP://OU=Servers,DC=company,DC=com","OU=Workstations,DC=company,DC=com" |Enable-OUProtectedMode

            Description
            -----------
            This example shows how to pass in multiple OU's on the pipeline.
        .EXAMPLE
            Get-ADOrganizationalUnit -SearchBase "ou=workstations,dc=copmany,dc=com" -Filter "*"
                |Select-Object -ExpandProperty DistinguishedName |Enable-OUProtectedMode

            Description
            -----------
            This example shows using a builtin AD Cmdlet to return all OU's from a specified SearchBase and
            pass the result to Enable-OUProtectedMode. The end result is that all of the provided OU's will
            have their security set to prevent accidental deletion.
        .NOTES
            FunctionName : Enable-OUProtectedMode
            Created by   : jspatton
            Date Coded   : 08/21/2013 14:17:46
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Enable-OUProtectedMode
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$OU
    )
    Begin {
        $Deny = [System.Security.AccessControl.AccessControlType]::Deny
        $Delete = [System.DirectoryServices.ActiveDirectoryRights]::Delete
        $DeleteTree = [System.DirectoryServices.ActiveDirectoryRights]::DeleteTree

        $Everyone = New-Object -TypeName System.Security.Principal.NTAccount -ArgumentList "", "Everyone"
    }
    Process {
        try {
            if ($OU -notmatch "LDAP://*") {
                $OU = "LDAP://$($OU)"
            }
            $ldapUrl = $OU.ToString().ToUpper()

            $ldapPath = [ADSI]$ldapUrl
            $Security = $ldapPath.psbase.ObjectSecurity

            $DeleteRule = New-Object -TypeName System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $Everyone, $Delete, $Deny
            $Security.AddAccessRule($DeleteRule)
            $ldapPath.CommitChanges()

            $DeleteTreeRule = New-Object -TypeName System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $Everyone, $DeleteTree, $Deny
            $Security.AddAccessRule($DeleteTreeRule)
            $ldapPath.CommitChanges()
        }
        catch {
            $MyError = $Error[0]
        }
    }
    End {
        if ($MyError) {
            Write-Error $MyError
            return
        }
    }
}