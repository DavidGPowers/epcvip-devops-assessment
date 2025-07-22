module "ec2_launch_template" {
  source = "./modules/launch_template" # Adjust the path to your module

  terraform_project_name = local.project_name
  ec2_template_prefix = "${local.project_name}-${local.target_environment}"

  create_ssm_instance_profile = true
  # vpc_security_group_ids = ["sg-0abcdef1234567890", "sg-0fedcba9876543210"]

  # Pass the content of user_data.sh directly
  user_data = file("../ec2_user_data.txt")

  associate_public_ip_address = false
  enable_detailed_monitoring  = true

  tags = local.common_tags
}