#!/bin/bash

cd ./Terraform
terraform init
terraform apply -auto-approve
cd ../Ansible/
ansible-playbook  main.yaml