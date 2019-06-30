# start with Microsoft Server core latest edition
FROM mcr.microsoft.com/windows/servercore:ltsc2016
RUN PowerShell -Command Install-PackageProvider -Name NuGet -Force
RUN PowerShell -Command Register-PSRepository -Name UiPath -SourceLocation https://www.myget.org/F/uipath-dev/api/v2
RUN PowerShell -Command Install-Module -Repository UiPath -Name UiPath.Powershell -Force
RUN MKDIR C:\\UiPath\\Robot
WORKDIR C:\\UiPath
ADD https://download.uipath.com/UiPathStudio.msi C:\\UiPath
RUN C:\\UiPath\\UiPathStudio.msi ADDLOCAL=DesktopFeature,Robot,Packages APPLICATIONFOLDER=C:\\UiPath\\Robot /quiet
CMD ["cmd"]