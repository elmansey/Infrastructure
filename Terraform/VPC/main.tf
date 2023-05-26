resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cider
  enable_dns_hostnames = true
  tags = {
    Name = "vpc"
  }
}