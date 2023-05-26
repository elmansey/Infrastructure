resource "aws_instance" "BastionHost" {
  ami           = var.ubuntu_ami                   
  instance_type = var.instance_type
  vpc_security_group_ids = [var.BastionHost_sg_id]
  subnet_id = var.public_subnet_id
  key_name = var.key_pair
  user_data = <<-EOF
              #!/bin/bash
                sudo mkdir /home/ubuntu/.aws/
                sudo chown -R ubuntu:ubuntu /home/ubuntu/.aws
                sudo touch /home/ubuntu/.aws/credentials
                echo "[default]" > /home/ubuntu/.aws/credentials
                echo "aws_access_key_id = ${var.aws_access_key_id}" >> /home/ubuntu/.aws/credentials
                echo "aws_secret_access_key = ${var.aws_secret_access_key}" >> /home/ubuntu/.aws/credentials
             EOF

  tags = {
    Name = "BastionHost"
  }
}