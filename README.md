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
![image](https://github.com/elmansey/Infrastructure/assets/89076648/fee878e4-99be-4dff-a6e9-5eb80a55cd54)

## Build infrastructure

1. After run the Up.sh script at the first the terraform infrastracture code will applied in aws
![image](https://github.com/elmansey/Infrastructure/assets/89076648/6bf7269b-0a28-433d-bb57-808356e3edb0)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/ee205c00-8174-4f5b-8170-730e2838e6af)



## Ansible configuration
1. Then the ansible role will fired to get the BastionHost ip automatically by ansible dynamic inventory. 
- The first task in role to configre the bastionHost machine by installing some prerequiest backages such as `awscli` to use it to update kubeconfig file and `kubectl` to able to connect to the Cluster from it
![image](https://github.com/elmansey/Infrastructure/assets/89076648/ce94a0db-c7a7-4f22-a58e-32e4cb55322a)


- After BastionHost task finished the second task will fired to Move Jenkins Deployment manifest files to BastionHost by ansible and then apply it by k8s ansible module to deploy jenkins in cluster in jenkins namespace 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/7a101249-1532-4146-9d4a-bd0733858af6)

- After Jenkins task finished the third task will fired to Configure the bastion host machine to act in the same time as a slave for jenkins server to run pipeline from it 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/60715a25-7010-4e4f-b1c1-b5e81e238203)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/2c67f1f1-2984-4df5-85c0-69a3c81ea94e)


## Connect to BastioHost
![image](https://github.com/elmansey/Infrastructure/assets/89076648/62f15d58-198f-4617-bbc6-718658c54337)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9b2a931b-dc26-415a-bdbd-ce6aadd0e59f)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/341d8c1d-a46a-45e2-9a94-ccef6d761f3f)


## Jenkins Up
![image](https://github.com/elmansey/Infrastructure/assets/89076648/21668d5e-088c-49a5-b62c-a99200f861cb)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/96c54ebd-d30d-41bc-af79-22134239a62e)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/8ea368ef-9839-4ae2-818a-f6ae00af9766)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/f1ba571e-d0d5-43de-a18b-22d84dc4debe)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/f9bdf68d-48ce-4e48-b5e4-7f3684bc5f53)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/b1bf0264-1dc7-4e0c-a591-9602341b3ff4)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/39f2c42c-133c-4dd9-9506-0ad27af8865d)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/b2d562cc-f8d9-4569-80e3-aafee3b795e3)



## Add credentials
![image](https://github.com/elmansey/Infrastructure/assets/89076648/edd73a62-87f5-4e6c-913a-faeac6820cbc)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/99251a31-2aa6-475c-8b96-3654b31f0d56)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/daf31851-5c15-4110-bde9-14967ed335f3)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/dd1705e5-ef43-4070-9646-86b3ae8e436f)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/41d773a2-dfd8-4a7d-9cca-8246172e34cd)


## Add slave
![image](https://github.com/elmansey/Infrastructure/assets/89076648/848ee646-83e2-4006-a9de-7ec07fcd9e72)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9fa03e52-60a1-4ce0-badc-a0ff9eab9fdb)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/a1108256-d1df-40bf-bf85-172d0fb94578)


- Get BastionHost public DNS or public ip
![image](https://github.com/elmansey/Infrastructure/assets/89076648/c4dbf481-03a3-4034-8fe2-9d493a86657a)

- Add slave private key 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/14c99138-4e12-4950-bf6f-8b47b1d0ad69)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/c1666bf8-eecf-45fd-9e91-8597bd9d44cd)

- Slave added 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/676bfa82-496b-403c-bd47-35cdb168de0b)


## Install GitHub Integration Plugin
![image](https://github.com/elmansey/Infrastructure/assets/89076648/08a33506-cb6f-4827-bc3c-539591bc1a50)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/47cef913-fad9-44c6-9f86-5def1a2ed5af)


## Create Webhook
![image](https://github.com/elmansey/Infrastructure/assets/89076648/374e0892-6bf1-458a-9e86-797b990d154c)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9ebce66a-f358-4cd0-8e64-b13bf8801794)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/40dbd01d-d359-41a9-91ba-7f4db3508c3f)


## Ci CD Pipeline 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/3a5fa1b7-0d71-4bc7-8dd2-b543d9517dc3)

- Make pipeline triggered by the created Webhook
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9033293f-a673-41e5-96b6-01beec778a39)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/374de917-5423-4355-bde9-adda43d71be1)

- Create deployment files
![image](https://github.com/elmansey/Infrastructure/assets/89076648/10391fac-0a37-4e5e-bbd8-89ada9553e79)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/4d46c148-b863-437a-96b2-75ac90913513)

# Application 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/5585685f-4786-4093-8faf-f0c3ad7dde04)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9ddc68db-b1e8-4f4f-a95f-b7373e92e524)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/07aace23-b8fc-4444-8aa7-034e8d335d96)


## Test webhook
- Change background color from black to purple
![image](https://github.com/elmansey/Infrastructure/assets/89076648/1f9d89dc-fc92-422f-9905-83c68560440d)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/eec9247f-614a-4036-8947-3bcc21e827ba)

- Successfully triggered pipeline
![image](https://github.com/elmansey/Infrastructure/assets/89076648/3e174d6a-6bb1-4bfa-a780-04170d4cad93)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/667b7401-1b9a-49db-8e33-a882eeccbee2)




## Project hierarchy
1. Terraform 

- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/5d8c4651-5700-49f2-9118-b51add7ac2c9)
- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/3245f245-d43c-43c6-b181-3d5a13c3dafd)


2. Ansible
- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/9b497cf9-6fa8-445b-abbf-783eb3e3e77a)


3. Kubernetes
- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/145ab3b9-f604-47bd-9ebe-2b4b47aa2138)





## Destroy infrastructure

```bash
$  ./Down.sh
```

## App Rebo That Used At CI CD Stages [here](https://github.com/elmansey/Application)

## Author

- [Abdelrahman Elmansey ](https://www.linkedin.com/in/abdelrahman-elmansey/)