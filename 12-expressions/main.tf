provider "aws" {
    region = "us-east-1"
}

data "aws_vpc" "main" {
    default = true
}

locals {
    baz = "hello"
}

variable "testing" {
    type = map
    default = {
        foo = 123
        bar = 555
    }
}

resource "aws_instance" "web" {
    count = 2
    ami = "ami-042e8287309f5df03"
    instance_type = "t2.micro"

    tags = {
        Name = "Tuts test ${local.baz}"

        foo = local.baz == "hello" ? "yes" : "no"

        bar = <<-EOT
            testing foo
        EOT

        testing_foo = <<EOT
            %{ for ip in aws_instance.example.*.private_ip }
            server ${ip}
            %{ endfor }
        EOT
    }
}

output "foo" {
    # value = [for k, v in var.testing : upper(k)]
    value = [for k, v in var.testing : v if k == "foo"]
}