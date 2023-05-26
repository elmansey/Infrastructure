output AmazonEKSNodeRoleName  {
  value=aws_iam_role.AmazonEKSNodeRole_.name
}

output EksClusterRoleName  {
  value=aws_iam_role.EksClusterRole_.name
}

output AmazonEKSNodeRole_arn  {
  value=aws_iam_role.AmazonEKSNodeRole_.arn
}

output EksClusterRole_arn  {
  value=aws_iam_role.EksClusterRole_.arn
}

