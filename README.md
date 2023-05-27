# Terraform Build Infrastructure 

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

## Build infrastructure
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9590f163-1b07-406f-8f8f-0d61b84b2736)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/a61bf375-ef96-474c-a30d-172a435ad6f1)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/ae8cee4b-48bf-4ec9-b987-1a1f99762c63)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/6f778b65-90c5-4195-acf4-36bc98f22035)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/f459d335-539a-4436-99d3-3167288c29d3)



## Ansible configuration
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9e9a9c71-0cf0-44d9-8b72-e70edc95a254)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/b73a638a-68d4-443a-8f03-45d210aa705e)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/1bfcd901-af1c-4238-98d0-8a2f0f525bfb)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/8a77d6ed-73df-4499-8514-0589566512fa)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/8c505858-c114-4149-ae48-766ac5e41b62)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/4b8bdd21-91a9-41e7-b578-38c814167c88)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/e4847f40-e204-41c1-a59e-446ddb812c08)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/e15d41de-81be-4379-ba76-0f479211f414)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/24864dfa-e986-4bd9-a59f-0e38b462c5c1)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/c03f9c30-2116-44fa-8fe3-9b09d4313496)

## Destroy infrastructure

```bash
$  ./Down.sh
```

## Author

- [Abdelrahman Elmansey ](https://www.linkedin.com/in/abdelrahman-elmansey/)