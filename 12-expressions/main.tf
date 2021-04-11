provider "aws" {
    region = "us-west-2"
}

data "aws_vpc" "main" {
    default = true
}

locals {
    baz = "hello"
}