# Data source to retrieve the latest Amazon Linux 2023 AMI ID from AWS public SSM Parameter Store.
data "aws_ssm_parameter" "amazon_linux_2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
