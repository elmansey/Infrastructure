resource "aws_eks_node_group" "EksClusterNodeGroup" {
  cluster_name    = var.EksCluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.AmazonEKSNodeRole_arn
  subnet_ids      = var.private_subnet_ids
  ami_type = var.ami_type
  capacity_type = var.capacity_type
  disk_size = var.disk_size
  instance_types = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  update_config {
    max_unavailable = var.max_unavailable
  }

  depends_on = [
    var.AmazonEKSWorkerNodePolicyAttachment,
    var.AmazonEC2ContainerRegistryReadOnlyPolicyAttachment,
    var.AmazonEKS_CNI_PolicyAttachment
  ]
}