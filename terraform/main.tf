

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
resource "aws_ec2_instance_connect_endpoint" "web" {
  subnet_id = aws_subnet.web.id
}
