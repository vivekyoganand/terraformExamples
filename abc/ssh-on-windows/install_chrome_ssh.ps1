[powershell]
$Path = $env:TEMP; 
$Installer = "chrome_installer.exe"; 
Invoke-WebRequest "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BFC3517F7-7E6A-6353-1146-413A2935A066%7D%26lang%3Den%26browser%3D4%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe" -OutFile $Path\$Installer; 
Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Path\$Installer;
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0;
Set-Service sshd -StartupType Automatic;
Set-Service ssh-agent -StartupType Automatic;
Start-Service sshd;
Start-Service ssh-agent;
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
