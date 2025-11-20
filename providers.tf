terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # backend "s3" {
  #   bucket = "githubs3backend"
  #   key    = "terraform1/terraform.tfstate"
  #   region = "us-east-1"
  # }
  cloud { 
    
    organization = "newmendeboz" 

    workspaces { 
      name = "terraform1" 
    } 
  } 
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}