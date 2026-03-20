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
> Google search of command will take you to better Microsoft dccumentation with examples.


**PowerShell ISE and ISE Mode in Visual Studio Code**

PowerShell ISE (Integrated Scripting Environment) is a tool that divides the window into three sections. It allows for creating PowerShell scripts, provides a PowerShell window, and displays a listing of cmdlets with helpful details and autocomplete suggestions.

* In VSCode ```Toggle ISE Mode``` will emulate PowerShell Intergrated Scripting Environment and show cmdlets on the left that opens help in browser.
* Tab command completion in the PowerShell terminal

### Predicting Command Behaviour
```PowerShell
owerShell> Stop-Process 15078 -WhatIf
What if: Performing the operation "Stop-Process" on target "zsh (15078)".
```
```-WhatIf``` shows what would happen if you execute the command


```PowerShell
owerShell> Stop-Process 15078 --Confirm
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

Find the correct command with wildcarding
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

### Modules Introduction

### Error Messages

### Custom Error Messages 


