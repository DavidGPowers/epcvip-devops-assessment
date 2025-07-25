module "ec2_launch_template" {
  source = "./modules/ec2_launch_template" # Adjust the path to your module

  terraform_project_name = local.project_name
  ec2_template_prefix    = "${local.project_name}-${local.target_environment}"

  create_ssm_instance_profile = true

  # Pass the content of user_data.sh directly
  user_data = file("../ec2_config/ec2_user_data.txt")

  vpc_security_group_ids     = [module.ec2_asg_target.ec2_target_security_group_id]
  enable_detailed_monitoring = true

  tags = local.common_tags
}