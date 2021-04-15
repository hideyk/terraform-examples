variable "vpc_id" {
    type = string
    description = "VPC Id"
}

variable "cidr_block" {
    type = string
    description = "List of CIDR blocks"
}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "webserver_name" {
    type = string
}