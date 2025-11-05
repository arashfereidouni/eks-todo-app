terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

# Import existing resources
import {
  to = aws_iam_role.eks_cluster_role
  id = "eks-todo-app-eks-cluster-role"
}

import {
  to = aws_iam_role.eks_node_role
  id = "eks-todo-app-eks-node-role"
}

import {
  to = aws_iam_role.codebuild_role
  id = "eks-todo-app-codebuild-role"
}

import {
  to = aws_iam_role.codepipeline_role
  id = "eks-todo-app-codepipeline-role"
}

import {
  to = aws_ecr_repository.todo_app
  id = "eks-todo-app-app"
}

import {
  to = aws_eks_cluster.todo_cluster
  id = "eks-todo-app-cluster"
}

import {
  to = aws_eks_node_group.todo_nodes
  id = "eks-todo-app-cluster:eks-todo-app-nodes"
}

import {
  to = aws_codebuild_project.todo_app
  id = "eks-todo-app-build"
}

import {
  to = aws_codepipeline.todo_app
  id = "eks-todo-app-pipeline"
}