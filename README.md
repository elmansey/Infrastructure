# Terraform Build Infrastructure and configure it 

This repository contains the Terraform code to build infrastructure on aws, It includes creating a VPC with public and private subnets, launching EC2 instances in the public subnet as a BastionHost, and creating Private EKS Cluster .


## Overview

This project uses Terraform to create the following AWS resources:

- VPC
- Internet Gateway
- Public Route Table
- Private Route Table
- Public EC2 instance
- NatGateway and ElasticIP 
- Security Groups 
- Node group
- EKS role and policy 
- Node Group Role and Policy 
- EKS Cluster

And use ansible to configure the following:
- Configure machine as BastionHost by installing kubectl and awscli
- Apply jenkins k8s manifests (in kubernetes folder) in cluster to use ansible to deploy jenkins in cluster
- Configure this machine to install prerequisite to able to use it as slave

## Getting Started

To get started with this project, clone this repository to your local machine:

```
$ git clone https://github.com/elmansey/Infrastructure.git
```

## Prerequisites

Before running the deployment script, you will need to have the following:

- AWS account
- Terraform installed on your local machine
- AWS credentials configured on your local machine
- ssh on your local machine to connect to BastionHost to access from it the private cluster
- A Secret Manager in AWS to store aws credentials stored                                   (aws_access_key_id aws_secret_access_key) to but them in bastion host to connect to cluster by it 
- A S3 bucket to store the Terraform state file, and DynamoDB to use for state locking. You can include them in `RemoteBackend.tf`
- Make sure you have boto3 and botocore packages to able to use ansible dynamic inventory 
```
$ pip install boto3 
$ pip install botocore 
```
- Make sure you have Ansible collection `community.kubernetes`  in machine to able to use `k8s` module to allows you to manage Kubernetes resources using Ansible playbooks to use it to deploy Jenkins in cluster 
```
$ ansible-galaxy collection install community.kubernetes
```

## Installation

1. Navigate to the project directory:

    ```bash
    $ cd Infrastructure 
    ```

2. Run Up.sh script to Initialize the Terraform configuration and apply it:

    ```bash
    $  ./Up.sh
    ```

## Steps 

- After run the Up.sh script at the first the terraform infrastracture code will applied in aws .
- Then the ansible role will fired to get the BastionHost ip automatically by ansible dynamic inventory. 
- Then the role will be applied to configre the bastionHost Ec2:
  1. Install some prerequiest backages such as `awscli` to use it to update kubeconfig file and `kubectl` to able to connect to the Cluster from it
  2. Move Jenkins Deployment manifest files to BastionHost by ansible and then apply it by k8s ansible module to deploy jenkins in cluster in jenkins namespace 
  3. Configure the bastion host machine to act in the same time as a slave for jenkins server to run pipeline from it 

## Architecture
![image](https://github.com/elmansey/Infrastructure/assets/89076648/7acab3df-684b-4f92-b012-c62449a57f15)

## Build infrastructure
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9590f163-1b07-406f-8f8f-0d61b84b2736)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/a61bf375-ef96-474c-a30d-172a435ad6f1)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/ae8cee4b-48bf-4ec9-b987-1a1f99762c63)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/6f778b65-90c5-4195-acf4-36bc98f22035)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/f459d335-539a-4436-99d3-3167288c29d3)



## Ansible configuration
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9e9a9c71-0cf0-44d9-8b72-e70edc95a254)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/b73a638a-68d4-443a-8f03-45d210aa705e)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/e810d238-c891-4fca-a5c2-77c1e343f39e)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/0cdf2290-3589-40d2-b1b0-7a50d6e24a3b)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/e1625455-ace9-4ca5-aa08-9c05d0735e87)



## Add slave
![image](https://github.com/elmansey/Infrastructure/assets/89076648/dd17c3b7-42ff-43f8-bb50-7c73a684b270)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/bdba982b-03b3-4e69-b6c8-0e917c4c3cc7)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/d5440759-5efe-43d2-a272-bfbf626d4964)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/e9a38861-9b80-4097-985d-b9007f7473cd)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/e8532b03-93b2-4471-ba52-bfcda4329260)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/7081e7b3-8f68-4dfb-97c2-2941603e26b8)


## Project hierarchy
1. Terraform 
- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/ea7f4462-168f-42e4-b1ba-2945fcd685a3)

- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/0ded8286-d795-4668-a0ee-4ba59324d94b)

2. Ansible
- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/6a30c7bc-dcf6-49f7-bdac-4ada4afb6997)

3. Kubernetes
- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/7f197e29-77b7-4c49-ae85-166adf0c7b79)





## Destroy infrastructure

```bash
$  ./Down.sh
```

## App Rebo That Used At CI CD Stages [here](https://github.com/elmansey/Application)

## Author

- [Abdelrahman Elmansey ](https://www.linkedin.com/in/abdelrahman-elmansey/)