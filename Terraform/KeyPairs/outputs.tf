output "key_pair_id" {
  value=aws_key_pair.tf_key_pair.id
}

output "key_pair_public_key" {
  value=tls_private_key.rsa_key.public_key_openssh
}

output "key_pair_private_key" {
  value=tls_private_key.rsa_key.private_key_pem
}