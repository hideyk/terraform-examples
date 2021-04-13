provider "aws" {
    region = "us-east-1"
    shared_credentials_file = "C:/Users/hidey/.aws/credentials"
}

provider "aws" {
    alias = "west"
    region = "us-west-2"
    shared_credentials_file = "C:/Users/hidey/.aws/credentials"
}
resource "aws_instance" "web-west" {
    provider = aws.west
    instance_type = "t2.micro"
    ami = "ami-0121ef35996ede438"

    tags = {
        Name = "web-west-instance"
    }

    #lifecycle {
        # create_before_destroy = true
        # prevent_destroy = true
        # ignore_changes = [
        # tags["Name"],  
        # ] (for ignoring manual changes does on AWS or other provider console)
    #}
}

resource "aws_instance" "web" {
    # count = 2
    for_each = {
        dev = "t2.micro"
        prod = "t2.micro"
    }
    instance_type = each.value
    ami = "ami-042e8287309f5df03"
    #tags = {
    #    Name = "Instance ${count.index}"
    #}
    tags = {
        Name = "Instance ${each.key}"
    }

}

#output "public_ips" {
#    value = aws_instance.web[*].public_ip
#}