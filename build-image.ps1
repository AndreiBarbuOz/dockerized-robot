Invoke-Expression -Command (Get-ECRLoginCommand -Region us-east-1).Command
$ecr_repo_name = Get-CFNExport | Where-Object {$_.Name -eq 'docker-image-repository-EcrArn'} | Select -ExpandProperty 'Value'

Write-Host $ecr_repo_name

docker build -t uipath-robot .

docker tag uipath-robot:latest "$ecr_repo_name:latest"
docker push "$ecr_repo_name:latest"
