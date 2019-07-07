# Dockerized UiPath Robot

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
