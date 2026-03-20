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

### Term Not Recogised Error
Similar to Bad command or file name.

Find the correct command with wildcarding
```PowerShell
Get-Command Get-Pr*
```


## PowerShell Cmdlets


### Commandly Used Cmdlets

### Objects & Attributes

### Variables, Arrays & Hash Tables

### Modules Introduction

### Error Messages

### Custom Error Messages 


