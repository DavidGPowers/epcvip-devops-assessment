# Generates a 4096-bit RSA key for SSH access.
resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits  = 4096

  # # ADD: This lifecycle block prevents Terraform from destroying the key.
  # # This is crucial for maintaining consistent SSH access throughout the project's life.
  # # If the key were destroyed, all instances using it would become inaccessible.
  # lifecycle {
  #   prevent_destroy = true
  # }
}

# Creates an EC2 Key Pair resource in AWS using the public key from the generated TLS key.
resource "aws_key_pair" "generated_key" {
  key_name   = "${local.project_name}-${local.target_environment}-key"
  public_key = tls_private_key.generated_key.public_key_openssh

  tags = local.common_tags

  # # ADD: This lifecycle block prevents Terraform from deleting the key pair from AWS.
  # lifecycle {
  #   prevent_destroy = true
  # }
}

# Saves the generated private key to a local file.
# This allows the stress test script to use it for SSH connections.
# The file will be saved in the .ssh directory of your home folder.
resource "local_file" "ssh_private_key" {
  content         = tls_private_key.generated_key.private_key_pem
  filename        = pathexpand("~/.ssh/${aws_key_pair.generated_key.key_name}.pem")
  file_permission = "0600" # Set permissions for security
}
