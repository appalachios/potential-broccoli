FROM microsoft/iis

RUN ["powershell.exe", "Install-WindowsFeature NET-Framework-45-ASPNET"]  
RUN ["powershell.exe", "Install-WindowsFeature Web-Asp-Net45"]

COPY HelloWorld1 HelloWorld
RUN powershell Remove-WebSite -Name 'Default Web Site'
RUN powershell New-Website -Name 'HelloWorld' -Port 80 \  
    -PhysicalPath 'c:\HelloWorld' -ApplicationPool '.NET v4.5'

Expose 80