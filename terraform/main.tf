

provider "aws" {
  region="us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t3.micro"
  key_name      = "test111"
  associate_public_ip_address = true
  tags = {
    Name = "terra_ansi_pro" 
    }

    provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip.txt"
    working_dir = "${path.module}"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
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


output "ec2_instance_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.myec2.public_ip
}
