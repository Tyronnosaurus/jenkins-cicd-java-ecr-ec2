provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "Jenkins-Deployed-EC2"
  }

  // Security group for allowing SSH and Docker access (which we'll need for the Jenkins pipeline)
  vpc_security_group_ids = [aws_security_group.allow_ssh_docker.id]
}

resource "aws_security_group" "allow_ssh_docker" {
  name        = "allow_ssh_docker"
  description = "Allow SSH and Docker access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2375
    to_port     = 2376
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Docker API access"
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
