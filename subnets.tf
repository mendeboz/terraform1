resource "aws_subnet" "subnet-private_a" {
  vpc_id                  = aws_vpc.prod_eks.id
  cidr_block              = var.subnet_private_a["cidr_block"]
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    "Name" = "ec2_subnet-change"
    "description" =	"delete"
  }
}

resource "aws_subnet" "subnet_private_b" {
  vpc_id = aws_vpc.prod_eks.id
  cidr_block = var.subnet_private_a["cidr_block"]
  availability_zone = "us-east-1b"
}
