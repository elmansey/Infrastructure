output "BastionHost_public_ip" {
  value = aws_instance.BastionHost.public_ip
}

output "BastionHost_private_ip" {
  value = aws_instance.BastionHost.private_ip
}
