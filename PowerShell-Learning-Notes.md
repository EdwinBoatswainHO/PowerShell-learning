# PowerShell Learning Notes

Based on the O'Reilly course: <br>

[Practical Windows PowerShell Scripting, 2nd Edition <br>
Brien Posey<br>](https://learning.oreilly.com/course/practical-windows-powershell/9780137905256/)


## Basic Syntax
cmdlet - official name for PowerShell commands

Verb-Noun combination
<br>e.g.
```PowerShell
Get-Service
Get-Process
Get-Process OneDrive
Stop-Service
Start-Service
```
```console
PowerShell> Get-Process OneDrive

 NPM(K)    PM(M)      WS(M)     CPU(s)      Id  SI ProcessName
 ------    -----      -----     ------      --  -- -----------
      0     0.00     135.89      15.17    3033   1 OneDrive

```

### Getting Help

** Get all cmdlets that start with Get **

```PowerShell 
Get-Command Get-*
```

**Get all cmdlets relating to processes**

```console
PowerShell> Get-Command *-Process

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Debug-Process                                      7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Get-Process                                        7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Start-Process                                      7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Stop-Process                                       7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Switch-Process                                     7.6.0.0    Microsoft.PowerShell.Core
Cmdlet          Wait-Process                                       7.0.0.0    Microsoft.PowerShell.Management
```

**Get Help about commands**

```PowerShell
PowerShell> Get-Help Get-Process 

NAME
    Get-Process
    
SYNTAX
    Get-Process [[-Name] <string[]>] [-Module] [-FileVersionInfo] [<CommonParameters>]
    
    Get-Process [[-Name] <string[]>] -IncludeUserName [<CommonParameters>]
    
    Get-Process -Id <int[]> [-Module] [-FileVersionInfo] [<CommonParameters>]
    
    Get-Process -Id <int[]> -IncludeUserName [<CommonParameters>]
    
    Get-Process -InputObject <Process[]> [-Module] [-FileVersionInfo] [<CommonParameters>]
    
    Get-Process -InputObject <Process[]> -IncludeUserName [<CommonParameters>]
    

ALIASES
    gps
    

REMARKS
    Get-Help cannot find the Help files for this cmdlet on this computer. It is displaying only partial help.
        -- To download and install Help files for the module that includes this cmdlet, use Update-Help.
        -- To view the Help topic for this cmdlet online, type: "Get-Help Get-Process -Online" or
           go to https://go.microsoft.com/fwlink/?LinkID=2096814.
```
> Google search of command will take you to better Microsoft documentation with examples.


**PowerShell ISE and ISE Mode in Visual Studio Code**

PowerShell ISE (Integrated Scripting Environment) is a tool that divides the window into three sections. It allows for creating PowerShell scripts, provides a PowerShell window, and displays a listing of cmdlets with helpful details and autocomplete suggestions.

* In VSCode ```Toggle ISE Mode``` will emulate PowerShell integrated Scripting Environment and show cmdlets on the left that opens help in browser.
* Tab command completion in the PowerShell terminal

### Predicting Command Behaviour
```PowerShell
PowerShell> Stop-Process 15078 -WhatIf
What if: Performing the operation "Stop-Process" on target "zsh (15078)".
```
```-WhatIf``` shows what would happen if you execute the command


```PowerShell
PowerShell> Stop-Process 15078 --Confirm
```
Asks for confirmation before running command

> ***Warning**
This does not work for every command.<br> To list cmdlets that support -WhatIf:
```PowerShell
Get-Command | Where-Object {$_.Definition -Like "*whatif*"}
```

Full help on a command
```PowerShell
Get-Command <Cmdlet> | Select-Object *
```

> Note WhatIf comes before Confirm

```PowerShell
Get-Command <Cmdlet> |  Where-Object {$_.Definition -Like "*confirm*"}
```

### Term Not Recognised Error
Similar to Bad command or file name.

Find the correct command with wildcards
```PowerShell
Get-Command Get-Pr*
```


## PowerShell Cmdlets


### Commonly Used Cmdlets

```PowerShell
Get-Service
PowerShell> Get-Process code | Select-Object ProcessName, CPU
PS /Users/edwin.boatswain/Documents/Learning/PowerShell> Get-Process code | Select-Object *               
```
```Select-Object *``` lets us see all available fields

All things about PowerShell process
```PowerShell
Get-ChildItem <-- like old DIR cmd>
```

DOS commands work
```
cd\
cd Data
md
Copy-Item Data/7-4.htm Data2
```

> Note: Powershell uses path style of host OS for cross compatibility use
```cd (Join-Path $HOME "Desktop")``` to target the Desktop directory under the home directory for example

### Objects & Attributes

```PowerShell
PowerShell> Get-Process pwsh | Select-Object *        

Name                       : pwsh
Id                         : 19648
PriorityClass              : Normal
FileVersion                : 
HandleCount                : 0
WorkingSet                 : 242597888
PagedMemorySize            : 0
PrivateMemorySize          : 0
VirtualMemorySize          : 979009536
TotalProcessorTime         : 00:01:41.4445040
SI                         : 19648
Handles                    : 0
VM                         : 447655608320
WS                         : 242597888
PM                         : 0
NPM                        : 0
Path                       : /opt/homebrew/Cellar/powershell/7.6.0/libexec/pwsh
CommandLine                : 
Parent                     : System.Diagnostics.Process (Code Helper)
Company                    : 
CPU                        : 101.44473
ProductVersion             : 
Description                : 
Product                    : 
__NounName                 : Process
SafeHandle                 : Microsoft.Win32.SafeHandles.SafeProcessHandle
Handle                     : 11448
BasePriority               : 0
ExitCode                   : 
HasExited                  : False
StartTime                  : 20/03/2026 14:13:01
ExitTime                   : 
MachineName                : .
MaxWorkingSet              : 9223372036854775807
MinWorkingSet              : 0
Modules                    : {System.Diagnostics.ProcessModule (pwsh)}
NonpagedSystemMemorySize64 : 0
NonpagedSystemMemorySize   : 0
PagedMemorySize64          : 0
PagedSystemMemorySize64    : 0
PagedSystemMemorySize      : 0
PeakPagedMemorySize64      : 0
PeakPagedMemorySize        : 0
PeakWorkingSet64           : 0
PeakWorkingSet             : 0
PeakVirtualMemorySize64    : 0
PeakVirtualMemorySize      : 0
PriorityBoostEnabled       : False
PrivateMemorySize64        : 0
ProcessorAffinity          : 
SessionId                  : 19648
StartInfo                  : 
Threads                    : {77279712, 1796944096, 1798566112, 1800188128…}
VirtualMemorySize64        : 447655608320
EnableRaisingEvents        : False
StandardInput              : 
StandardOutput             : 
StandardError              : 
WorkingSet64               : 242597888
SynchronizingObject        : 
MainModule                 : System.Diagnostics.ProcessModule (pwsh)
MainWindowHandle           : 0
MainWindowTitle            : 
Responding                 : True
ProcessName                : pwsh
PrivilegedProcessorTime    : 00:01:15.5463000
UserProcessorTime          : 00:00:25.8986730
Site                       : 
Container                  : 
```

Selected Attributes
```PowerShell
PowerShell> Get-Process pwsh | Select-Object Name, Path

Name Path
---- ----
pwsh /opt/homebrew/Cellar/powershell/7.6.0/libexec/pwsh
```

***Format-List vs Format-Table***
```
PowerShell> Get-Date | Select-Object *

DisplayHint : DateTime
DateTime    : Friday, 20 March 2026 14:56:45
Date        : 20/03/2026 00:00:00
Day         : 20
DayOfWeek   : Friday
DayOfYear   : 79
Hour        : 14
Kind        : Local
Millisecond : 77
Microsecond : 711
Nanosecond  : 0
Minute      : 56
Month       : 3
Second      : 45
Ticks       : 639096154050777110
TimeOfDay   : 14:56:45.0777110
Year        : 2026

PowerShell> Get-Date | Select-Object * | Format-Table

DisplayHint DateTime                       Date                Day DayOfWeek DayOfYear Hour  Kind Millisecond Microsecond
----------- --------                       ----                --- --------- --------- ----  ---- ----------- -----------
   DateTime Friday, 20 March 2026 14:57:54 20/03/2026 00:00:00  20    Friday        79   14 Local         625         476
```

> Shortcuts for format table and format list
`FL` and `FT`

**All virtual machines on a hyper-v server vs specific
```PowerShell
PowerShell> Get-VM -ComputerName HyperV
PowerShell> Get-VM VM1 -ComputerName HyperV
PowerShell> Get-VM -ComputerName HyperV | Select-Object *
```

**Accessing Attributes in Brackets {}**
How to access? 
```PowerShell
PowerShell> Get-VM -ComputerName HyperV | Select-Object -ExpandProperty HardDrives

```

Results in bracketed list expanded to named table e.g.
```PowerShell
PowerShell> Get-Culture | Select-Object Parent, Name  -ExpandProperty OptionalCalendars | Select-Object  Parent,Name, IsReadOnly

Parent Name  IsReadOnly
------ ----  ----------
en     en-GB      False
```

***Select attributes of expanded object***
```
PowerShell> Get-VM -ComputerName HyperV | Select-Object -ExpandProperty HardDrives | Select-Object Name, ID

```

### Variables, Arrays & Hash Tables

#### Variables

Variables always start with `$`
```console
PowerShell>$A = "1"
PowerShell>$A
1
PowerShell> Write-Host $A
1
PowerShell> Write-Host "The value of variable A is $A"
The value of variable A is 1
PowerShell> $B=1
PowerShell> $A + $B
11
PowerShell> $A=1
PowerShell> $B=1
PowerShell> $A + $B
2
PowerShell> $FirstName="Miles"
PowerShell> $LastName="O'Brien"
PowerShell> "$FirstName $LastName"
Miles O'Brien
PowerShell> 
PowerShell> 
PowerShell> 
```

##### Casting
```PowerShell
$A="1"
$B="1"
[Int]$1
1
[Int]$A + [Int]$B
2
```

#### Arrays

You can set variables to numbers, strings and arrays

```PowerShell
PowerShell> $MyArray
A
B
C
D
PowerShell> Write-Host $MyArray                       
A B C D
PowerShell> Write-Host $MyArray[3]
D
```

Cmdlet output assigned to a variable is an array
```
PowerShell> $X=Get-Process
PowerShell> $X[1]         

 NPM(K)    PM(M)      WS(M)     CPU(s)      Id  SI ProcessName
 ------    -----      -----     ------      --  -- -----------
      0     0.00      49.86       0.61     792   1 AccessibilityUIServer
```

#### Hash Tables
```PowerShell
PowerShell> $Months=@{1="January"; 2="February"; 3="March"}
$Months

Name                           Value
----                           -----
3                              March
2                              February
1                              January


PowerShell> $Months.Add(4,"April")                         
PowerShell> $Months                                        

Name                           Value
----                           -----
4                              April
3                              March
2                              February
1                              January

PowerShell> $Months.Remove(4)     
PowerShell> $Months          

Name                           Value
----                           -----
3                              March
2                              February
1                              January

PowerShell> $Months.2        
February
```

### Modules Introduction
Modules makes PowerShell extensible.

Cmdlets for products come in Modules.

How many built in commands do I have?
```PowerShell
PowerShell> $A = Get-Command   
PowerShell> $A.Count
320
```

What modules do I have loaded by default?
```PowerShell
PowerShell> Get-Module  
                                       
ModuleType Version    PreRelease Name                                ExportedCommands
---------- -------    ---------- ----                                ----------------
Manifest   7.0.0.0               Microsoft.PowerShell.Management     {Add-Content, Clear-Content, Clear-Item, Clear-ItemProperty…}
Manifest   7.0.0.0               Microsoft.PowerShell.Utility        {Add-Member, Add-Type, Clear-Variable, Compare-Object…}
Script     0.2.0                 PowerShellEditorServices.Commands   {Clear-Host, ConvertFrom-ScriptExtent, ConvertTo-ScriptExtent, …
Script     2.4.4      beta4      PSReadLine                          {Get-PSReadLineKeyHandler, Get-PSReadLineOption, Remove-PSReadL…

PowerShell> Import-Module Hyper-V
Import-Module: The specified module 'Hyper-V' was not loaded because no valid module file was found in any module directory.
```
##### Cross-platform Modules to play with

```PowerShell
PowerShell> Find-Module -Tag cross-platform | Select-Object Name, Version, Description

Name                                    Version  Description
----                                    -------  -----------
Pode                                    2.12.1   A Cross-Platform PowerShell framework for creating web servers to host REST APIs and Websites. Pode also has support for bein…
PSCompression                           3.1.0    Zip, tar, and string compression utilities for PowerShell!
ClipboardText                           0.1.8    Support for text-based clipboard operations for PowerShell Core (cross-platform) and older versions of Windows PowerShell
Catesta                                 2.27.0   Catesta is a PowerShell module project generator. It uses templates to rapidly scaffold test and build integration for a vari…
POSHTML5                                0.1.5    These functions lets you create an HTML5  web page with dynamic table and charts, easily.
PSClass                                 0.1.0    PowerShell module to help determine class dependencies, and the order to import them
Monocle                                 1.3.4    PowerShell Web Automation module, made to make automating and testing websites easier
BootstrapPowerShellCore                 1.0.6    Functions to install PowerShell Core on a Remote Host. Opitionally configure pwsh PSRemoting on the Remote Host. GitHub: http…
PowerTree                               2.1.2    Advanced directory tree visualization tool with powerful filtering and display options. More information: https://github.com/…
PoshHosts                               0.2.2    PoshHosts is a Cross-Platform module that allows you to control the hosts file from the Command Line
PowerShell.MCP                          1.7.3    The universal MCP server for Claude Code and other MCP-compatible clients. One installation gives AI access to 10,000+ PowerS…
Parcel                                  0.2.0    A Cross-Platform PowerShell package/module installation and provisioning tool.
Pode.Yaml                               1.0.0    A YAML Request and Response parser extension module for the Pode web server (v1.3.0+)
PSPredictor                             1.3.0    Supercharge your command line productivity with intelligent tab completion for 26+ CLI tools. Supports Git, Docker, npm, kube…
EmojiTools                              1.18.5   EmojiTools provides powerful emoji search and management capabilities with local dataset caching, fuzzy search, and safe comm…
SecretManagement.VMware.CloudFoundation 0.2505.7 A Cross-Platform SecretManagement Vault extension for VMware Cloud Foundation.
SmartLogAnalyzer                        1.2.1    SmartLogAnalyzer helps sysadmins and developers parse and analyze logs intelligently across platforms with optional GUI.
PSEpoch                                 0.1.2    PSEpoch is a basic script module for converting between Unix timestamps and DateTime objects in PowerShell Core.
KeyTabTools                             1.3.1    Cross-platform PowerShell utility for generating offline Kerberos keytab files. Supports RC4-HMAC, AES-128, and AES-256 encry…
rwDirTools                              1.1.1    Utilities for selecting and creating directories with interactive and non-interactive modes.
ElektoMailPosh                          0.2.0    Lightweight SMTP email module for PowerShell. Zero dependencies, environment-based configuration, automatic retry with expone…

```

What cmdlets in are posh-git?
```PowerShell
PowerShell> Get-Command -Module posh-git                        
PowerShell> Get-Command |Where-Object {$_.Source -eq "posh-git"}
$PowerShell> A=Get-Command |Where-Object {$_.Source -eq "posh-git"}
PowerShell> $A.Count
```

### Custom Error Messages / Exception handling

```PowerShell
try {
    Invalid-Command
}
catch {
    Write-Host("`r`n ERROR: It looks like a bad command. `r`n")
}

```

```PowerShell 
Invoke-Expression <expr>
``` 
can be used to execute dynamically generated code in a variable. try / catch essential with this.

## Basic Scripting

### Building a script
```
# HelloWorld.ps1
<#
Multiline comments
look like this.
#>

CLS
Write-Host "Hello World!"
```

Basically favourite editor and save as text. Avoid encodings.

### Configuring execution
An execution policy may prevent you from running powershell scripts (Windows probably)

```PowerShell
Get-ExecutionPolicy

Set-ExecutionPolicy Unrestricted
```

You can also choose options to make sure scripts are signed.

```PowerShell
PowerShell> Get-ExecutionPolicy -List

        Scope ExecutionPolicy
        ----- ---------------
MachinePolicy    Unrestricted
   UserPolicy    Unrestricted
      Process    Unrestricted
  CurrentUser    Unrestricted
 LocalMachine    Unrestricted
 ```

### Creating a function

```PowerShell
#HelloWorld2.ps1

Function Show-HelloWorld {
    Write-Host "Hello, World!"
}

CLS
Show-HelloWorld
```

### Silencing Errors
```PowerShell
Get-ChildItem -recurse -ErrorAction SilentlyContinue
```

`Get-Help` on the command shows valid `-ErrorActions`s
```

```PowerShell
PS > $ErrorActionPreference='SilentlyContinue' 
PS > 20/0
PS >
```
Suppress errors for things that aren't cmdlets


### Maths
BODMAS
```PowerShell
# Using .net class
[Math]::Pow(2, 3)
```

Get all the methods in the Math class

```PowerShell
[Math].GetMethods() | Select-Object Name -Unique
```

### Comparisons
```PowerShell
#Comparison Operators
$A -eq $B
$A -ne $B
$A -gt $B
$A -lt $B
$A -ge $B
$A -le $B   

If ($A -ne $B) {
    Write-Host "A and B are not equal."
} Else {
    Write-Host "A and B are equal."
}
```

String Comparisons

```PowerShell
Get-Process | Where-Object {$_Name -Like "*PowerShell* "}
Get-Process | Where-Object {$_Name -NotLike "*PowerShell* "}
Get-Process | Where-Object {$_Name -Match "*PowerShell* "}

$A = "Hello World"
$A -match "World"
# replacement operator
$A -replace "World", "Everyone"
$B = $A -replace "World", "Everyone"

$A = "PowerShell"
$A -ccontains "Shell" # false because has to match
$A -NotContains "Shell" # true because it matches
```

### Assignment 
```PowerShell
$A = 5
$B = "Hello"
$A += 5
$B += " World" # String concatenation
$B *= 2 # String repetition
$A -= 3
$A *= 2
$A /= 4
$A %= 3 # Modulus operator

```

### Logic

```PowerShell
(1 -eq 1 -and 2 -eq 2) # Logical AND
(1 -eq 1 -or 2 -eq 3) # Logical OR
(1 -eq 1 -xor 2 -eq 3) # Logical XOR
-not (1 -eq 2) # Logical NOT    
!(1 -eq 2) # Logical NOT        
```

We saw earlier that we can use these operators on strings.

### Interactive Authentication
Sometimes you need to run a command against a remote system.


```PowerShell
PS> $Cred = Get-Credential

PowerShell credential request
Enter your credentials.
User: Hello
Password for user Hello: *****

PS> echo $Cred 

UserName                     Password
--------                     --------
Hello    System.Security.SecureString

PS> Enter-PSSession -Computername HyperV -Credential $Cred
[HyperV]: PS> Exit-PSSession
```

### Automatic Authentication

```PowerShell
$MyPassword = Read-Host -AsSecureString  | ConvertFrom-SecureString #convert secure string to encrypted
$MyPassword | Out-File -FilePath "MyPassword.txt"

# ...

# Get password from encrypted file
user="UserName"
$File = "MyPassword.txt"
$MyCredential = New-Object System.Management.Automation.PSCredential($user, (Get-Content $File | ConvertTo-SecureString))
$MyCredential.GetNetworkCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString) 

```
