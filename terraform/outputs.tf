# This file centralizes various outputs from the root module.

output "ssh_private_key_path" {
  description = "The local path where the generated SSH private key (.pem) is stored. Use this for SSH access."
  value       = local_file.ssh_private_key.filename
}

output "generated_key_pair_name" {
  description = "The name of the EC2 key pair created and managed by Terraform."
  value       = aws_key_pair.generated_key.key_name
}
