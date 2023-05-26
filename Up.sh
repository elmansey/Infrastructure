#!/bin/bash

cd ./Terraform
terraform init
terraform apply -auto-approve
chmod 400 /home/elmansey/.ssh/key_pair.pem
cd ../Ansible/
ansible-playbook  main.yaml