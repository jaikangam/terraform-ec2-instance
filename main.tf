provider "aws" {
 access_key = "{your_key}"
 secret_key = "{your_key}"
 region = "us-east-1"
}  

resource "aws_instance" "jai-instance" {
 ami           = "ami-2757f631"
 instance_type = "t2.micro"
 tags = {
    Name = "Jai-Simplilearn-Project"
 }
 key_name= "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "{Your_public_ssh_key}"
}
