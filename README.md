# ansible-tf-aws

> Dynamic application of Nodejs with mongoDB master slave architecture DB resides in three diffrent regions for high Availability 

### Setup Instructions

>clone the repository
```shell
git clone git@github.com:moostoopha/ansible-tf-aws.git
```
> get into the clone Directory
```shell
cd terraform-infra-automation/aws-module
```
> Initialize the Project 
```shell
terraform init
```
> for Validation 
```shell
terraform validate
```
> For checking the Plan 
```shell
terraform plan
```
>Deploy to the Cloud
````shell
terraform apply --auto-approve
````