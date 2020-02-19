# Dockerized UiPath Robot

[![Build Status](https://dev.azure.com/andreibarbu0946/UiPathGoodPractices/_apis/build/status/AndreiBarbuOz.dockerized-robot?branchName=master)](https://dev.azure.com/andreibarbu0946/UiPathGoodPractices/_build/latest?definitionId=11&branchName=master)

A Docker image containing the UiPath Robot and the UiPath Orchestrator API Powershell module. Intended purpose to be used as part of a CI/CD pipeline.

## Content

* A Dockerfile which builds a dockerized UiRobot along with the UiPath Powershell module 
* The AWS build script, also pushing the image to an ECR repository

## Build

Build the docker image with
```cmd
docker build -t uipath-robot .
```

Run the AWS build script with: 
```cmd
 powershell -file build-image.ps1
```

For Azure, create a build pipeline based on `azure-pipelines.yaml`