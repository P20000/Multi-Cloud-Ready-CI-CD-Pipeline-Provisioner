# 1. Terraform Backend and Provider Configuration (The Core Scrolls)
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # IMPORTANT: Configure a remote state backend (S3) for GitHub Actions
  # This prevents state loss and allows the second job to access the cluster state.
  backend "s3" {
    bucket = "p20000-citadel-tf-state" # !!! REPLACE with a globally unique S3 bucket name
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
    # The IAM role assumed via OIDC will need access to this S3 bucket.
  }
}

provider "aws" {
  region = var.aws_region
}

# 2. Networking (VPC and Subnets)
# We use the VPC module for a quick, standard network setup required by EKS.
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "citadel-vpc-${var.eks_cluster_name}"
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.available.names
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned" # Required EKS Tag
  }
}

data "aws_availability_zones" "available" {}

# 3. EKS Cluster (The Citadel Stronghold)
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = "1.28" # Current stable version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # The IAM Role required by EKS to manage cluster resources.
  # This role will be automatically created by the module.
  cluster_addons = {
    coredns = {}
    kube-proxy = {}
    vpc-cni = {}
  }

  # Managed Node Group (The Worker Garrisons)
  eks_managed_node_groups = {
    general = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1
    }
  }

  # Required to allow external access (like our deployed Sentinel app)
  manage_aws_auth_configmap = true
  # Add the cluster creator (the IAM user who runs terraform apply) to the admin list
  # Note: The OIDC role will handle access for the pipeline, but a user needs initial setup access.
}