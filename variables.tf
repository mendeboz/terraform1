variable "environment" {
  default = "devops"
}



variable "aws_region" {
  default = "us-east-1"
}

### Ubuntu Server 18.04 LTS 64-bit ###
variable "ami_ubuntu_18" {
  default = "ami-0ac80df6eff0e70b5"
}

### Ubuntu Server 20.04 LTS 64-bit ###
variable "ami_ubuntu_20" {
  default = "ami-0074ee617a234808d"
}

variable "account_id" {
  description = "Default account ID"
  default     = "898004513500"
}



variable "jenkins_trigger" {
  default = "curl -X POST 'https://jenkins-beta.hudsonmx.net/job/DevOps-Production-Auto_provision_instances/buildWithParameters?token=production_auto_provision_instances"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type = string
  default     = "10.0.0.0/16"
}

variable "subnet_private_a" {
  type = map(string)
  default = {
    "cidr_block"  = "10.0.1.0/24",
    "description" = "Private Subnet A CIDR Block"
  }

}
variable "subnet_private_b" {
  type = map(string)
  default = {
    "cidr_block"  = "10.0.2.0/24",
    "description" = "Private Subnet B CIDR Block"
  }

}









variable "default_iam_policy_arn_list" {
  type        = list(string)
  description = "Default IAM policies to be attached to a role."
  default = [
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

