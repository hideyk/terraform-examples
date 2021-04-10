provider "aws" {
    version = "~> 3.0"
    region = "us-east-1"
    shared_credentials_file = "C:/Users/hidey/.aws/credentials"
}

resource "aws_instance" "web" {
    ami = "ami-042e8287309f5df03"
    instance_type = var.my_instance_type

    tags = var.instance_tags
}
