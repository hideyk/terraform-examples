output "eip_public_ip" {
    value = aws_eip.default-eip.public_ip
}