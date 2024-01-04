resource "aws_security_group" "test_sg" {
  name        = "Test_SG"
  description = "default VPC security group"
  vpc_id      = aws_vpc.eu_vpc.id

 ingress {
    from_port   = 1095
    to_port     = 1095
    protocol    = "tcp"
    cidr_blocks = [var.cidr_production_vpc]
    description = "Allow access from Production Services to Vendor API Eport"
  }

  ### Vendor API Videa Webserver

  ingress {
    from_port   = 1097
    to_port     = 1097
    protocol    = "tcp"
    cidr_blocks = [var.cidr_production_vpc]
    description = "Allow access from Production Services to Vendor API Videa"
  }

}

resource "aws_security_group" "add_sg" {
  name        = "Add new SG"
  description = "default VPC security group"
  vpc_id      = aws_vpc.eu_vpc.id

   ingress {
    from_port   = 1095
    to_port     = 1095
    protocol    = "tcp"
    cidr_blocks = [var.cidr_production_vpc]
    description = "Allow access from Production Services to Vendor API Eport"
  }

  ### Vendor API Videa Webserver

  ingress {
    from_port   = 1097
    to_port     = 1097
    protocol    = "tcp"
    cidr_blocks = [var.cidr_production_vpc]
    description = "Allow access from Production Services to Vendor API Videa"
  }
}

resource "aws_security_group" "add_sg_another" {
  name        = "Add another SG"
  description = "default VPC security group"
  vpc_id      = aws_vpc.eu_vpc.id

   ingress {
    from_port   = 1095
    to_port     = 1095
    protocol    = "tcp"
    cidr_blocks = [var.cidr_production_vpc]
    description = "Allow access from Production Services to Vendor API Eport"
  }

  ### Vendor API Videa Webserver

  ingress {
    from_port   = 1097
    to_port     = 1097
    protocol    = "tcp"
    cidr_blocks = [var.cidr_production_vpc]
    description = "Allow access from Production Services to Vendor API Videa"
  }
}