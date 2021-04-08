provider "aws" {
    version = "~> 3.0"
    region = "us-east-1"
    shared_credentials_file = "C:/Users/hidey/.aws/credentials"
}

resource "aws_instance" "web" {
    ami = "ami-042e8287309f5df03"
    instance_type = "t2.micro"
    tags = {
        Name = "First instance"
    }
}