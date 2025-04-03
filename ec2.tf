########################
###    Data source   ###
########################

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
########################
###    Ec2 Instance  ###
########################

resource "aws_instance" "PublicWebTemplate" {
  ami                    = "ami-00a929b66ed6e0de6"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public-web-subnet-1.id
  vpc_security_group_ids = [aws_security_group.webserver-security-group.id]
  key_name               = "keyy"
  user_data              = file("install-apache.sh")

  tags = {
    Name = "web-asg"
  }
}

