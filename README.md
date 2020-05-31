# UiPath Dockerized Robot for CI/CD pipelines

[![Build Status](https://dev.azure.com/andbarbu0717/UiPath%20Good%20Practices/_apis/build/status/AndreiBarbuOz.dockerized-robot?branchName=master)](https://dev.azure.com/andbarbu0717/UiPath%20Good%20Practices/_build/latest?definitionId=9&branchName=master)

A Docker image containing the UiPath Robot and the UiPath Orchestrator API Powershell module. Intended purpose to be used as part of a CI/CD pipeline.

## Content

* A Dockerfile which builds a dockerized UiRobot along with the UiPath Powershell module 
* The AWS build script, also pushing the image to an ECR repository

## Building the docker image

Test locally with:
```cmd
docker build -t uipath-robot .
```
Run locally with:
```cmd
docker run -it uipath-robot
```

## Building on Azure DevOps

[![architecture](https://www.lucidchart.com/publicSegments/view/b3bd76c8-6f40-4588-b887-f2b87d480e16/image.png)](https://www.lucidchart.com/publicSegments/view/b3bd76c8-6f40-4588-b887-f2b87d480e16/image.png)

1. Create an account with Azure and a subscription within the account.
2. Create a resource group and an Azure Container Registry within the RG.
3. Create a project on Azure DevOps. 
4. Create a starter pipeline within the project, triggered by the GitHub repository hosting the code. Go through the steps to create the service principal on Azure which will allow the Azure DevOps pipeline to push the images to the ACR.
5. `git push -u origin` on branch master to trigger the pipeline and build the dockerized uipath-robot

## Azure devops prerequisites:

A variable named `uipath-cicd` group needs to be defined in the Azure DevOps project, containing at least these 2 variables:
- repositoryName: containing the container repository name
- containerRegistry: containing the container registry connection (can be found on the Project -> service connections page in the DevOps portal)