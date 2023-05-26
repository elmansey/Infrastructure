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

## Installation

1. Navigate to the project directory:

    ```bash
    $ cd Infrastructure 
    ```

2. Run infrastructure-up.sh script to Initialize the Terraform configuration and apply it:

    ```bash
    $  ./infrastructure-up.sh
    ```
![image](https://github.com/elmansey/Infrastructure/assets/89076648/7690de87-08cb-4a88-bd2e-7d8d46b36855)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/a61bf375-ef96-474c-a30d-172a435ad6f1)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/ae8cee4b-48bf-4ec9-b987-1a1f99762c63)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/6f778b65-90c5-4195-acf4-36bc98f22035)

![image](https://github.com/elmansey/Infrastructure/assets/89076648/f459d335-539a-4436-99d3-3167288c29d3)



