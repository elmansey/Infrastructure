resource "aws_subnet" "public_subnet_1" {
  vpc_id     = var.vpc_id
  availability_zone = var.availability_zone_1
  cidr_block = var.public_subnet_cider_1
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = var.vpc_id
  availability_zone = var.availability_zone_2
  cidr_block = var.public_subnet_cider_2
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = var.vpc_id
  availability_zone = var.availability_zone_1
  cidr_block = var.private_subnet_cider_1
  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = var.vpc_id
  availability_zone = var.availability_zone_2
  cidr_block = var.private_subnet_cider_2
  tags = {
    Name = "private_subnet_2"
  }
}