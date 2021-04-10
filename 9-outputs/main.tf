provider "aws" {
    version = "~> 3.0"
    region = "ap-southeast-1"
    shared_credentials_file = "C:/Users/hidey/.aws/credentials"
}

resource "aws_instance" "web" {
    ami = "ami-05b891753d41ff88f"
    instance_type = var.my_instance_type
    key_name = "default-ec2"
    tags = var.instance_tags
}