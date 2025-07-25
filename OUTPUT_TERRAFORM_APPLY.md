```bash
➜  epcvip-devops-assessment git:(main) ✗ ./terraform_init.sh dev                                                     <aws:eai> <region:us-east-1>
Running terraform init for dev: ./terraform/backend-dev.config
Initializing the backend...

Successfully configured the backend "local"! Terraform will automatically
use this backend unless the backend configuration changes.
Upgrading modules...
- basic_vpc in modules/basic_vpc
- ec2_asg_target in modules/ec2_asg_target
- ec2_launch_template in modules/ec2_launch_template
- shared_alb in modules/application_load_balancer
Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 6.0"...
- Using previously-installed hashicorp/aws v6.5.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
➜  epcvip-devops-assessment git:(main) ✗ ./terraform_apply.sh dev                                                    <aws:eai> <region:us-east-1>
Running terraform plan for target environment dev.
module.shared_alb.data.aws_elb_service_account.main[0]: Reading...
module.basic_vpc.data.aws_availability_zones.available: Reading...
module.ec2_launch_template.data.aws_ssm_parameter.amazon_linux_2023_ami: Reading...
module.shared_alb.data.aws_caller_identity.current: Reading...
data.aws_region.current: Reading...
data.aws_caller_identity.current: Reading...
data.aws_partition.current: Reading...
module.shared_alb.data.aws_elb_service_account.main[0]: Read complete after 0s [id=127311923021]
data.aws_partition.current: Read complete after 0s [id=aws]
data.aws_region.current: Read complete after 0s [id=us-east-1]
module.shared_alb.data.aws_caller_identity.current: Read complete after 0s [id=349580787393]
data.aws_caller_identity.current: Read complete after 0s [id=349580787393]
module.basic_vpc.data.aws_availability_zones.available: Read complete after 0s [id=us-east-1]
module.ec2_launch_template.data.aws_ssm_parameter.amazon_linux_2023_ami: Read complete after 0s [id=/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # module.basic_vpc.aws_eip.nat_gateway_eip[0] will be created
  + resource "aws_eip" "nat_gateway_eip" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + region               = "us-east-1"
      + tags                 = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-nat-eip"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all             = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-nat-eip"
          + "TerraformProject" = "dp-webapp"
        }
    }

  # module.basic_vpc.aws_internet_gateway.main will be created
  + resource "aws_internet_gateway" "main" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + region   = "us-east-1"
      + tags     = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-igw"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-igw"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id   = (known after apply)
    }

  # module.basic_vpc.aws_nat_gateway.main[0] will be created
  + resource "aws_nat_gateway" "main" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + region                             = "us-east-1"
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-nat-gw"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-nat-gw"
          + "TerraformProject" = "dp-webapp"
        }
    }

  # module.basic_vpc.aws_route_table.private[0] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "us-east-1"
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + nat_gateway_id             = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-private-rt"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all         = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-private-rt"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id           = (known after apply)
    }

  # module.basic_vpc.aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "us-east-1"
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-public-rt"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all         = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-public-rt"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id           = (known after apply)
    }

  # module.basic_vpc.aws_route_table_association.private[0] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.basic_vpc.aws_route_table_association.private[1] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.basic_vpc.aws_route_table_association.public[0] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.basic_vpc.aws_route_table_association.public[1] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.basic_vpc.aws_subnet.private[0] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.100.101.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-private-subnet-1"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                                       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-private-subnet-1"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.basic_vpc.aws_subnet.private[1] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.100.102.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-private-subnet-2"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                                       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-private-subnet-2"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.basic_vpc.aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.100.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-public-subnet-1"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                                       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-public-subnet-1"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.basic_vpc.aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.100.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-public-subnet-2"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                                       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-public-subnet-2"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.basic_vpc.aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.100.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + region                               = "us-east-1"
      + tags                                 = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-vpc"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                             = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-vpc"
          + "TerraformProject" = "dp-webapp"
        }
    }

  # module.ec2_asg_target.aws_autoscaling_group.app_asg will be created
  + resource "aws_autoscaling_group" "app_asg" {
      + arn                              = (known after apply)
      + availability_zones               = (known after apply)
      + default_cooldown                 = (known after apply)
      + desired_capacity                 = 2
      + force_delete                     = false
      + force_delete_warm_pool           = false
      + health_check_grace_period        = 300
      + health_check_type                = (known after apply)
      + id                               = (known after apply)
      + ignore_failed_scaling_activities = false
      + load_balancers                   = (known after apply)
      + max_size                         = 6
      + metrics_granularity              = "1Minute"
      + min_size                         = 2
      + name                             = "dp-webapp-asg-dev"
      + name_prefix                      = (known after apply)
      + predicted_capacity               = (known after apply)
      + protect_from_scale_in            = false
      + region                           = "us-east-1"
      + service_linked_role_arn          = (known after apply)
      + target_group_arns                = (known after apply)
      + vpc_zone_identifier              = (known after apply)
      + wait_for_capacity_timeout        = "10m"
      + warm_pool_size                   = (known after apply)

      + availability_zone_distribution (known after apply)

      + capacity_reservation_specification (known after apply)

      + launch_template {
          + id      = (known after apply)
          + name    = (known after apply)
          + version = (known after apply)
        }

      + mixed_instances_policy (known after apply)

      + tag {
          + key                 = "Author"
          + propagate_at_launch = true
          + value               = "David Powers"
        }
      + tag {
          + key                 = "AuthorEmail"
          + propagate_at_launch = true
          + value               = "david@powersemail.com"
        }
      + tag {
          + key                 = "Name"
          + propagate_at_launch = true
          + value               = "dp-webapp-asg-dev"
        }
      + tag {
          + key                 = "TerraformProject"
          + propagate_at_launch = true
          + value               = "dp-webapp"
        }

      + traffic_source (known after apply)
    }

  # module.ec2_asg_target.aws_autoscaling_policy.scale_down[0] will be created
  + resource "aws_autoscaling_policy" "scale_down" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "dp-webapp-asg-dev"
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "dp-webapp-asg-dev-scale-down"
      + policy_type             = "StepScaling"
      + region                  = "us-east-1"

      + step_adjustment {
          + metric_interval_upper_bound = "0"
          + scaling_adjustment          = -2
            # (1 unchanged attribute hidden)
        }
    }

  # module.ec2_asg_target.aws_autoscaling_policy.scale_up[0] will be created
  + resource "aws_autoscaling_policy" "scale_up" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "dp-webapp-asg-dev"
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "dp-webapp-asg-dev-scale-up"
      + policy_type             = "StepScaling"
      + region                  = "us-east-1"

      + step_adjustment {
          + metric_interval_lower_bound = "0"
          + scaling_adjustment          = 2
            # (1 unchanged attribute hidden)
        }
    }

  # module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_high" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "This alarm triggers a scale-up when CPU utilization is high."
      + alarm_name                            = "dp-webapp-asg-dev-cpu-high-alarm"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanOrEqualToThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "dp-webapp-asg-dev"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 60
      + region                                = "us-east-1"
      + statistic                             = "Average"
      + tags                                  = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                              = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + threshold                             = 70
      + treat_missing_data                    = "missing"
    }

  # module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_low" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "This alarm triggers a scale-down when CPU utilization is low."
      + alarm_name                            = "dp-webapp-asg-dev-cpu-low-alarm"
      + arn                                   = (known after apply)
      + comparison_operator                   = "LessThanOrEqualToThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "dp-webapp-asg-dev"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 60
      + region                                = "us-east-1"
      + statistic                             = "Average"
      + tags                                  = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                              = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + threshold                             = 30
      + treat_missing_data                    = "missing"
    }

  # module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0] will be created
  + resource "aws_lb_listener_rule" "app_listener_rule" {
      + arn          = (known after apply)
      + id           = (known after apply)
      + listener_arn = (known after apply)
      + priority     = 10
      + region       = "us-east-1"
      + tags         = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-rule-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all     = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-rule-dev"
          + "TerraformProject" = "dp-webapp"
        }

      + action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }

      + condition {
          + http_request_method {
              + values = [
                  + "GET",
                ]
            }
        }
    }

  # module.ec2_asg_target.aws_lb_target_group.app_target_group will be created
  + resource "aws_lb_target_group" "app_target_group" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + connection_termination             = (known after apply)
      + deregistration_delay               = "20"
      + id                                 = (known after apply)
      + ip_address_type                    = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancer_arns                 = (known after apply)
      + load_balancing_algorithm_type      = (known after apply)
      + load_balancing_anomaly_mitigation  = (known after apply)
      + load_balancing_cross_zone_enabled  = (known after apply)
      + name                               = "dp-webapp-tg-dev"
      + name_prefix                        = (known after apply)
      + port                               = 80
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "HTTP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + region                             = "us-east-1"
      + slow_start                         = 0
      + tags                               = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-tg-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-tg-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = true
          + healthy_threshold   = 3
          + interval            = 30
          + matcher             = "200"
          + path                = "/"
          + port                = "traffic-port"
          + protocol            = "HTTP"
          + timeout             = 5
          + unhealthy_threshold = 3
        }

      + stickiness (known after apply)

      + target_failover (known after apply)

      + target_group_health (known after apply)

      + target_health_state (known after apply)
    }

  # module.ec2_asg_target.aws_security_group.ec2_target_sg will be created
  + resource "aws_security_group" "ec2_target_sg" {
      + arn                    = (known after apply)
      + description            = "Allow traffic from ALB to EC2 instances for dp-webapp"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow all outbound traffic"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = []
              + description      = "Allow traffic from the Application Load Balancer"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = "dp-webapp-ec2-sg-"
      + owner_id               = (known after apply)
      + region                 = "us-east-1"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-ec2-sg-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all               = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-ec2-sg-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id                 = (known after apply)
    }

  # module.ec2_launch_template.aws_iam_instance_profile.ssm_instance_profile[0] will be created
  + resource "aws_iam_instance_profile" "ssm_instance_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = (known after apply)
      + name_prefix = "dp-webapp-dev-ssm-profile-"
      + path        = "/"
      + role        = (known after apply)
      + tags        = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all    = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + unique_id   = (known after apply)
    }

  # module.ec2_launch_template.aws_iam_role.ssm_role[0] will be created
  + resource "aws_iam_role" "ssm_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = "EC2AssumeRole"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = (known after apply)
      + name_prefix           = "dp-webapp-dev-ssm-role-"
      + path                  = "/"
      + tags                  = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all              = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # module.ec2_launch_template.aws_iam_role_policy_attachment.ssm_policy_attach[0] will be created
  + resource "aws_iam_role_policy_attachment" "ssm_policy_attach" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      + role       = (known after apply)
    }

  # module.ec2_launch_template.aws_launch_template.main will be created
  + resource "aws_launch_template" "main" {
      + arn                    = (known after apply)
      + default_version        = (known after apply)
      + id                     = (known after apply)
      + image_id               = (sensitive value)
      + instance_type          = "t3.micro"
      + latest_version         = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "dp-webapp-dev"
      + region                 = "us-east-1"
      + tags                   = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all               = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + update_default_version = true
      + user_data              = "IyEvYmluL2Jhc2gKIyBUaGlzIHNjcmlwdCBpcyBleGVjdXRlZCBvbiBFQzIgaW5zdGFuY2UgbGF1bmNoIGFzIHVzZXIgZGF0YS4KIyBJdCBpbnN0YWxscyBuZWNlc3NhcnkgcGFja2FnZXMsIGNvbmZpZ3VyZXMgTmdpbnggd2l0aCBhIHNlbGYtc2lnbmVkIFNTTCBjZXJ0aWZpY2F0ZSwKIyBhbmQgY3JlYXRlcyBhIGR5bmFtaWMgaW5kZXguaHRtbCBwYWdlIGJhc2VkIG9uIGluc3RhbmNlIG1ldGFkYXRhLgoKZWNobyAiU3RhcnRpbmcgdXNlciBkYXRhIHNjcmlwdCBleGVjdXRpb24uLi4iCgojIFVwZGF0ZSBzeXN0ZW0gcGFja2FnZXMKc3VkbyBkbmYgdXBkYXRlIC15CgojIEluc3RhbGwgbmVjZXNzYXJ5IHBhY2thZ2VzCmVjaG8gIkluc3RhbGxpbmcgb3BlbnNzbCwgYW5kIG5naW54Li4uIgpzdWRvIGRuZiBpbnN0YWxsIC15IG9wZW5zc2wgbmdpbngKCiMgU3RhcnQgTmdpbnggc2VydmljZSBhbmQgZW5hYmxlIGl0IHRvIHN0YXJ0IG9uIGJvb3QKZWNobyAiU3RhcnRpbmcgTmdpbnggc2VydmljZS4uLiIKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKc3VkbyBzeXN0ZW1jdGwgZW5hYmxlIG5naW54CgojIC0tLSBGZXRjaCBJbnN0YW5jZSBNZXRhZGF0YSAoSU1EU3YyKSAtLS0KIyBJTURTdjIgcmVxdWlyZXMgYSB0b2tlbiBmb3IgYXV0aGVudGljYXRpb24uCmVjaG8gIkZldGNoaW5nIElNRFN2MiB0b2tlbi4uLiIKVE9LRU49JChjdXJsIC1YIFBVVCAiaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvYXBpL3Rva2VuIiAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuLXR0bC1zZWNvbmRzOiAyMTYwMCIpCgplY2hvICJGZXRjaGluZyBpbnN0YW5jZSBtZXRhZGF0YS4uLiIKSU5TVEFOQ0VfSUQ9JChjdXJsIC1IICJYLWF3cy1lYzItbWV0YWRhdGEtdG9rZW46ICRUT0tFTiIgaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvbWV0YS1kYXRhL2luc3RhbmNlLWlkKQpMT0NBTF9JUFY0PSQoY3VybCAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuOiAkVE9LRU4iIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9sb2NhbC1pcHY0KQpTVUJORVRfSUQ9JChjdXJsIC1IICJYLWF3cy1lYzItbWV0YWRhdGEtdG9rZW46ICRUT0tFTiIgaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvbWV0YS1kYXRhL25ldHdvcmsvaW50ZXJmYWNlcy9tYWNzLyQoY3VybCAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuOiAkVE9LRU4iIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9tYWMpL3N1Ym5ldC1pZCkKVlBDX0lEPSQoY3VybCAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuOiAkVE9LRU4iIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9uZXR3b3JrL2ludGVyZmFjZXMvbWFjcy8kKGN1cmwgLUggIlgtYXdzLWVjMi1tZXRhZGF0YS10b2tlbjogJFRPS0VOIiBodHRwOi8vMTY5LjI1NC4xNjkuMjU0L2xhdGVzdC9tZXRhLWRhdGEvbWFjKS92cGMtaWQpCkFWQUlMQUJJTElUWV9aT05FPSQoY3VybCAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuOiAkVE9LRU4iIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9wbGFjZW1lbnQvYXZhaWxhYmlsaXR5LXpvbmUpCgojIEdlbmVyYXRlIGEgc2ltcGxlIGluZGV4Lmh0bWwgcGFnZSB3aXRoIGluc3RhbmNlIGF0dHJpYnV0ZXMKZWNobyAiR2VuZXJhdGluZyBpbmRleC5odG1sLi4uIgpjYXQgPDxFT0YgPiAvdXNyL3NoYXJlL25naW54L2h0bWwvaW5kZXguaHRtbAo8IURPQ1RZUEUgaHRtbD4KPGh0bWwgbGFuZz0iZW4iPgo8aGVhZD4KICAgIDxtZXRhIGNoYXJzZXQ9IlVURi04Ij4KICAgIDxtZXRhIG5hbWU9InZpZXdwb3J0IiBjb250ZW50PSJ3aWR0aD1kZXZpY2Utd2lkdGgsIGluaXRpYWwtc2NhbGU9MS4wIj4KICAgIDx0aXRsZT5UZXJyYWZvcm0gRUMyIEluc3RhbmNlIEluZm88L3RpdGxlPgogICAgPHN0eWxlPgogICAgICAgIGJvZHkgeyBmb250LWZhbWlseTogJ0ludGVyJywgc2Fucy1zZXJpZjsgYmFja2dyb3VuZC1jb2xvcjogI2YwZjJmNTsgY29sb3I6ICMzMzM7IG1hcmdpbjogMDsgcGFkZGluZzogMjBweDsgZGlzcGxheTogZmxleDsganVzdGlmeS1jb250ZW50OiBjZW50ZXI7IGFsaWduLWl0ZW1zOiBjZW50ZXI7IG1pbi1oZWlnaHQ6IDEwMHZoOyB9CiAgICAgICAgLmNvbnRhaW5lciB7IGJhY2tncm91bmQtY29sb3I6ICNmZmY7IHBhZGRpbmc6IDMwcHg7IGJvcmRlci1yYWRpdXM6IDEycHg7IGJveC1zaGFkb3c6IDAgNHB4IDE1cHggcmdiYSgwLCAwLCAwLCAwLjEpOyBtYXgtd2lkdGg6IDYwMHB4OyB3aWR0aDogMTAwJTsgdGV4dC1hbGlnbjogY2VudGVyOyB9CiAgICAgICAgaDEgeyBjb2xvcjogIzJjM2U1MDsgbWFyZ2luLWJvdHRvbTogMjVweDsgfQogICAgICAgIHAgeyBtYXJnaW4tYm90dG9tOiAxNXB4OyBmb250LXNpemU6IDEuMWVtOyBsaW5lLWhlaWdodDogMS42OyB9CiAgICAgICAgc3Ryb25nIHsgY29sb3I6ICMzNDk4ZGI7IH0KICAgICAgICAuZm9vdGVyIHsgbWFyZ2luLXRvcDogMzBweDsgZm9udC1zaXplOiAwLjllbTsgY29sb3I6ICM3ZjhjOGQ7IH0KICAgIDwvc3R5bGU+CjwvaGVhZD4KPGJvZHk+CiAgICA8ZGl2IGNsYXNzPSJjb250YWluZXIiPgogICAgICAgIDxoMT5IZWxsbywgRGV2T3BzIFRlc3QhPC9oMT4KICAgICAgICA8aDI+V2VsY29tZSB0byBZb3VyIFRlcnJhZm9ybS1EZXBsb3llZCBFQzIgSW5zdGFuY2UhPC9oMj4KICAgICAgICA8cD5UaGlzIHBhZ2Ugd2FzIGdlbmVyYXRlZCBkeW5hbWljYWxseSBmcm9tIGluc3RhbmNlIG1ldGFkYXRhLjwvcD4KICAgICAgICA8cD48c3Ryb25nPkluc3RhbmNlIElEOjwvc3Ryb25nPiAke0lOU1RBTkNFX0lEfTwvcD4KICAgICAgICA8cD48c3Ryb25nPkxvY2FsIElQdjQ6PC9zdHJvbmc+ICR7TE9DQUxfSVBWNH08L3A+CiAgICAgICAgPHA+PHN0cm9uZz5TdWJuZXQgSUQ6PC9zdHJvbmc+ICR7U1VCTkVUX0lEfTwvcD4KICAgICAgICA8cD48c3Ryb25nPlZQQyBJRDo8L3N0cm9uZz4gJHtWUENfSUR9PC9wPgogICAgICAgIDxwPjxzdHJvbmc+QXZhaWxhYmlsaXR5IFpvbmU6PC9zdHJvbmc+ICR7QVZBSUxBQklMSVRZX1pPTkV9PC9wPgogICAgICAgIDxkaXYgY2xhc3M9ImZvb3RlciI+CiAgICAgICAgICAgIDxwPiZjb3B5OyAkKGRhdGUgKyVZKSBUZXJyYWZvcm0gUHJvamVjdC4gQWxsIHJpZ2h0cyByZXNlcnZlZC48L3A+CiAgICAgICAgPC9kaXY+CiAgICA8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+CkVPRgoKIyAtLS0gQ29uZmlndXJlIE5naW54IHdpdGggU2VsZi1TaWduZWQgVExTIENlcnRpZmljYXRlIC0tLQojIG5vdCBuZWNlc3NhcnkgZm9yIHRoaXMgYXNzZXNzbWVudCB0YXNrIGJ1dCBkZW1vbnN0cmF0ZXMgbWV0aG9kIHRvIHVzZSBlcGhlbWVyYWwgc2VsZi1zaWduZWQgY2VydHMgaW4gdGFyZ2V0cwojIHRvIHN1cHBvcnQgZnVsbC1wYXRoIFRMUwplY2hvICJHZW5lcmF0aW5nIHNlbGYtc2lnbmVkIFNTTCBjZXJ0aWZpY2F0ZS4uLiIKc3VkbyBvcGVuc3NsIHJlcSAteDUwOSAtbm9kZXMgLWRheXMgMzY1IC1uZXdrZXkgcnNhOjIwNDggXAogICAgLWtleW91dCAvZXRjL25naW54L25naW54LmtleSBcCiAgICAtb3V0IC9ldGMvbmdpbngvbmdpbnguY3J0IFwKICAgIC1zdWJqICIvQz1VUy9TVD1DQS9MPVNpbWlWYWxsZXkvTz1NeU9yZy9PVT1JVC9DTj1leGFtcGxlLmNvbSIKCmVjaG8gIkNvbmZpZ3VyaW5nIE5naW54Li4uIgpzdWRvIHRlZSAvZXRjL25naW54L25naW54LmNvbmYgPiAvZGV2L251bGwgPDxFT0YKdXNlciBuZ2lueDsKd29ya2VyX3Byb2Nlc3NlcyBhdXRvOwplcnJvcl9sb2cgL3Zhci9sb2cvbmdpbngvZXJyb3IubG9nOwpwaWQgL3J1bi9uZ2lueC5waWQ7CgppbmNsdWRlIC91c3Ivc2hhcmUvbmdpbngvbW9kdWxlcy8qLmNvbmY7CgpldmVudHMgewogICAgd29ya2VyX2Nvbm5lY3Rpb25zIDEwMjQ7Cn0KCmh0dHAgewogICAgbG9nX2Zvcm1hdCAgbWFpbiAgJ1wkcmVtb3RlX2FkZHIgLSBcJHJlbW90ZV91c2VyIFtcJHRpbWVfbG9jYWxdICJcJHJlcXVlc3QiICcKICAgICAgICAgICAgICAgICAgICAgICdcJHN0YXR1cyBcJGJvZHlfYnl0ZXNfc2VudCAiXCRodHRwX3JlZmVyZXIiICcKICAgICAgICAgICAgICAgICAgICAgICciXCRodHRwX3VzZXJfYWdlbnQiICJcJGh0dHBfeF9mb3J3YXJkZWRfZm9yIic7CgogICAgYWNjZXNzX2xvZyAgL3Zhci9sb2cvbmdpbngvYWNjZXNzLmxvZyAgbWFpbjsKCiAgICBzZW5kZmlsZSAgICAgICAgICAgIG9uOwogICAgdGNwX25vcHVzaCAgICAgICAgICBvbjsKICAgIHRjcF9ub2RlbGF5ICAgICAgICAgb247CiAgICBrZWVwYWxpdmVfdGltZW91dCAgIDY1OwogICAgdHlwZXNfaGFzaF9tYXhfc2l6ZSAyMDQ4OwoKICAgIGluY2x1ZGUgICAgICAgICAgICAgL2V0Yy9uZ2lueC9taW1lLnR5cGVzOwogICAgZGVmYXVsdF90eXBlICAgICAgICBhcHBsaWNhdGlvbi9vY3RldC1zdHJlYW07CgogICAgIyBMb2FkIG1vZHVsYXIgY29uZmlndXJhdGlvbiBmaWxlcyBmcm9tIHRoZSAvZXRjL25naW54L2NvbmYuZCBkaXJlY3RvcnkuCiAgICAjIFNlZSBodHRwOi8vbmdpbngub3JnL2VuL2RvY3Mvbmd4X2NvcmVfbW9kdWxlLmh0bWwjaW5jbHVkZQogICAgIyBmb3IgbW9yZSBpbmZvcm1hdGlvbi4KICAgIGluY2x1ZGUgL2V0Yy9uZ2lueC9jb25mLmQvKi5jb25mOwoKICAgIHNlcnZlciB7CiAgICAgICAgbGlzdGVuIDgwOwogICAgICAgIHNlcnZlcl9uYW1lIF87CgogICAgICAgICMgZm9yIHByb2R1Y3Rpb24gdXNlIGZvcmNlIGh0dHBzCiAgICAgICAgIyByZXR1cm4gMzAxIGh0dHBzOi8vXCRob3N0XCRyZXF1ZXN0X3VyaTsgIyBSZWRpcmVjdCBIVFRQIHRvIEhUVFBTCiAgICAgICAgIyBpbnN0ZWFkIGp1c3Qgc2hvdyBwYWdlIQogICAgICAgIGxvY2F0aW9uIC8gewogICAgICAgICAgICByb290IC91c3Ivc2hhcmUvbmdpbngvaHRtbDsKICAgICAgICAgICAgaW5kZXggaW5kZXguaHRtbDsKICAgICAgICAgICAgdHJ5X2ZpbGVzIFwkdXJpIFwkdXJpLyA9NDA0OwogICAgICAgIH0KCiAgICAgICAgZXJyb3JfcGFnZSA0MDQgLzQwNC5odG1sOwogICAgICAgIGxvY2F0aW9uID0gLzQwNC5odG1sIHsKICAgICAgICAgICAgaW50ZXJuYWw7CiAgICAgICAgfQoKICAgICAgICBlcnJvcl9wYWdlIDUwMCA1MDIgNTAzIDUwNCAvNTB4Lmh0bWw7CiAgICAgICAgbG9jYXRpb24gPSAvNTB4Lmh0bWwgewogICAgICAgICAgICBpbnRlcm5hbDsKICAgICAgICB9CiAgICB9CgogICAgc2VydmVyIHsKICAgICAgICBsaXN0ZW4gNDQzIHNzbDsKICAgICAgICBzZXJ2ZXJfbmFtZSBfOwoKICAgICAgICBzc2xfY2VydGlmaWNhdGUgL2V0Yy9uZ2lueC9uZ2lueC5jcnQ7CiAgICAgICAgc3NsX2NlcnRpZmljYXRlX2tleSAvZXRjL25naW54L25naW54LmtleTsKCiAgICAgICAgc3NsX3Nlc3Npb25fY2FjaGUgc2hhcmVkOlNTTDoxbTsKICAgICAgICBzc2xfc2Vzc2lvbl90aW1lb3V0IDVtOwogICAgICAgIHNzbF9jaXBoZXJzIEhJR0g6IWFOVUxMOiFNRDU7CiAgICAgICAgc3NsX3ByZWZlcl9zZXJ2ZXJfY2lwaGVycyBvbjsKCiAgICAgICAgbG9jYXRpb24gLyB7CiAgICAgICAgICAgIHJvb3QgL3Vzci9zaGFyZS9uZ2lueC9odG1sOwogICAgICAgICAgICBpbmRleCBpbmRleC5odG1sOwogICAgICAgICAgICB0cnlfZmlsZXMgXCR1cmkgXCR1cmkvID00MDQ7CiAgICAgICAgfQoKICAgICAgICBlcnJvcl9wYWdlIDQwNCAvNDA0Lmh0bWw7CiAgICAgICAgbG9jYXRpb24gPSAvNDA0Lmh0bWwgewogICAgICAgICAgICBpbnRlcm5hbDsKICAgICAgICB9CgogICAgICAgIGVycm9yX3BhZ2UgNTAwIDUwMiA1MDMgNTA0IC81MHguaHRtbDsKICAgICAgICBsb2NhdGlvbiA9IC81MHguaHRtbCB7CiAgICAgICAgICAgIGludGVybmFsOwogICAgICAgIH0KICAgIH0KfQpFT0YKCiMgUmVzdGFydCBOZ2lueCB0byBhcHBseSBjaGFuZ2VzCmVjaG8gIlJlc3RhcnRpbmcgTmdpbnggdG8gYXBwbHkgbmV3IGNvbmZpZ3VyYXRpb24uLi4iCnN1ZG8gc3lzdGVtY3RsIHJlc3RhcnQgbmdpbngKCmVjaG8gIlVzZXIgZGF0YSBzY3JpcHQgY29tcGxldGVkLiIKCg=="

      + block_device_mappings {
          + device_name = "/dev/sda1"

          + ebs {
              + delete_on_termination      = "true"
              + encrypted                  = "true"
              + iops                       = (known after apply)
              + throughput                 = (known after apply)
              + volume_initialization_rate = (known after apply)
              + volume_size                = 30
              + volume_type                = "gp3"
            }
        }

      + iam_instance_profile (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + monitoring {
          + enabled = true
        }

      + network_interfaces {
          + associate_public_ip_address = "false"
          + delete_on_termination       = "true"
          + security_groups             = (known after apply)
        }

      + tag_specifications {
          + resource_type = "instance"
          + tags          = {
              + "Author"           = "David Powers"
              + "AuthorEmail"      = "david@powersemail.com"
              + "Name"             = "dp-webapp-dev-instance"
              + "TerraformProject" = "dp-webapp"
            }
        }
      + tag_specifications {
          + resource_type = "volume"
          + tags          = {
              + "Author"           = "David Powers"
              + "AuthorEmail"      = "david@powersemail.com"
              + "Name"             = "dp-webapp-dev-volume"
              + "TerraformProject" = "dp-webapp"
            }
        }
      + tag_specifications {
          + resource_type = "network-interface"
          + tags          = {
              + "Author"           = "David Powers"
              + "AuthorEmail"      = "david@powersemail.com"
              + "Name"             = "dp-webapp-dev-eni"
              + "TerraformProject" = "dp-webapp"
            }
        }
    }

  # module.ec2_launch_template.aws_ssm_parameter.launch_template_arn will be created
  + resource "aws_ssm_parameter" "launch_template_arn" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "ARN of the EC2 Launch Template for dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/ec2/launch-templates/dp-webapp-dev/arn"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

  # module.ec2_launch_template.aws_ssm_parameter.launch_template_id will be created
  + resource "aws_ssm_parameter" "launch_template_id" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "ID of the EC2 Launch Template for dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/ec2/launch-templates/dp-webapp-dev/id"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

  # module.ec2_launch_template.aws_ssm_parameter.launch_template_latest_version will be created
  + resource "aws_ssm_parameter" "launch_template_latest_version" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "Latest version of the EC2 Launch Template for dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/ec2/launch-templates/dp-webapp-dev/latest_version"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

  # module.ec2_launch_template.aws_ssm_parameter.project_ami_id will be created
  + resource "aws_ssm_parameter" "project_ami_id" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "AMI ID used for EC2 Launch Template dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/ec2/launch-templates/dp-webapp-dev/ami_id"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

  # module.shared_alb.data.aws_vpc.selected_vpc will be read during apply
  # (config refers to values not yet known)
 <= data "aws_vpc" "selected_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = (known after apply)
      + cidr_block_associations              = (known after apply)
      + default                              = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = (known after apply)
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + region                               = (known after apply)
      + state                                = (known after apply)
      + tags                                 = (known after apply)
    }

  # module.shared_alb.aws_lb.shared_alb will be created
  + resource "aws_lb" "shared_alb" {
      + arn                                                          = (known after apply)
      + arn_suffix                                                   = (known after apply)
      + client_keep_alive                                            = 3600
      + desync_mitigation_mode                                       = "defensive"
      + dns_name                                                     = (known after apply)
      + drop_invalid_header_fields                                   = false
      + enable_deletion_protection                                   = false
      + enable_http2                                                 = true
      + enable_tls_version_and_cipher_suite_headers                  = false
      + enable_waf_fail_open                                         = false
      + enable_xff_client_port                                       = false
      + enable_zonal_shift                                           = false
      + enforce_security_group_inbound_rules_on_private_link_traffic = (known after apply)
      + id                                                           = (known after apply)
      + idle_timeout                                                 = 60
      + internal                                                     = false
      + ip_address_type                                              = (known after apply)
      + load_balancer_type                                           = "application"
      + name                                                         = "dp-webapp-dev"
      + name_prefix                                                  = (known after apply)
      + preserve_host_header                                         = false
      + region                                                       = "us-east-1"
      + security_groups                                              = (known after apply)
      + subnets                                                      = (known after apply)
      + tags                                                         = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                                                     = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id                                                       = (known after apply)
      + xff_header_processing_mode                                   = "append"
      + zone_id                                                      = (known after apply)

      + access_logs {
          + bucket  = "dp-webapp-dev-349580787393-us-east-1"
          + enabled = true
          + prefix  = "dp-webapp"
        }

      + subnet_mapping (known after apply)
    }

  # module.shared_alb.aws_lb_listener.shared_alb_listener_http[0] will be created
  + resource "aws_lb_listener" "shared_alb_listener_http" {
      + arn                                                                   = (known after apply)
      + id                                                                    = (known after apply)
      + load_balancer_arn                                                     = (known after apply)
      + port                                                                  = 80
      + protocol                                                              = "HTTP"
      + region                                                                = "us-east-1"
      + routing_http_request_x_amzn_mtls_clientcert_header_name               = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_issuer_header_name        = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_leaf_header_name          = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_serial_number_header_name = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_subject_header_name       = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_validity_header_name      = (known after apply)
      + routing_http_request_x_amzn_tls_cipher_suite_header_name              = (known after apply)
      + routing_http_request_x_amzn_tls_version_header_name                   = (known after apply)
      + routing_http_response_access_control_allow_credentials_header_value   = (known after apply)
      + routing_http_response_access_control_allow_headers_header_value       = (known after apply)
      + routing_http_response_access_control_allow_methods_header_value       = (known after apply)
      + routing_http_response_access_control_allow_origin_header_value        = (known after apply)
      + routing_http_response_access_control_expose_headers_header_value      = (known after apply)
      + routing_http_response_access_control_max_age_header_value             = (known after apply)
      + routing_http_response_content_security_policy_header_value            = (known after apply)
      + routing_http_response_server_enabled                                  = (known after apply)
      + routing_http_response_strict_transport_security_header_value          = (known after apply)
      + routing_http_response_x_content_type_options_header_value             = (known after apply)
      + routing_http_response_x_frame_options_header_value                    = (known after apply)
      + ssl_policy                                                            = (known after apply)
      + tags                                                                  = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-listener-http-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                                                              = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-listener-http-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + tcp_idle_timeout_seconds                                              = (known after apply)

      + default_action {
          + order = (known after apply)
          + type  = "fixed-response"

          + fixed_response {
              + content_type = "text/plain"
              + message_body = "No matching rule found. Default fixed-response triggered. dp-webapp-listener-http-dev HTTP:80"
              + status_code  = "200"
            }
        }

      + mutual_authentication (known after apply)
    }

  # module.shared_alb.aws_s3_bucket.alb_access_logs_bucket[0] will be created
  + resource "aws_s3_bucket" "alb_access_logs_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "dp-webapp-dev-349580787393-us-east-1"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_region               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = true
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = "us-east-1"
      + request_payer               = (known after apply)
      + tags                        = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-349580787393-us-east-1"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all                    = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-dev-349580787393-us-east-1"
          + "TerraformProject" = "dp-webapp"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0] will be created
  + resource "aws_s3_bucket_lifecycle_configuration" "alb_access_logs_bucket_lifecycle" {
      + bucket                                 = (known after apply)
      + expected_bucket_owner                  = (known after apply)
      + id                                     = (known after apply)
      + region                                 = "us-east-1"
      + transition_default_minimum_object_size = "all_storage_classes_128K"

      + rule {
          + id     = "alb-logs-lifecycle"
          + status = "Enabled"
            # (1 unchanged attribute hidden)

          + abort_incomplete_multipart_upload {
              + days_after_initiation = 7
            }

          + expiration {
              + days                         = 60
              + expired_object_delete_marker = false
            }

          + filter {
              + prefix = "dp-webapp"
            }
        }
    }

  # module.shared_alb.aws_s3_bucket_ownership_controls.alb_access_logs_bucket_ownership[0] will be created
  + resource "aws_s3_bucket_ownership_controls" "alb_access_logs_bucket_ownership" {
      + bucket = (known after apply)
      + id     = (known after apply)
      + region = "us-east-1"

      + rule {
          + object_ownership = "BucketOwnerPreferred"
        }
    }

  # module.shared_alb.aws_s3_bucket_policy.alb_access_logs_bucket_policy[0] will be created
  + resource "aws_s3_bucket_policy" "alb_access_logs_bucket_policy" {
      + bucket = (known after apply)
      + id     = (known after apply)
      + policy = (known after apply)
      + region = "us-east-1"
    }

  # module.shared_alb.aws_s3_bucket_server_side_encryption_configuration.alb_access_logs_bucket_encryption[0] will be created
  + resource "aws_s3_bucket_server_side_encryption_configuration" "alb_access_logs_bucket_encryption" {
      + bucket = (known after apply)
      + id     = (known after apply)
      + region = "us-east-1"

      + rule {
          + apply_server_side_encryption_by_default {
              + sse_algorithm     = "AES256"
                # (1 unchanged attribute hidden)
            }
        }
    }

  # module.shared_alb.aws_s3_bucket_versioning.alb_access_logs_bucket_versioning[0] will be created
  + resource "aws_s3_bucket_versioning" "alb_access_logs_bucket_versioning" {
      + bucket = (known after apply)
      + id     = (known after apply)
      + region = "us-east-1"

      + versioning_configuration {
          + mfa_delete = (known after apply)
          + status     = "Enabled"
        }
    }

  # module.shared_alb.aws_security_group.alb_sg will be created
  + resource "aws_security_group" "alb_sg" {
      + arn                    = (known after apply)
      + description            = "Security group for dp-webapp-dev ALB"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow all outbound traffic by default with no explicit egress"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = (known after apply)
              + description      = "Allow HTTP from VPC CIDR"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow HTTP from 0.0.0.0/0"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "dp-webapp-sg-dev"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + region                 = "us-east-1"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-sg-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all               = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "Name"             = "dp-webapp-sg-dev"
          + "TerraformProject" = "dp-webapp"
        }
      + vpc_id                 = (known after apply)
    }

  # module.shared_alb.aws_ssm_parameter.alb-access-logs-s3-bucket-arn[0] will be created
  + resource "aws_ssm_parameter" "alb-access-logs-s3-bucket-arn" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "ARN of the S3 bucket for ALB access logs for dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/shared-resources/dp-webapp-dev/alb-access-logs-s3-bucket-arn"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

  # module.shared_alb.aws_ssm_parameter.alb-arn will be created
  + resource "aws_ssm_parameter" "alb-arn" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "ARN of the shared Application Load Balancer for dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/shared-resources/dp-webapp-dev/alb-arn"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

  # module.shared_alb.aws_ssm_parameter.alb-dns-name will be created
  + resource "aws_ssm_parameter" "alb-dns-name" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "DNS name of the shared Application Load Balancer for dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/shared-resources/dp-webapp-dev/alb-dns-name"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

  # module.shared_alb.aws_ssm_parameter.alb-listener-http-arn[0] will be created
  + resource "aws_ssm_parameter" "alb-listener-http-arn" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "ARN of the HTTP listener (port 80) for dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/shared-resources/dp-webapp-dev/alb-listener-http-arn"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

  # module.shared_alb.aws_ssm_parameter.alb-security-group-id will be created
  + resource "aws_ssm_parameter" "alb-security-group-id" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "ID of the security group attached to the ALB for dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/shared-resources/dp-webapp-dev/alb-security-group-id"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

  # module.shared_alb.aws_ssm_parameter.alb-zone-id will be created
  + resource "aws_ssm_parameter" "alb-zone-id" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + description    = "Route 53 Hosted Zone ID of the shared Application Load Balancer for dp-webapp-dev"
      + has_value_wo   = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/shared-resources/dp-webapp-dev/alb-zone-id"
      + region         = "us-east-1"
      + tags           = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tags_all       = {
          + "Author"           = "David Powers"
          + "AuthorEmail"      = "david@powersemail.com"
          + "TerraformProject" = "dp-webapp"
        }
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + value_wo       = (write-only attribute)
      + version        = (known after apply)
    }

Plan: 45 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + alb_dns_name             = (known after apply)
  + alb_security_group_id    = (known after apply)
  + ec2_asg_target_asg_name  = "dp-webapp-asg-dev"
  + ec2_asg_target_group_arn = (known after apply)
  + private_subnet_ids       = [
      + (known after apply),
      + (known after apply),
    ]
  + public_subnet_ids        = [
      + (known after apply),
      + (known after apply),
    ]
  + vpc_id                   = (known after apply)

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: tfplan_20250725_080551.out

To perform exactly these actions, run the following command to apply:
    terraform apply "tfplan_20250725_080551.out"
Running terraform apply for target environment dev.
module.basic_vpc.aws_vpc.main: Creating...
module.basic_vpc.aws_eip.nat_gateway_eip[0]: Creating...
module.ec2_launch_template.aws_iam_role.ssm_role[0]: Creating...
module.ec2_launch_template.aws_ssm_parameter.project_ami_id: Creating...
module.shared_alb.aws_s3_bucket.alb_access_logs_bucket[0]: Creating...
module.ec2_launch_template.aws_ssm_parameter.project_ami_id: Creation complete after 1s [id=/ec2/launch-templates/dp-webapp-dev/ami_id]
module.ec2_launch_template.aws_iam_role.ssm_role[0]: Creation complete after 1s [id=dp-webapp-dev-ssm-role-20250725150556437000000001]
module.ec2_launch_template.aws_iam_role_policy_attachment.ssm_policy_attach[0]: Creating...
module.ec2_launch_template.aws_iam_instance_profile.ssm_instance_profile[0]: Creating...
module.basic_vpc.aws_eip.nat_gateway_eip[0]: Creation complete after 2s [id=eipalloc-071289c3849acdc74]
module.ec2_launch_template.aws_iam_role_policy_attachment.ssm_policy_attach[0]: Creation complete after 1s [id=dp-webapp-dev-ssm-role-20250725150556437000000001/arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore]
module.shared_alb.aws_s3_bucket.alb_access_logs_bucket[0]: Creation complete after 3s [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_s3_bucket_ownership_controls.alb_access_logs_bucket_ownership[0]: Creating...
module.shared_alb.aws_s3_bucket_versioning.alb_access_logs_bucket_versioning[0]: Creating...
module.shared_alb.aws_ssm_parameter.alb-access-logs-s3-bucket-arn[0]: Creating...
module.shared_alb.aws_s3_bucket_server_side_encryption_configuration.alb_access_logs_bucket_encryption[0]: Creating...
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Creating...
module.shared_alb.aws_ssm_parameter.alb-access-logs-s3-bucket-arn[0]: Creation complete after 1s [id=/shared-resources/dp-webapp-dev/alb-access-logs-s3-bucket-arn]
module.shared_alb.aws_s3_bucket_ownership_controls.alb_access_logs_bucket_ownership[0]: Creation complete after 1s [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_s3_bucket_policy.alb_access_logs_bucket_policy[0]: Creating...
module.shared_alb.aws_s3_bucket_server_side_encryption_configuration.alb_access_logs_bucket_encryption[0]: Creation complete after 1s [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_s3_bucket_policy.alb_access_logs_bucket_policy[0]: Creation complete after 0s [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_s3_bucket_versioning.alb_access_logs_bucket_versioning[0]: Creation complete after 2s [id=dp-webapp-dev-349580787393-us-east-1]
module.ec2_launch_template.aws_iam_instance_profile.ssm_instance_profile[0]: Creation complete after 7s [id=dp-webapp-dev-ssm-profile-20250725150557396800000002]
module.basic_vpc.aws_vpc.main: Still creating... [00m10s elapsed]
module.basic_vpc.aws_vpc.main: Creation complete after 13s [id=vpc-03f3ebd6ea9460bfb]
module.shared_alb.data.aws_vpc.selected_vpc: Reading...
module.basic_vpc.aws_internet_gateway.main: Creating...
module.basic_vpc.aws_subnet.private[0]: Creating...
module.basic_vpc.aws_subnet.private[1]: Creating...
module.basic_vpc.aws_subnet.public[1]: Creating...
module.basic_vpc.aws_subnet.public[0]: Creating...
module.ec2_asg_target.aws_lb_target_group.app_target_group: Creating...
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Still creating... [00m10s elapsed]
module.basic_vpc.aws_internet_gateway.main: Creation complete after 1s [id=igw-07cd5420e68637509]
module.basic_vpc.aws_route_table.public: Creating...
module.basic_vpc.aws_subnet.private[0]: Creation complete after 1s [id=subnet-020467bad4b99eee8]
module.shared_alb.data.aws_vpc.selected_vpc: Read complete after 1s [id=vpc-03f3ebd6ea9460bfb]
module.shared_alb.aws_security_group.alb_sg: Creating...
module.basic_vpc.aws_subnet.private[1]: Creation complete after 1s [id=subnet-05a61bc7f6d2a3da6]
module.basic_vpc.aws_subnet.public[1]: Creation complete after 1s [id=subnet-0b1deef31d0e1be81]
module.basic_vpc.aws_subnet.public[0]: Creation complete after 1s [id=subnet-0760c8b586f5cd85e]
module.basic_vpc.aws_nat_gateway.main[0]: Creating...
module.ec2_asg_target.aws_lb_target_group.app_target_group: Creation complete after 2s [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a]
module.basic_vpc.aws_route_table.public: Creation complete after 2s [id=rtb-002cf1ee5625a84f8]
module.basic_vpc.aws_route_table_association.public[1]: Creating...
module.basic_vpc.aws_route_table_association.public[0]: Creating...
module.basic_vpc.aws_route_table_association.public[1]: Creation complete after 0s [id=rtbassoc-03c50543af22f3015]
module.basic_vpc.aws_route_table_association.public[0]: Creation complete after 0s [id=rtbassoc-0df7843ff800a38a9]
module.shared_alb.aws_security_group.alb_sg: Creation complete after 3s [id=sg-0f74761e2c0379f15]
module.shared_alb.aws_ssm_parameter.alb-security-group-id: Creating...
module.shared_alb.aws_lb.shared_alb: Creating...
module.ec2_asg_target.aws_security_group.ec2_target_sg: Creating...
module.shared_alb.aws_ssm_parameter.alb-security-group-id: Creation complete after 1s [id=/shared-resources/dp-webapp-dev/alb-security-group-id]
module.ec2_asg_target.aws_security_group.ec2_target_sg: Creation complete after 3s [id=sg-06e9b17858b22f671]
module.ec2_launch_template.aws_launch_template.main: Creating...
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Still creating... [00m20s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [00m10s elapsed]
module.ec2_launch_template.aws_launch_template.main: Creation complete after 6s [id=lt-084b4530d502ebfba]
module.ec2_launch_template.aws_ssm_parameter.launch_template_id: Creating...
module.ec2_launch_template.aws_ssm_parameter.launch_template_arn: Creating...
module.ec2_launch_template.aws_ssm_parameter.launch_template_latest_version: Creating...
module.ec2_asg_target.aws_autoscaling_group.app_asg: Creating...
module.ec2_launch_template.aws_ssm_parameter.launch_template_id: Creation complete after 1s [id=/ec2/launch-templates/dp-webapp-dev/id]
module.ec2_launch_template.aws_ssm_parameter.launch_template_latest_version: Creation complete after 1s [id=/ec2/launch-templates/dp-webapp-dev/latest_version]
module.shared_alb.aws_lb.shared_alb: Still creating... [00m10s elapsed]
module.ec2_launch_template.aws_ssm_parameter.launch_template_arn: Creation complete after 1s [id=/ec2/launch-templates/dp-webapp-dev/arn]
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Still creating... [00m30s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [00m20s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still creating... [00m10s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [00m20s elapsed]
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Still creating... [00m40s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Creation complete after 18s [id=dp-webapp-asg-dev]
module.ec2_asg_target.aws_autoscaling_policy.scale_up[0]: Creating...
module.ec2_asg_target.aws_autoscaling_policy.scale_down[0]: Creating...
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [00m30s elapsed]
module.ec2_asg_target.aws_autoscaling_policy.scale_down[0]: Creation complete after 0s [id=dp-webapp-asg-dev-scale-down]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0]: Creating...
module.ec2_asg_target.aws_autoscaling_policy.scale_up[0]: Creation complete after 1s [id=dp-webapp-asg-dev-scale-up]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0]: Creating...
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0]: Creation complete after 1s [id=dp-webapp-asg-dev-cpu-low-alarm]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0]: Creation complete after 0s [id=dp-webapp-asg-dev-cpu-high-alarm]
module.shared_alb.aws_lb.shared_alb: Still creating... [00m30s elapsed]
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Still creating... [00m50s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [00m40s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [00m40s elapsed]
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Creation complete after 58s [id=dp-webapp-dev-349580787393-us-east-1]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [00m50s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [00m50s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [01m00s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [01m00s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [01m10s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [01m10s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [01m20s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [01m20s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [01m30s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [01m30s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [01m40s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [01m40s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [01m50s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [01m50s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still creating... [02m00s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [02m00s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Creation complete after 2m6s [id=nat-0a107f79c4d2be190]
module.basic_vpc.aws_route_table.private[0]: Creating...
module.basic_vpc.aws_route_table.private[0]: Creation complete after 2s [id=rtb-009b771c73d2aa46b]
module.basic_vpc.aws_route_table_association.private[1]: Creating...
module.basic_vpc.aws_route_table_association.private[0]: Creating...
module.basic_vpc.aws_route_table_association.private[0]: Creation complete after 0s [id=rtbassoc-01dd1f0c5c0a36054]
module.basic_vpc.aws_route_table_association.private[1]: Creation complete after 1s [id=rtbassoc-037313876f98e5688]
module.shared_alb.aws_lb.shared_alb: Still creating... [02m10s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [02m20s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [02m30s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [02m40s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [02m50s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [03m00s elapsed]
module.shared_alb.aws_lb.shared_alb: Still creating... [03m10s elapsed]
module.shared_alb.aws_lb.shared_alb: Creation complete after 3m14s [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:loadbalancer/app/dp-webapp-dev/f688b17bf2bb8907]
module.shared_alb.aws_ssm_parameter.alb-arn: Creating...
module.shared_alb.aws_ssm_parameter.alb-dns-name: Creating...
module.shared_alb.aws_ssm_parameter.alb-zone-id: Creating...
module.shared_alb.aws_lb_listener.shared_alb_listener_http[0]: Creating...
module.shared_alb.aws_lb_listener.shared_alb_listener_http[0]: Creation complete after 1s [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:listener/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f]
module.shared_alb.aws_ssm_parameter.alb-listener-http-arn[0]: Creating...
module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0]: Creating...
module.shared_alb.aws_ssm_parameter.alb-dns-name: Creation complete after 1s [id=/shared-resources/dp-webapp-dev/alb-dns-name]
module.shared_alb.aws_ssm_parameter.alb-zone-id: Creation complete after 1s [id=/shared-resources/dp-webapp-dev/alb-zone-id]
module.shared_alb.aws_ssm_parameter.alb-arn: Creation complete after 1s [id=/shared-resources/dp-webapp-dev/alb-arn]
module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0]: Creation complete after 1s [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:listener-rule/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f/e09b3de0a86b5117]
module.shared_alb.aws_ssm_parameter.alb-listener-http-arn[0]: Creation complete after 1s [id=/shared-resources/dp-webapp-dev/alb-listener-http-arn]

Apply complete! Resources: 45 added, 0 changed, 0 destroyed.

Outputs:

alb_dns_name = "dp-webapp-dev-1370733107.us-east-1.elb.amazonaws.com"
alb_security_group_id = "sg-0f74761e2c0379f15"
ec2_asg_target_asg_name = "dp-webapp-asg-dev"
ec2_asg_target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a"
private_subnet_ids = [
  "subnet-020467bad4b99eee8",
  "subnet-05a61bc7f6d2a3da6",
]
public_subnet_ids = [
  "subnet-0760c8b586f5cd85e",
  "subnet-0b1deef31d0e1be81",
]
vpc_id = "vpc-03f3ebd6ea9460bfb"
```