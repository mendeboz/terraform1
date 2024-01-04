# resource "aws_subnet" "subnet-test" {
#   vpc_id                  = aws_vpc.prod_eks.id
#   cidr_block              = "10.0.0.0/24"
#   availability_zone       = ""
#   map_public_ip_on_launch = false

#   tags = {
#     "Name" = "ec2_subnet"
#     "description" =	"delete"
#   }
# }

# resource "aws_subnet" "subnet-testb" {
#   vpc_id                  = aws_vpc.prod_eks.id
#   cidr_block              = "10.0.1.0/24"
#   availability_zone       = eu-central-1b"
#   map_public_ip_on_launch = false

#   tags = {
#     "Name" = "ec2_subnetb"
#     "description" =	"delete"
#   }
# }

resource "aws_subnet" "subnet-eu" {
  vpc_id                  = aws_vpc.eu_vpc.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = false

  tags = {
    "Name" = "ec2_subnetb"
    "description" =	"delete"
  }
}