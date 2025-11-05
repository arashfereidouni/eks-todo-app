# Get current AWS caller identity
data "aws_caller_identity" "current" {}

# EKS access entry for root user
resource "aws_eks_access_entry" "root_user" {
  cluster_name      = aws_eks_cluster.todo_cluster.name
  principal_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
  kubernetes_groups = ["system:masters"]
  type             = "STANDARD"
}