output "public_ip" {
    value = aws_instance.ubuntu.public_ip
}

output "eip_public_ip" {
    value = aws_eip.default-eip.public_ip
}