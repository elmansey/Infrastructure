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

1. After run the Up.sh script at the first the terraform infrastracture code will applied in aws
- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/9590f163-1b07-406f-8f8f-0d61b84b2736)
- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/8e5c6528-8421-4b48-91b4-9c3121dd000b)
- ![image](https://github.com/elmansey/Infrastructure/assets/89076648/0c45604a-53cf-40e3-a04d-aca1849baf93)

## Ansible configuration
1. Then the ansible role will fired to get the BastionHost ip automatically by ansible dynamic inventory. 
- The first task in role to configre the bastionHost machine by installing some prerequiest backages such as `awscli` to use it to update kubeconfig file and `kubectl` to able to connect to the Cluster from it
![image](https://github.com/elmansey/Infrastructure/assets/89076648/89a69f2a-92ea-4948-a4b2-463d83a826e3)

- After BastionHost task finished the second task will fired to Move Jenkins Deployment manifest files to BastionHost by ansible and then apply it by k8s ansible module to deploy jenkins in cluster in jenkins namespace 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/1dd6bd0b-6d6f-4326-8181-f45eb8ac1d93)

- After Jenkins task finished the third task will fired to Configure the bastion host machine to act in the same time as a slave for jenkins server to run pipeline from it 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/acfeb554-d1e6-4881-ae99-affdd5690ab3)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/198f6d0e-e6d6-4048-93d9-a357553a8fce)


## Connect to BastioHost
![image](https://github.com/elmansey/Infrastructure/assets/89076648/2008ac8e-76ba-4648-aaa8-65ebf17c9b11)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/ed3730c0-7e6f-49b0-94df-edf44d2a84d9)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/391d3129-4264-4a4d-bbdc-2932d00110c0)



## Jenkins Up
![image](https://github.com/elmansey/Infrastructure/assets/89076648/24f961db-5bec-48a1-881b-db80053f7654)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/f6ab9292-8e5e-45c7-a234-99e962c68eb6)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/2e7945a8-9900-4d45-b501-cce32f8962de)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/1ea08d2c-1e48-4170-8958-24c6e9765503)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/3daba51b-0c87-4132-a8eb-904b8edd86a1)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/be3a5da3-7d91-4938-adcb-0b25c298de81)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/247fb66a-955a-42a6-ab67-93cae5cb7d05)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/d5754f82-2d95-4f18-b521-91b498f43513)


## Add credentials
![image](https://github.com/elmansey/Infrastructure/assets/89076648/56b14551-bfe6-4d99-89d2-dda68e280474)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/58114c89-b4ec-4b5e-9237-73301ae73256)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/7835a3e7-6370-491a-9b51-698d9c84a986)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/add06711-162e-4de8-8464-c1be5610a424)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/8a8d7ac0-a15b-4eab-8652-f1cafcfbd82c)


## Add slave
![image](https://github.com/elmansey/Infrastructure/assets/89076648/75d74ee5-04d2-448a-b73b-ec119573b463)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/218a2ff5-cc8b-4930-b466-93763f9fdba2)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/56716317-a5fd-49b4-a29c-5aa8fe3d21fe)
- Get BastionHost public DNS or public ip
![image](https://github.com/elmansey/Infrastructure/assets/89076648/7263b8ad-f7df-483e-809e-1b2ffd66ff7a)
- Add slave private key 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/18aa0546-9e28-4aff-8629-ce1c222729b2)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/e2c2185b-c388-476b-92c9-d118a6aa847d)
- Slave added 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/87e65555-6d9a-4a0b-a94d-2f1309566942)


## Install GitHub Integration Plugin
![image](https://github.com/elmansey/Infrastructure/assets/89076648/dd9229f4-0afd-4f65-af76-723c58de021b)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/3cca2154-db69-4314-90a1-1405cbf7b267)


## Create Webhook
![image](https://github.com/elmansey/Infrastructure/assets/89076648/0231be83-3c96-4778-9074-ea463a212ad1)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/a89eddee-f999-474c-8057-ce2ae0d92584)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/b901b205-ad44-4061-a1bb-9f2c07da78b3)


## Ci CD Pipeline 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/db297642-60d9-4f38-a721-f466e5f647dc)
- Make pipeline triggered by the created Webhook
![image](https://github.com/elmansey/Infrastructure/assets/89076648/70b4686c-59e6-47ba-bed8-021fedcd8759)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/16e3fbe1-b276-428f-8d7f-4616056847e1)
- Create deployment files
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9b5856c1-1bbc-48c8-8d90-48fc4899f1df)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/6d7ff422-eccb-4972-a0aa-3300684bf1a7)


# Application 
![image](https://github.com/elmansey/Infrastructure/assets/89076648/44b20e49-ee65-4535-88e5-8cc0cf58285f)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/690c1e91-d6e9-4b25-824a-da2cecaf6494)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/62a7edb2-23fa-4a50-a330-633c40b999ae)


## Test webhook
- Change background color from black to purple
![image](https://github.com/elmansey/Infrastructure/assets/89076648/870049b4-174b-4f5b-9311-8bcf88a3332f)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/33e7942e-d334-43a5-b314-71b1d96f856c)
- Successfully triggered pipeline
![image](https://github.com/elmansey/Infrastructure/assets/89076648/07583bf0-e1b5-4c5a-8864-60b853ec0c91)
![image](https://github.com/elmansey/Infrastructure/assets/89076648/9d76b2a6-abd8-4ef8-b6f9-4dfd86c22111)




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