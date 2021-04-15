provider "aws" {
    region = "ap-southeast-1"
    shared_credentials_file = "C:/Users/hidey/.aws/credentials"
}

resource "aws_security_group" "default-sg" {
    name = "default-security-group"
    description = "Allow SSH traffic"

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "default-securitygroup"
    }
}

resource "aws_instance" "ubuntu" {
    key_name = "hidey-ec2"
    ami = "ami-01581ffba3821cdf3"
    instance_type = var.my_instance_type

    tags = {
        Name = "hidey-instance"
    }

    vpc_security_group_ids = [
        aws_security_group.default-sg.id
    ]

    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("hidey-ec2.ppk")
        host = self.public_ip
    }
}

resource "aws_eip" "default-eip" {
    vpc = true
    instance = aws_instance.ubuntu.id
}