# Get current AWS caller identity
data "aws_caller_identity" "current" {}

# Note: Root user automatically has cluster access when bootstrap_cluster_creator_admin_permissions = true
# EKS access entries will be added after cluster authentication mode is updated