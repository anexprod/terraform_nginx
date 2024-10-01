provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "nginx_sg" {
  name        = "nginx_sg"
  description = "Security Group for Nginx"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.list_of_open_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nginx_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.nginx_sg.id]
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id

  user_data = <<-EOF
              #!/bin/bash
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              EOF
}

output "instance_public_ip" {
  value = aws_instance.nginx_instance.public_ip
}
