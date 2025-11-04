# EKS Todo App

A containerized To-Do application deployed on Amazon EKS with CI/CD using CodePipeline and GitHub Actions.

## Architecture

- **Flask API**: Simple To-Do REST API with health endpoint
- **EKS Cluster**: Kubernetes cluster with 2 worker nodes
- **ECR**: Container registry for Docker images
- **CodePipeline**: CI/CD pipeline triggered by GitHub commits
- **LoadBalancer**: Exposes app publicly via AWS Load Balancer

## Prerequisites

- AWS CLI configured
- Terraform >= 1.0
- kubectl installed
- GitHub personal access token

## Setup

### 1. Configure GitHub Secrets
```
AWS_ACCESS_KEY_ID=<your-access-key>
AWS_SECRET_ACCESS_KEY=<your-secret-key>
GH_TOKEN=<your-github-token>
```

### 2. Deploy Infrastructure
```bash
cd terraform
terraform init
terraform apply
```

### 3. Configure kubectl
```bash
aws eks update-kubeconfig --region us-east-1 --name eks-todo-app-cluster
```

## API Endpoints

- `GET /health` - Health check
- `GET /todos` - List all todos
- `POST /todos` - Create new todo
- `DELETE /todos/<id>` - Delete todo

## CI/CD Flow

1. **GitHub Actions**: Deploys infrastructure on push to main
2. **CodePipeline**: Triggered by GitHub commits
3. **CodeBuild**: Builds Docker image, pushes to ECR, deploys to EKS

## Resources Created

- EKS cluster with node group
- ECR repository
- VPC with public/private subnets
- CodePipeline and CodeBuild projects
- IAM roles and policies