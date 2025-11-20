# resource "aws_security_group" "test_sg" {
#   name        = "Test_SG"
#   description = "default VPC security group"
#   vpc_id      = aws_vpc.prod_eks.id
# }