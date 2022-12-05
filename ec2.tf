resource "aws_instance" "test_vm" {
  ami                         = "ami-08c40ec9ead489470"
  availability_zone           = "us-east-1b"
  ebs_optimized               = true
  instance_type               = "t2.micro"
  monitoring                  = false
  key_name                    = "privmende_endavalaptop"
  subnet_id                   = aws_subnet.subnet-test.id
  vpc_security_group_ids      = [aws_security_group.test_sg.id]
  associate_public_ip_address = true
  source_dest_check           = true
  disable_api_termination     = true

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    "Name"             = "test_ec2"
    "description" =	"delete"
  }
}