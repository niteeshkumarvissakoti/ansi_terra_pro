

provider "aws" {
  region="us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t3.micro"
  key_name      = "EC2_PRIVATE_KEY"
  tags = {
    Name = "terra_ansi_pro" 
    }

    provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip.txt"
  }
}
