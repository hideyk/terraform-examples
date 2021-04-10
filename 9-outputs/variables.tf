variable "my_instance_type" {
    type = string
    description = "ec2 instance type"
}

variable "instance_tags" {
    type = object({
        Name = string
        foo = number
    })
}

variable "foobar" {
    type = list(number)
}
