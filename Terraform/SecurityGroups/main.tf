
resource "aws_security_group" "BastionHost_sg" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = var.vpc_id

  # inbound
  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  # outbound
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "BastionHost_sg"
  }
}

resource "aws_security_group" "Eks_cluster_sg" {
  name_prefix = "Eks_cluster_sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    security_groups = [aws_security_group.BastionHost_sg.id]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Eks_cluster_sg"
  }
}