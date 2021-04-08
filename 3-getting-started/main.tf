provider "aws" {
    version = "~> 3.0"
    region = "us-east-1"
    shared_credentials_file = "C:/Users/hidey/.aws/credentials"
}

resource "aws_instance" "web" {
    ami = "ami-01581ffba3821cdf3"
    instance_type = "t2.micro"
}