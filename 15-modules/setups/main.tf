provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

module "hidey_webserver" {
  source         = "../modules/webserver"
  vpc_id         = aws_vpc.main.id
  cidr_block     = "10.0.0.0/16"
  webserver_name = "hidey"
  ami            = "ami-05b891753d41ff88f"
  instance_type  = "t2.micro"
}