resource "aws_eks_cluster" "EksCluster" {
  name     = var.EksName
  role_arn = var.EksClusterRole_arn
  version = var.Kubernetes_version
  enabled_cluster_log_types = ["api","authenticator"]
  vpc_config {
    endpoint_private_access = true
    endpoint_public_access = false
    subnet_ids = var.private_subnet_ids
    security_group_ids = [var.Eks_cluster_sg_id]
  }
  depends_on = [var.EksClusterRolePolicyAttachment ]
}