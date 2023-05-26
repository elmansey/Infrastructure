module Network {
  source = "./Network"
  vpc_cider=var.vpc_cider
  public_subnet_cider_1=var.public_subnet_cider_1
  public_subnet_cider_2=var.public_subnet_cider_2
  availability_zone_1=var.availability_zone_1
  availability_zone_2=var.availability_zone_2
  private_subnet_cider_1=var.private_subnet_cider_1
  private_subnet_cider_2=var.private_subnet_cider_2
}



module Roles {
  source = "./Roles"
}


module Policies {
  source = "./Policies"
  AmazonEKSNodeRole_name=module.Roles.AmazonEKSNodeRoleName
  EksClusterRole_name=module.Roles.EksClusterRoleName
}


module EKS {
  source = "./EKS"
  EksName=var.EksName
  EksClusterRole_arn=module.Roles.EksClusterRole_arn
  Kubernetes_version=var.Kubernetes_version
  private_subnet_ids=[
    module.Network.private_subnet_1_id,
    module.Network.private_subnet_2_id
  ]
  Eks_cluster_sg_id=module.Network.Eks_cluster_sg_id
  EksClusterRolePolicyAttachment=module.Policies.EksClusterRolePolicyAttachment
}

module NodeGroup {
  source = "./NodeGroup"
  EksCluster_name=module.EKS.EksClusterName
  node_group_name=var.node_group_name
  AmazonEKSNodeRole_arn=module.Roles.AmazonEKSNodeRole_arn
  private_subnet_ids=[
    module.Network.private_subnet_1_id,
    module.Network.private_subnet_2_id
  ]
  ami_type=var.ami_type
  capacity_type=var.capacity_type
  disk_size=var.disk_size
  instance_types=var.instance_types
  desired_size=var.desired_size
  max_size=var.max_size
  min_size=var.min_size
  max_unavailable=var.max_unavailable
  AmazonEKSWorkerNodePolicyAttachment=module.Policies.AmazonEKSWorkerNodePolicyAttachment
  AmazonEC2ContainerRegistryReadOnlyPolicyAttachment=module.Policies.AmazonEC2ContainerRegistryReadOnlyPolicyAttachment
  AmazonEKS_CNI_PolicyAttachment=module.Policies.AmazonEKS_CNI_PolicyAttachment
}


module DataSource {
  source = "./DataSource"
  terraform_user_secret_arn=var.terraform_user_secret_arn
}


module KeyPairs {
  source = "./KeyPairs"
}

module BastionHosts {
  source = "./BastionHosts"
  ubuntu_ami=module.DataSource.ubuntu_ami
  instance_type=var.instance_type
  BastionHost_sg_id=module.Network.BastionHost_sg_id
  public_subnet_id=module.Network.public_subnet_1_id
  key_pair=module.KeyPairs.key_pair_id
  aws_access_key_id=module.DataSource.aws_access_key_id
  aws_secret_access_key =module.DataSource.aws_secret_access_key
}