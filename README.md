# Dockerized UiPath Robot

A Docker image containing the UiPath Robot and the UiPath Orchestratro API Powershell module. Intended purpose to be used as part of a CI/CD pipeline.

## Content

1. A cfn template which creates a stack provisioning an ECR (Elastic Container Registry) and a role which allows an EC2 instance access to this registry
2. A Dockerfile which builds a dockerized UiRobot along with the UiPath Powershell module 

## Deployment

### Prerequisites
* Docker is needed for building the docker image
* AWS Powershell module needs to be installed for uploading the docker image to the ECR; credentials 

### Create the ECR stack
The first step is to create the stack containing the `Repository` and the `IAM Role` the EC2 instance will assume in order to use the Docker Repository (`ECR`) API.

```cmd
aws cloudformation create-stack --stack-name docker-image-repository --template-body file://image-repository.yaml --parameters file://parameters.json --capabilities CAPABILITY_IAM 
``` 
Subsequent calls to update the stack, if the template is modified:

```cmd
aws cloudformation update-stack --stack-name docker-image-repository --template-body file://image-repository.yaml --parameters file://parameters.json --capabilities CAPABILITY_NAMED_IAM 
``` 

__The `docker-image-repository` stack also creates a Role which should be assumed by the EC2 Instance which builds the Docker container__

### Create and upload the Docker image

For easy use of `build-image.ps1` it is recommended that the actual docker image is performed on an EC2 instance. In this case, the Role created by the stack should be assigned to the EC2 instance, to be assumed at runtime.
```cmd
 powershell -file build-image.ps1
```
