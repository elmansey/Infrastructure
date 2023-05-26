module VPC {
  source = "../VPC"
  vpc_cider=var.vpc_cider
}

module Subnets {
  source = "../Subnets"
  public_subnet_cider_1=var.public_subnet_cider_1
  public_subnet_cider_2=var.public_subnet_cider_2
  availability_zone_1=var.availability_zone_1
  availability_zone_2=var.availability_zone_2
  private_subnet_cider_1=var.private_subnet_cider_1
  vpc_id=module.VPC.vpc_id
  private_subnet_cider_2=var.private_subnet_cider_2
}

module InternetGateway {
  source = "../InternetGateway"
  vpc_id=module.VPC.vpc_id
}

module NatGateways {
  source = "../NatGateways"
  public_subnet_id=module.Subnets.public_subnet_1_id
  igw_id=module.InternetGateway.igw_id
}


module SecurityGroups {
  source = "../SecurityGroups"
  vpc_id=module.VPC.vpc_id
}


module RouteTables {
  source = "../RouteTables"
  igw_id=module.InternetGateway.igw_id
  vpc_id=module.VPC.vpc_id
  ngw_id=module.NatGateways.ngw_id
  public_subnet_1_id=module.Subnets.public_subnet_1_id
  public_subnet_2_id=module.Subnets.public_subnet_2_id
  private_subnet_1_id=module.Subnets.private_subnet_1_id
  private_subnet_2_id=module.Subnets.private_subnet_2_id
}

