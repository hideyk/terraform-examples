provider "aws" {
  region                  = "ap-southeast-1"
  shared_credentials_file = "C:/Users/hidey/.aws/credentials"
}

resource "aws_instance" "web" {
    ami = "ami-05b891753d41ff88f"
    instance_type = "t2.micro"
    key_name = "hidey-ec2"

    tags = {
        Name = "Test instance"
    }

    # provisioner "local-exec" {
    #     command = "echo ${self.public_ip} > public-ip.txt"
    # }

    connection {
        type = "ssh"
        host = self.public_ip
        user = "ubuntu"
        private_key = file("D:/github/terraform-examples/14-provisioners/hidey-ec2.ppk")
    }

    provisioner "file" {
        content = "foobar"
        destination = "/home/ubuntu/tuts.txt"
    }
}