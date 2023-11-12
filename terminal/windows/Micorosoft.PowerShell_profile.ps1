Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Import-Module Terminal-Icons
Invoke-Expression (&starship init powershell)
Set-Alias -Name bugn -Value 'C:\Users\maxin\Desktop\Repos\Misc\BugN\bug.n-9.0.2\bug.n-9.0.2\bugn.exe'
