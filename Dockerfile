FROM mcr.microsoft.com/windows/servercore:ltsc2019
RUN PowerShell -Command New-Item -Path "C:\\" -ItemType "directory" -Name "UiPath"; \
    Invoke-WebRequest "https://download.uipath.com/UiPathStudio.msi" -OutFile "C:\\UiPathStudio.msi"; \
    Start-Process C:\\UiPathStudio.msi -ArgumentList 'ADDLOCAL=DesktopFeature,Robot,Studio APPLICATIONFOLDER=C:\\UiPath /quiet' -Wait; \
    Remove-Item "C:\\UiPathStudio.msi" -Force; \
    Install-PackageProvider -Name NuGet -Force; \
    Register-PSRepository -Name UiPath -SourceLocation https://www.myget.org/F/uipath-dev/api/v2; \
    Install-Module -Repository UiPath -Name UiPath.Powershell -Force
CMD ["cmd"]
