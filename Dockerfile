# start with Microsoft Server core latest edition
FROM mcr.microsoft.com/windows/servercore:ltsc2019
RUN PowerShell -Command Install-PackageProvider -Name NuGet -Force; \
	Register-PSRepository -Name UiPath -SourceLocation https://www.myget.org/F/uipath-dev/api/v2; \
	Install-Module -Repository UiPath -Name UiPath.Powershell -Force; \
    New-Item -Path "c:\\" -Name "UiPath\\Robot" -ItemType "directory"; \
    Invoke-WebRequest https://download.uipath.com/UiPathStudio.msi -OutFile C:\\UiPath\\UiPathStudio.msi; \
    Start-Process C:\\UiPath\\UiPathStudio.msi -ArgumentList 'ADDLOCAL=DesktopFeature,Robot,Packages APPLICATIONFOLDER=C:\\UiPath\\Robot /quiet' -Wait; \
    Remove-Item c:\\UiPath\\UiPathStudio.msi -Force
WORKDIR C:\\UiPath
CMD ["cmd"]