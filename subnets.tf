resource "aws_subnet" "subnet-test" {
  vpc_id                  = aws_vpc.prod_eks.id
  cidr_block              = aws_vpc.prod_eks.cidr_block
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    "Name" = "ec2_subnet"
    "description" =	"delete"
  }
}