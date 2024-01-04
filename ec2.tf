resource "aws_instance" "test_vm" {
  ami                         = "ami-0faab6bdbac9486fb"
  availability_zone           = "eu-central-1b"
  
  instance_type               = "t2.micro"
  
  key_name                    = "endava_mende_aws"
  subnet_id                   = aws_subnet.subnet-eu.id
  vpc_security_group_ids      = [aws_security_group.test_sg.id, aws_security_group.add_sg.id, aws_security_group.add_sg_another.id]


  tags = {
    "Name"             = "test_ec2"
    "description" =	"delete"
  }
}