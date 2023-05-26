output private_subnet_1_id {
  value = module.Subnets.private_subnet_1_id
}

output private_subnet_2_id {
  value = module.Subnets.private_subnet_2_id
}

output public_subnet_1_id {
  value = module.Subnets.public_subnet_1_id
}

output public_subnet_2_id {
  value = module.Subnets.public_subnet_2_id
}

output BastionHost_sg_id {
  value = module.SecurityGroups.BastionHost_sg_id
}

output Eks_cluster_sg_id {
  value = module.SecurityGroups.Eks_cluster_sg_id
}



