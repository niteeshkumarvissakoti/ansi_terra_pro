

provider "aws" {
  region="us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t3.micro"
  key_name      = "test111"
  tags = {
    Name = "terra_ansi_pro" 
    }

    provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip.txt"
  }
}
output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}
