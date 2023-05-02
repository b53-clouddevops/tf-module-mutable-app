# Creates Security Group
resource "aws_security_group" "allow_app" {
  name        = "robot-${var.COMPONENT}-${var.ENV}-sg"
  description = "robot-${var.COMPONENT}-${var.ENV}-sg"
  vpc_id      = 

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "b53_allow_ssh_secgrp"
  }
}
