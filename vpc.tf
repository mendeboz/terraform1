# resource "aws_vpc" "default" {
#   cidr_block           = "172.31.0.0/16"
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   instance_tenancy     = "default"

#   tags = {
#     "Name" = "default"
#   }
# }


resource "aws_vpc" "prod_eks" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    "Name" = "vpc_test"
    "description" =	"delete"
  }
}

resource "aws_vpc" "eu_vpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    "Name" = "vpc_test"
    "description" =	"delete"
  }
}