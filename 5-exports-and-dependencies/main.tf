provider "aws" {
    version = "~> 3.0"
    region = "us-east-1"
    shared_credentials_file = "C:/Users/hidey/.aws/credentials"
}

resource "aws_vpc" "main" {
    cidr_block = "10.5.0.0/16"

    tags = {
        Name = "main vpc"
    }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "main subnet"
  }
}

resource "aws_instance" "web" {
    ami = "ami-042e8287309f5df03"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.main.id

    tags = {
        Name = "First instance"
    }
}