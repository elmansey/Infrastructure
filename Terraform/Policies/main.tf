# attach AmazonEKSWorkerNodePolicy to this role 
resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicyAttachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = var.AmazonEKSNodeRole_name
}

# attach AmazonEC2ContainerRegistryReadOnly policy to this role 
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnlyPolicyAttachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = var.AmazonEKSNodeRole_name
}

# attach AmazonEKS_CNI_Policy to this role 
resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_PolicyAttachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = var.AmazonEKSNodeRole_name
}

# attach policy to this role 
resource "aws_iam_role_policy_attachment" "EksClusterRolePolicyAttachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = var.EksClusterRole_name
}