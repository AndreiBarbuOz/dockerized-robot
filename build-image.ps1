param([string]$file_name)

$ecr_repo_name = Get-Content $file_name -Raw
$region = (ConvertFrom-Json (Invoke-WebRequest -Uri http://169.254.169.254/latest/dynamic/instance-identity/document -UseBasicParsing).Content).region
Invoke-Expression -Command (Get-ECRLoginCommand -Region $region).Command

#$ecr_repo_name = Get-CFNExport | Where-Object {$_.Name -eq 'docker-build:ecr-uri'} | Select -ExpandProperty 'Value'

Write-Host $ecr_repo_name

docker build -t uipath-robot .

docker tag uipath-robot:latest $ecr_repo_name':latest'
docker push $ecr_repo_name':latest'
