```bash
➜  epcvip-devops-assessment git:(main) ✗ ./terraform_destroy.sh dev                                                                                    <aws:eai> <region:us-east-1>
Running terraform destroy for target environment dev
module.shared_alb.data.aws_elb_service_account.main[0]: Reading...
module.shared_alb.data.aws_caller_identity.current: Reading...
data.aws_partition.current: Reading...
data.aws_caller_identity.current: Reading...
module.basic_vpc.data.aws_availability_zones.available: Reading...
module.ec2_launch_template.data.aws_ssm_parameter.amazon_linux_2023_ami: Reading...
data.aws_region.current: Reading...
module.basic_vpc.aws_vpc.main: Refreshing state... [id=vpc-03f3ebd6ea9460bfb]
module.ec2_launch_template.aws_iam_role.ssm_role[0]: Refreshing state... [id=dp-webapp-dev-ssm-role-20250725150556437000000001]
module.basic_vpc.aws_eip.nat_gateway_eip[0]: Refreshing state... [id=eipalloc-071289c3849acdc74]
data.aws_region.current: Read complete after 0s [id=us-east-1]
data.aws_partition.current: Read complete after 0s [id=aws]
module.shared_alb.data.aws_elb_service_account.main[0]: Read complete after 0s [id=127311923021]
data.aws_caller_identity.current: Read complete after 0s [id=349580787393]
module.shared_alb.aws_s3_bucket.alb_access_logs_bucket[0]: Refreshing state... [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.data.aws_caller_identity.current: Read complete after 0s [id=349580787393]
module.basic_vpc.data.aws_availability_zones.available: Read complete after 0s [id=us-east-1]
module.ec2_launch_template.data.aws_ssm_parameter.amazon_linux_2023_ami: Read complete after 0s [id=/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64]
module.ec2_launch_template.aws_ssm_parameter.project_ami_id: Refreshing state... [id=/ec2/launch-templates/dp-webapp-dev/ami_id]
module.ec2_launch_template.aws_iam_role_policy_attachment.ssm_policy_attach[0]: Refreshing state... [id=dp-webapp-dev-ssm-role-20250725150556437000000001/arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore]
module.ec2_launch_template.aws_iam_instance_profile.ssm_instance_profile[0]: Refreshing state... [id=dp-webapp-dev-ssm-profile-20250725150557396800000002]
module.basic_vpc.aws_internet_gateway.main: Refreshing state... [id=igw-07cd5420e68637509]
module.shared_alb.data.aws_vpc.selected_vpc: Reading...
module.basic_vpc.aws_subnet.public[1]: Refreshing state... [id=subnet-0b1deef31d0e1be81]
module.basic_vpc.aws_subnet.public[0]: Refreshing state... [id=subnet-0760c8b586f5cd85e]
module.basic_vpc.aws_subnet.private[1]: Refreshing state... [id=subnet-05a61bc7f6d2a3da6]
module.basic_vpc.aws_subnet.private[0]: Refreshing state... [id=subnet-020467bad4b99eee8]
module.ec2_asg_target.aws_lb_target_group.app_target_group: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a]
module.basic_vpc.aws_route_table.public: Refreshing state... [id=rtb-002cf1ee5625a84f8]
module.basic_vpc.aws_nat_gateway.main[0]: Refreshing state... [id=nat-0a107f79c4d2be190]
module.shared_alb.aws_s3_bucket_versioning.alb_access_logs_bucket_versioning[0]: Refreshing state... [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Refreshing state... [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_s3_bucket_server_side_encryption_configuration.alb_access_logs_bucket_encryption[0]: Refreshing state... [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_s3_bucket_ownership_controls.alb_access_logs_bucket_ownership[0]: Refreshing state... [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_ssm_parameter.alb-access-logs-s3-bucket-arn[0]: Refreshing state... [id=/shared-resources/dp-webapp-dev/alb-access-logs-s3-bucket-arn]
module.basic_vpc.aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-03c50543af22f3015]
module.basic_vpc.aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-0df7843ff800a38a9]
module.basic_vpc.aws_route_table.private[0]: Refreshing state... [id=rtb-009b771c73d2aa46b]
module.basic_vpc.aws_route_table_association.private[0]: Refreshing state... [id=rtbassoc-01dd1f0c5c0a36054]
module.basic_vpc.aws_route_table_association.private[1]: Refreshing state... [id=rtbassoc-037313876f98e5688]
module.shared_alb.aws_s3_bucket_policy.alb_access_logs_bucket_policy[0]: Refreshing state... [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.data.aws_vpc.selected_vpc: Read complete after 0s [id=vpc-03f3ebd6ea9460bfb]
module.shared_alb.aws_security_group.alb_sg: Refreshing state... [id=sg-0f74761e2c0379f15]
module.shared_alb.aws_ssm_parameter.alb-security-group-id: Refreshing state... [id=/shared-resources/dp-webapp-dev/alb-security-group-id]
module.ec2_asg_target.aws_security_group.ec2_target_sg: Refreshing state... [id=sg-06e9b17858b22f671]
module.shared_alb.aws_lb.shared_alb: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:loadbalancer/app/dp-webapp-dev/f688b17bf2bb8907]
module.ec2_launch_template.aws_launch_template.main: Refreshing state... [id=lt-084b4530d502ebfba]
module.ec2_launch_template.aws_ssm_parameter.launch_template_id: Refreshing state... [id=/ec2/launch-templates/dp-webapp-dev/id]
module.ec2_launch_template.aws_ssm_parameter.launch_template_arn: Refreshing state... [id=/ec2/launch-templates/dp-webapp-dev/arn]
module.ec2_launch_template.aws_ssm_parameter.launch_template_latest_version: Refreshing state... [id=/ec2/launch-templates/dp-webapp-dev/latest_version]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Refreshing state... [id=dp-webapp-asg-dev]
module.shared_alb.aws_ssm_parameter.alb-zone-id: Refreshing state... [id=/shared-resources/dp-webapp-dev/alb-zone-id]
module.shared_alb.aws_ssm_parameter.alb-dns-name: Refreshing state... [id=/shared-resources/dp-webapp-dev/alb-dns-name]
module.shared_alb.aws_ssm_parameter.alb-arn: Refreshing state... [id=/shared-resources/dp-webapp-dev/alb-arn]
module.shared_alb.aws_lb_listener.shared_alb_listener_http[0]: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:listener/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f]
module.ec2_asg_target.aws_autoscaling_policy.scale_up[0]: Refreshing state... [id=dp-webapp-asg-dev-scale-up]
module.ec2_asg_target.aws_autoscaling_policy.scale_down[0]: Refreshing state... [id=dp-webapp-asg-dev-scale-down]
module.shared_alb.aws_ssm_parameter.alb-listener-http-arn[0]: Refreshing state... [id=/shared-resources/dp-webapp-dev/alb-listener-http-arn]
module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0]: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:listener-rule/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f/e09b3de0a86b5117]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0]: Refreshing state... [id=dp-webapp-asg-dev-cpu-low-alarm]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0]: Refreshing state... [id=dp-webapp-asg-dev-cpu-high-alarm]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.basic_vpc.aws_eip.nat_gateway_eip[0] will be destroyed
  - resource "aws_eip" "nat_gateway_eip" {
      - allocation_id            = "eipalloc-071289c3849acdc74" -> null
      - arn                      = "arn:aws:ec2:us-east-1:349580787393:elastic-ip/eipalloc-071289c3849acdc74" -> null
      - association_id           = "eipassoc-05c9b45cf977699fd" -> null
      - domain                   = "vpc" -> null
      - id                       = "eipalloc-071289c3849acdc74" -> null
      - network_border_group     = "us-east-1" -> null
      - network_interface        = "eni-0d8586c6e96e1a3b4" -> null
      - private_dns              = "ip-10-100-1-172.ec2.internal" -> null
      - private_ip               = "10.100.1.172" -> null
      - public_dns               = "ec2-54-80-35-215.compute-1.amazonaws.com" -> null
      - public_ip                = "54.80.35.215" -> null
      - public_ipv4_pool         = "amazon" -> null
      - region                   = "us-east-1" -> null
      - tags                     = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-nat-eip"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                 = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-nat-eip"
          - "TerraformProject" = "dp-webapp"
        } -> null
        # (5 unchanged attributes hidden)
    }

  # module.basic_vpc.aws_internet_gateway.main will be destroyed
  - resource "aws_internet_gateway" "main" {
      - arn      = "arn:aws:ec2:us-east-1:349580787393:internet-gateway/igw-07cd5420e68637509" -> null
      - id       = "igw-07cd5420e68637509" -> null
      - owner_id = "349580787393" -> null
      - region   = "us-east-1" -> null
      - tags     = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-igw"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-igw"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id   = "vpc-03f3ebd6ea9460bfb" -> null
    }

  # module.basic_vpc.aws_nat_gateway.main[0] will be destroyed
  - resource "aws_nat_gateway" "main" {
      - allocation_id                      = "eipalloc-071289c3849acdc74" -> null
      - association_id                     = "eipassoc-05c9b45cf977699fd" -> null
      - connectivity_type                  = "public" -> null
      - id                                 = "nat-0a107f79c4d2be190" -> null
      - network_interface_id               = "eni-0d8586c6e96e1a3b4" -> null
      - private_ip                         = "10.100.1.172" -> null
      - public_ip                          = "54.80.35.215" -> null
      - region                             = "us-east-1" -> null
      - secondary_allocation_ids           = [] -> null
      - secondary_private_ip_address_count = 0 -> null
      - secondary_private_ip_addresses     = [] -> null
      - subnet_id                          = "subnet-0760c8b586f5cd85e" -> null
      - tags                               = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-nat-gw"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                           = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-nat-gw"
          - "TerraformProject" = "dp-webapp"
        } -> null
    }

  # module.basic_vpc.aws_route_table.private[0] will be destroyed
  - resource "aws_route_table" "private" {
      - arn              = "arn:aws:ec2:us-east-1:349580787393:route-table/rtb-009b771c73d2aa46b" -> null
      - id               = "rtb-009b771c73d2aa46b" -> null
      - owner_id         = "349580787393" -> null
      - propagating_vgws = [] -> null
      - region           = "us-east-1" -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - nat_gateway_id             = "nat-0a107f79c4d2be190"
                # (11 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-private-rt"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all         = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-private-rt"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id           = "vpc-03f3ebd6ea9460bfb" -> null
    }

  # module.basic_vpc.aws_route_table.public will be destroyed
  - resource "aws_route_table" "public" {
      - arn              = "arn:aws:ec2:us-east-1:349580787393:route-table/rtb-002cf1ee5625a84f8" -> null
      - id               = "rtb-002cf1ee5625a84f8" -> null
      - owner_id         = "349580787393" -> null
      - propagating_vgws = [] -> null
      - region           = "us-east-1" -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-07cd5420e68637509"
                # (11 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-public-rt"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all         = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-public-rt"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id           = "vpc-03f3ebd6ea9460bfb" -> null
    }

  # module.basic_vpc.aws_route_table_association.private[0] will be destroyed
  - resource "aws_route_table_association" "private" {
      - id             = "rtbassoc-01dd1f0c5c0a36054" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-009b771c73d2aa46b" -> null
      - subnet_id      = "subnet-020467bad4b99eee8" -> null
        # (1 unchanged attribute hidden)
    }

  # module.basic_vpc.aws_route_table_association.private[1] will be destroyed
  - resource "aws_route_table_association" "private" {
      - id             = "rtbassoc-037313876f98e5688" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-009b771c73d2aa46b" -> null
      - subnet_id      = "subnet-05a61bc7f6d2a3da6" -> null
        # (1 unchanged attribute hidden)
    }

  # module.basic_vpc.aws_route_table_association.public[0] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0df7843ff800a38a9" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-002cf1ee5625a84f8" -> null
      - subnet_id      = "subnet-0760c8b586f5cd85e" -> null
        # (1 unchanged attribute hidden)
    }

  # module.basic_vpc.aws_route_table_association.public[1] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-03c50543af22f3015" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-002cf1ee5625a84f8" -> null
      - subnet_id      = "subnet-0b1deef31d0e1be81" -> null
        # (1 unchanged attribute hidden)
    }

  # module.basic_vpc.aws_subnet.private[0] will be destroyed
  - resource "aws_subnet" "private" {
      - arn                                            = "arn:aws:ec2:us-east-1:349580787393:subnet/subnet-020467bad4b99eee8" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.100.101.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-020467bad4b99eee8" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "349580787393" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - region                                         = "us-east-1" -> null
      - tags                                           = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-private-subnet-1"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                                       = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-private-subnet-1"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id                                         = "vpc-03f3ebd6ea9460bfb" -> null
        # (4 unchanged attributes hidden)
    }

  # module.basic_vpc.aws_subnet.private[1] will be destroyed
  - resource "aws_subnet" "private" {
      - arn                                            = "arn:aws:ec2:us-east-1:349580787393:subnet/subnet-05a61bc7f6d2a3da6" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1b" -> null
      - availability_zone_id                           = "use1-az4" -> null
      - cidr_block                                     = "10.100.102.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-05a61bc7f6d2a3da6" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "349580787393" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - region                                         = "us-east-1" -> null
      - tags                                           = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-private-subnet-2"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                                       = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-private-subnet-2"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id                                         = "vpc-03f3ebd6ea9460bfb" -> null
        # (4 unchanged attributes hidden)
    }

  # module.basic_vpc.aws_subnet.public[0] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:us-east-1:349580787393:subnet/subnet-0760c8b586f5cd85e" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.100.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0760c8b586f5cd85e" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "349580787393" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - region                                         = "us-east-1" -> null
      - tags                                           = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-public-subnet-1"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                                       = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-public-subnet-1"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id                                         = "vpc-03f3ebd6ea9460bfb" -> null
        # (4 unchanged attributes hidden)
    }

  # module.basic_vpc.aws_subnet.public[1] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:us-east-1:349580787393:subnet/subnet-0b1deef31d0e1be81" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1b" -> null
      - availability_zone_id                           = "use1-az4" -> null
      - cidr_block                                     = "10.100.2.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0b1deef31d0e1be81" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "349580787393" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - region                                         = "us-east-1" -> null
      - tags                                           = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-public-subnet-2"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                                       = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-public-subnet-2"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id                                         = "vpc-03f3ebd6ea9460bfb" -> null
        # (4 unchanged attributes hidden)
    }

  # module.basic_vpc.aws_vpc.main will be destroyed
  - resource "aws_vpc" "main" {
      - arn                                  = "arn:aws:ec2:us-east-1:349580787393:vpc/vpc-03f3ebd6ea9460bfb" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.100.0.0/16" -> null
      - default_network_acl_id               = "acl-054a7a717412d38e0" -> null
      - default_route_table_id               = "rtb-07691914800030c0b" -> null
      - default_security_group_id            = "sg-0b0c8d7a0b760da6f" -> null
      - dhcp_options_id                      = "dopt-0c0e9ee90315536fa" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-03f3ebd6ea9460bfb" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-07691914800030c0b" -> null
      - owner_id                             = "349580787393" -> null
      - region                               = "us-east-1" -> null
      - tags                                 = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-vpc"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                             = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-vpc"
          - "TerraformProject" = "dp-webapp"
        } -> null
        # (4 unchanged attributes hidden)
    }

  # module.ec2_asg_target.aws_autoscaling_group.app_asg will be destroyed
  - resource "aws_autoscaling_group" "app_asg" {
      - arn                              = "arn:aws:autoscaling:us-east-1:349580787393:autoScalingGroup:9a5033e2-9431-4495-ab7c-5fa8b77b106e:autoScalingGroupName/dp-webapp-asg-dev" -> null
      - availability_zones               = [
          - "us-east-1a",
          - "us-east-1b",
        ] -> null
      - capacity_rebalance               = false -> null
      - default_cooldown                 = 300 -> null
      - default_instance_warmup          = 0 -> null
      - desired_capacity                 = 2 -> null
      - enabled_metrics                  = [] -> null
      - force_delete                     = false -> null
      - force_delete_warm_pool           = false -> null
      - health_check_grace_period        = 300 -> null
      - health_check_type                = "EC2" -> null
      - id                               = "dp-webapp-asg-dev" -> null
      - ignore_failed_scaling_activities = false -> null
      - load_balancers                   = [] -> null
      - max_instance_lifetime            = 0 -> null
      - max_size                         = 6 -> null
      - metrics_granularity              = "1Minute" -> null
      - min_size                         = 2 -> null
      - name                             = "dp-webapp-asg-dev" -> null
      - predicted_capacity               = 0 -> null
      - protect_from_scale_in            = false -> null
      - region                           = "us-east-1" -> null
      - service_linked_role_arn          = "arn:aws:iam::349580787393:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling" -> null
      - suspended_processes              = [] -> null
      - target_group_arns                = [
          - "arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a",
        ] -> null
      - termination_policies             = [] -> null
      - vpc_zone_identifier              = [
          - "subnet-020467bad4b99eee8",
          - "subnet-05a61bc7f6d2a3da6",
        ] -> null
      - wait_for_capacity_timeout        = "10m" -> null
      - warm_pool_size                   = 0 -> null
        # (5 unchanged attributes hidden)

      - availability_zone_distribution {
          - capacity_distribution_strategy = "balanced-best-effort" -> null
        }

      - capacity_reservation_specification {
          - capacity_reservation_preference = "default" -> null
        }

      - launch_template {
          - id      = "lt-084b4530d502ebfba" -> null
          - name    = "dp-webapp-dev20250725150615608300000006" -> null
          - version = "1" -> null
        }

      - tag {
          - key                 = "Author" -> null
          - propagate_at_launch = true -> null
          - value               = "David Powers" -> null
        }
      - tag {
          - key                 = "AuthorEmail" -> null
          - propagate_at_launch = true -> null
          - value               = "david@powersemail.com" -> null
        }
      - tag {
          - key                 = "Name" -> null
          - propagate_at_launch = true -> null
          - value               = "dp-webapp-asg-dev" -> null
        }
      - tag {
          - key                 = "TerraformProject" -> null
          - propagate_at_launch = true -> null
          - value               = "dp-webapp" -> null
        }

      - traffic_source {
          - identifier = "arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a" -> null
          - type       = "elbv2" -> null
        }
    }

  # module.ec2_asg_target.aws_autoscaling_policy.scale_down[0] will be destroyed
  - resource "aws_autoscaling_policy" "scale_down" {
      - adjustment_type           = "ChangeInCapacity" -> null
      - arn                       = "arn:aws:autoscaling:us-east-1:349580787393:scalingPolicy:211c15ac-dfed-486b-a5da-19bb543915d5:autoScalingGroupName/dp-webapp-asg-dev:policyName/dp-webapp-asg-dev-scale-down" -> null
      - autoscaling_group_name    = "dp-webapp-asg-dev" -> null
      - cooldown                  = 0 -> null
      - enabled                   = true -> null
      - estimated_instance_warmup = 0 -> null
      - id                        = "dp-webapp-asg-dev-scale-down" -> null
      - metric_aggregation_type   = "Average" -> null
      - min_adjustment_magnitude  = 0 -> null
      - name                      = "dp-webapp-asg-dev-scale-down" -> null
      - policy_type               = "StepScaling" -> null
      - region                    = "us-east-1" -> null
      - scaling_adjustment        = 0 -> null

      - step_adjustment {
          - metric_interval_upper_bound = "0" -> null
          - scaling_adjustment          = -2 -> null
            # (1 unchanged attribute hidden)
        }
    }

  # module.ec2_asg_target.aws_autoscaling_policy.scale_up[0] will be destroyed
  - resource "aws_autoscaling_policy" "scale_up" {
      - adjustment_type           = "ChangeInCapacity" -> null
      - arn                       = "arn:aws:autoscaling:us-east-1:349580787393:scalingPolicy:8bd82de8-25d7-4bf1-8a55-e8bc15347256:autoScalingGroupName/dp-webapp-asg-dev:policyName/dp-webapp-asg-dev-scale-up" -> null
      - autoscaling_group_name    = "dp-webapp-asg-dev" -> null
      - cooldown                  = 0 -> null
      - enabled                   = true -> null
      - estimated_instance_warmup = 0 -> null
      - id                        = "dp-webapp-asg-dev-scale-up" -> null
      - metric_aggregation_type   = "Average" -> null
      - min_adjustment_magnitude  = 0 -> null
      - name                      = "dp-webapp-asg-dev-scale-up" -> null
      - policy_type               = "StepScaling" -> null
      - region                    = "us-east-1" -> null
      - scaling_adjustment        = 0 -> null

      - step_adjustment {
          - metric_interval_lower_bound = "0" -> null
          - scaling_adjustment          = 2 -> null
            # (1 unchanged attribute hidden)
        }
    }

  # module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0] will be destroyed
  - resource "aws_cloudwatch_metric_alarm" "cpu_high" {
      - actions_enabled                       = true -> null
      - alarm_actions                         = [
          - "arn:aws:autoscaling:us-east-1:349580787393:scalingPolicy:8bd82de8-25d7-4bf1-8a55-e8bc15347256:autoScalingGroupName/dp-webapp-asg-dev:policyName/dp-webapp-asg-dev-scale-up",
        ] -> null
      - alarm_description                     = "This alarm triggers a scale-up when CPU utilization is high." -> null
      - alarm_name                            = "dp-webapp-asg-dev-cpu-high-alarm" -> null
      - arn                                   = "arn:aws:cloudwatch:us-east-1:349580787393:alarm:dp-webapp-asg-dev-cpu-high-alarm" -> null
      - comparison_operator                   = "GreaterThanOrEqualToThreshold" -> null
      - datapoints_to_alarm                   = 0 -> null
      - dimensions                            = {
          - "AutoScalingGroupName" = "dp-webapp-asg-dev"
        } -> null
      - evaluation_periods                    = 5 -> null
      - id                                    = "dp-webapp-asg-dev-cpu-high-alarm" -> null
      - insufficient_data_actions             = [] -> null
      - metric_name                           = "CPUUtilization" -> null
      - namespace                             = "AWS/EC2" -> null
      - ok_actions                            = [] -> null
      - period                                = 60 -> null
      - region                                = "us-east-1" -> null
      - statistic                             = "Average" -> null
      - tags                                  = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                              = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - threshold                             = 70 -> null
      - treat_missing_data                    = "missing" -> null
        # (4 unchanged attributes hidden)
    }

  # module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0] will be destroyed
  - resource "aws_cloudwatch_metric_alarm" "cpu_low" {
      - actions_enabled                       = true -> null
      - alarm_actions                         = [
          - "arn:aws:autoscaling:us-east-1:349580787393:scalingPolicy:211c15ac-dfed-486b-a5da-19bb543915d5:autoScalingGroupName/dp-webapp-asg-dev:policyName/dp-webapp-asg-dev-scale-down",
        ] -> null
      - alarm_description                     = "This alarm triggers a scale-down when CPU utilization is low." -> null
      - alarm_name                            = "dp-webapp-asg-dev-cpu-low-alarm" -> null
      - arn                                   = "arn:aws:cloudwatch:us-east-1:349580787393:alarm:dp-webapp-asg-dev-cpu-low-alarm" -> null
      - comparison_operator                   = "LessThanOrEqualToThreshold" -> null
      - datapoints_to_alarm                   = 0 -> null
      - dimensions                            = {
          - "AutoScalingGroupName" = "dp-webapp-asg-dev"
        } -> null
      - evaluation_periods                    = 5 -> null
      - id                                    = "dp-webapp-asg-dev-cpu-low-alarm" -> null
      - insufficient_data_actions             = [] -> null
      - metric_name                           = "CPUUtilization" -> null
      - namespace                             = "AWS/EC2" -> null
      - ok_actions                            = [] -> null
      - period                                = 60 -> null
      - region                                = "us-east-1" -> null
      - statistic                             = "Average" -> null
      - tags                                  = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                              = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - threshold                             = 30 -> null
      - treat_missing_data                    = "missing" -> null
        # (4 unchanged attributes hidden)
    }

  # module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0] will be destroyed
  - resource "aws_lb_listener_rule" "app_listener_rule" {
      - arn          = "arn:aws:elasticloadbalancing:us-east-1:349580787393:listener-rule/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f/e09b3de0a86b5117" -> null
      - id           = "arn:aws:elasticloadbalancing:us-east-1:349580787393:listener-rule/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f/e09b3de0a86b5117" -> null
      - listener_arn = "arn:aws:elasticloadbalancing:us-east-1:349580787393:listener/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f" -> null
      - priority     = 10 -> null
      - region       = "us-east-1" -> null
      - tags         = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-rule-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all     = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-rule-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null

      - action {
          - order            = 1 -> null
          - target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a" -> null
          - type             = "forward" -> null
        }

      - condition {
          - http_request_method {
              - values = [
                  - "GET",
                ] -> null
            }
        }
    }

  # module.ec2_asg_target.aws_lb_target_group.app_target_group will be destroyed
  - resource "aws_lb_target_group" "app_target_group" {
      - arn                                = "arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a" -> null
      - arn_suffix                         = "targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a" -> null
      - deregistration_delay               = "20" -> null
      - id                                 = "arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a" -> null
      - ip_address_type                    = "ipv4" -> null
      - lambda_multi_value_headers_enabled = false -> null
      - load_balancer_arns                 = [
          - "arn:aws:elasticloadbalancing:us-east-1:349580787393:loadbalancer/app/dp-webapp-dev/f688b17bf2bb8907",
        ] -> null
      - load_balancing_algorithm_type      = "round_robin" -> null
      - load_balancing_anomaly_mitigation  = "off" -> null
      - load_balancing_cross_zone_enabled  = "use_load_balancer_configuration" -> null
      - name                               = "dp-webapp-tg-dev" -> null
      - port                               = 80 -> null
      - protocol                           = "HTTP" -> null
      - protocol_version                   = "HTTP1" -> null
      - proxy_protocol_v2                  = false -> null
      - region                             = "us-east-1" -> null
      - slow_start                         = 0 -> null
      - tags                               = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-tg-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                           = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-tg-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - target_type                        = "instance" -> null
      - vpc_id                             = "vpc-03f3ebd6ea9460bfb" -> null
        # (1 unchanged attribute hidden)

      - health_check {
          - enabled             = true -> null
          - healthy_threshold   = 3 -> null
          - interval            = 30 -> null
          - matcher             = "200" -> null
          - path                = "/" -> null
          - port                = "traffic-port" -> null
          - protocol            = "HTTP" -> null
          - timeout             = 5 -> null
          - unhealthy_threshold = 3 -> null
        }

      - stickiness {
          - cookie_duration = 86400 -> null
          - enabled         = false -> null
          - type            = "lb_cookie" -> null
            # (1 unchanged attribute hidden)
        }

      - target_failover {}

      - target_group_health {
          - dns_failover {
              - minimum_healthy_targets_count      = "1" -> null
              - minimum_healthy_targets_percentage = "off" -> null
            }
          - unhealthy_state_routing {
              - minimum_healthy_targets_count      = 1 -> null
              - minimum_healthy_targets_percentage = "off" -> null
            }
        }

      - target_health_state {}
    }

  # module.ec2_asg_target.aws_security_group.ec2_target_sg will be destroyed
  - resource "aws_security_group" "ec2_target_sg" {
      - arn                    = "arn:aws:ec2:us-east-1:349580787393:security-group/sg-06e9b17858b22f671" -> null
      - description            = "Allow traffic from ALB to EC2 instances for dp-webapp" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow all outbound traffic"
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-06e9b17858b22f671" -> null
      - ingress                = [
          - {
              - cidr_blocks      = []
              - description      = "Allow traffic from the Application Load Balancer"
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = [
                  - "sg-0f74761e2c0379f15",
                ]
              - self             = false
              - to_port          = 80
            },
        ] -> null
      - name                   = "dp-webapp-ec2-sg-20250725150612777700000005" -> null
      - name_prefix            = "dp-webapp-ec2-sg-" -> null
      - owner_id               = "349580787393" -> null
      - region                 = "us-east-1" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-ec2-sg-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all               = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-ec2-sg-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id                 = "vpc-03f3ebd6ea9460bfb" -> null
    }

  # module.ec2_launch_template.aws_iam_instance_profile.ssm_instance_profile[0] will be destroyed
  - resource "aws_iam_instance_profile" "ssm_instance_profile" {
      - arn         = "arn:aws:iam::349580787393:instance-profile/dp-webapp-dev-ssm-profile-20250725150557396800000002" -> null
      - create_date = "2025-07-25T15:05:57Z" -> null
      - id          = "dp-webapp-dev-ssm-profile-20250725150557396800000002" -> null
      - name        = "dp-webapp-dev-ssm-profile-20250725150557396800000002" -> null
      - name_prefix = "dp-webapp-dev-ssm-profile-" -> null
      - path        = "/" -> null
      - role        = "dp-webapp-dev-ssm-role-20250725150556437000000001" -> null
      - tags        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all    = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - unique_id   = "AIPAVCZFDP3A5DP25LSSK" -> null
    }

  # module.ec2_launch_template.aws_iam_role.ssm_role[0] will be destroyed
  - resource "aws_iam_role" "ssm_role" {
      - arn                   = "arn:aws:iam::349580787393:role/dp-webapp-dev-ssm-role-20250725150556437000000001" -> null
      - assume_role_policy    = jsonencode(
            {
              - Statement = [
                  - {
                      - Action    = "sts:AssumeRole"
                      - Effect    = "Allow"
                      - Principal = {
                          - Service = "ec2.amazonaws.com"
                        }
                      - Sid       = "EC2AssumeRole"
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - create_date           = "2025-07-25T15:05:56Z" -> null
      - force_detach_policies = false -> null
      - id                    = "dp-webapp-dev-ssm-role-20250725150556437000000001" -> null
      - managed_policy_arns   = [
          - "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
        ] -> null
      - max_session_duration  = 3600 -> null
      - name                  = "dp-webapp-dev-ssm-role-20250725150556437000000001" -> null
      - name_prefix           = "dp-webapp-dev-ssm-role-" -> null
      - path                  = "/" -> null
      - tags                  = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all              = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - unique_id             = "AROAVCZFDP3AT4GAKQMLM" -> null
        # (2 unchanged attributes hidden)
    }

  # module.ec2_launch_template.aws_iam_role_policy_attachment.ssm_policy_attach[0] will be destroyed
  - resource "aws_iam_role_policy_attachment" "ssm_policy_attach" {
      - id         = "dp-webapp-dev-ssm-role-20250725150556437000000001/arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" -> null
      - policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" -> null
      - role       = "dp-webapp-dev-ssm-role-20250725150556437000000001" -> null
    }

  # module.ec2_launch_template.aws_launch_template.main will be destroyed
  - resource "aws_launch_template" "main" {
      - arn                                  = "arn:aws:ec2:us-east-1:349580787393:launch-template/lt-084b4530d502ebfba" -> null
      - default_version                      = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - id                                   = "lt-084b4530d502ebfba" -> null
      - image_id                             = (sensitive value) -> null
      - instance_type                        = "t3.micro" -> null
      - latest_version                       = 1 -> null
      - name                                 = "dp-webapp-dev20250725150615608300000006" -> null
      - name_prefix                          = "dp-webapp-dev" -> null
      - region                               = "us-east-1" -> null
      - security_group_names                 = [] -> null
      - tags                                 = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                             = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - update_default_version               = true -> null
      - user_data                            = "IyEvYmluL2Jhc2gKIyBUaGlzIHNjcmlwdCBpcyBleGVjdXRlZCBvbiBFQzIgaW5zdGFuY2UgbGF1bmNoIGFzIHVzZXIgZGF0YS4KIyBJdCBpbnN0YWxscyBuZWNlc3NhcnkgcGFja2FnZXMsIGNvbmZpZ3VyZXMgTmdpbnggd2l0aCBhIHNlbGYtc2lnbmVkIFNTTCBjZXJ0aWZpY2F0ZSwKIyBhbmQgY3JlYXRlcyBhIGR5bmFtaWMgaW5kZXguaHRtbCBwYWdlIGJhc2VkIG9uIGluc3RhbmNlIG1ldGFkYXRhLgoKZWNobyAiU3RhcnRpbmcgdXNlciBkYXRhIHNjcmlwdCBleGVjdXRpb24uLi4iCgojIFVwZGF0ZSBzeXN0ZW0gcGFja2FnZXMKc3VkbyBkbmYgdXBkYXRlIC15CgojIEluc3RhbGwgbmVjZXNzYXJ5IHBhY2thZ2VzCmVjaG8gIkluc3RhbGxpbmcgb3BlbnNzbCwgYW5kIG5naW54Li4uIgpzdWRvIGRuZiBpbnN0YWxsIC15IG9wZW5zc2wgbmdpbngKCiMgU3RhcnQgTmdpbnggc2VydmljZSBhbmQgZW5hYmxlIGl0IHRvIHN0YXJ0IG9uIGJvb3QKZWNobyAiU3RhcnRpbmcgTmdpbnggc2VydmljZS4uLiIKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKc3VkbyBzeXN0ZW1jdGwgZW5hYmxlIG5naW54CgojIC0tLSBGZXRjaCBJbnN0YW5jZSBNZXRhZGF0YSAoSU1EU3YyKSAtLS0KIyBJTURTdjIgcmVxdWlyZXMgYSB0b2tlbiBmb3IgYXV0aGVudGljYXRpb24uCmVjaG8gIkZldGNoaW5nIElNRFN2MiB0b2tlbi4uLiIKVE9LRU49JChjdXJsIC1YIFBVVCAiaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvYXBpL3Rva2VuIiAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuLXR0bC1zZWNvbmRzOiAyMTYwMCIpCgplY2hvICJGZXRjaGluZyBpbnN0YW5jZSBtZXRhZGF0YS4uLiIKSU5TVEFOQ0VfSUQ9JChjdXJsIC1IICJYLWF3cy1lYzItbWV0YWRhdGEtdG9rZW46ICRUT0tFTiIgaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvbWV0YS1kYXRhL2luc3RhbmNlLWlkKQpMT0NBTF9JUFY0PSQoY3VybCAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuOiAkVE9LRU4iIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9sb2NhbC1pcHY0KQpTVUJORVRfSUQ9JChjdXJsIC1IICJYLWF3cy1lYzItbWV0YWRhdGEtdG9rZW46ICRUT0tFTiIgaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvbWV0YS1kYXRhL25ldHdvcmsvaW50ZXJmYWNlcy9tYWNzLyQoY3VybCAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuOiAkVE9LRU4iIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9tYWMpL3N1Ym5ldC1pZCkKVlBDX0lEPSQoY3VybCAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuOiAkVE9LRU4iIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9uZXR3b3JrL2ludGVyZmFjZXMvbWFjcy8kKGN1cmwgLUggIlgtYXdzLWVjMi1tZXRhZGF0YS10b2tlbjogJFRPS0VOIiBodHRwOi8vMTY5LjI1NC4xNjkuMjU0L2xhdGVzdC9tZXRhLWRhdGEvbWFjKS92cGMtaWQpCkFWQUlMQUJJTElUWV9aT05FPSQoY3VybCAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuOiAkVE9LRU4iIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9wbGFjZW1lbnQvYXZhaWxhYmlsaXR5LXpvbmUpCgojIEdlbmVyYXRlIGEgc2ltcGxlIGluZGV4Lmh0bWwgcGFnZSB3aXRoIGluc3RhbmNlIGF0dHJpYnV0ZXMKZWNobyAiR2VuZXJhdGluZyBpbmRleC5odG1sLi4uIgpjYXQgPDxFT0YgPiAvdXNyL3NoYXJlL25naW54L2h0bWwvaW5kZXguaHRtbAo8IURPQ1RZUEUgaHRtbD4KPGh0bWwgbGFuZz0iZW4iPgo8aGVhZD4KICAgIDxtZXRhIGNoYXJzZXQ9IlVURi04Ij4KICAgIDxtZXRhIG5hbWU9InZpZXdwb3J0IiBjb250ZW50PSJ3aWR0aD1kZXZpY2Utd2lkdGgsIGluaXRpYWwtc2NhbGU9MS4wIj4KICAgIDx0aXRsZT5UZXJyYWZvcm0gRUMyIEluc3RhbmNlIEluZm88L3RpdGxlPgogICAgPHN0eWxlPgogICAgICAgIGJvZHkgeyBmb250LWZhbWlseTogJ0ludGVyJywgc2Fucy1zZXJpZjsgYmFja2dyb3VuZC1jb2xvcjogI2YwZjJmNTsgY29sb3I6ICMzMzM7IG1hcmdpbjogMDsgcGFkZGluZzogMjBweDsgZGlzcGxheTogZmxleDsganVzdGlmeS1jb250ZW50OiBjZW50ZXI7IGFsaWduLWl0ZW1zOiBjZW50ZXI7IG1pbi1oZWlnaHQ6IDEwMHZoOyB9CiAgICAgICAgLmNvbnRhaW5lciB7IGJhY2tncm91bmQtY29sb3I6ICNmZmY7IHBhZGRpbmc6IDMwcHg7IGJvcmRlci1yYWRpdXM6IDEycHg7IGJveC1zaGFkb3c6IDAgNHB4IDE1cHggcmdiYSgwLCAwLCAwLCAwLjEpOyBtYXgtd2lkdGg6IDYwMHB4OyB3aWR0aDogMTAwJTsgdGV4dC1hbGlnbjogY2VudGVyOyB9CiAgICAgICAgaDEgeyBjb2xvcjogIzJjM2U1MDsgbWFyZ2luLWJvdHRvbTogMjVweDsgfQogICAgICAgIHAgeyBtYXJnaW4tYm90dG9tOiAxNXB4OyBmb250LXNpemU6IDEuMWVtOyBsaW5lLWhlaWdodDogMS42OyB9CiAgICAgICAgc3Ryb25nIHsgY29sb3I6ICMzNDk4ZGI7IH0KICAgICAgICAuZm9vdGVyIHsgbWFyZ2luLXRvcDogMzBweDsgZm9udC1zaXplOiAwLjllbTsgY29sb3I6ICM3ZjhjOGQ7IH0KICAgIDwvc3R5bGU+CjwvaGVhZD4KPGJvZHk+CiAgICA8ZGl2IGNsYXNzPSJjb250YWluZXIiPgogICAgICAgIDxoMT5IZWxsbywgRGV2T3BzIFRlc3QhPC9oMT4KICAgICAgICA8aDI+V2VsY29tZSB0byBZb3VyIFRlcnJhZm9ybS1EZXBsb3llZCBFQzIgSW5zdGFuY2UhPC9oMj4KICAgICAgICA8cD5UaGlzIHBhZ2Ugd2FzIGdlbmVyYXRlZCBkeW5hbWljYWxseSBmcm9tIGluc3RhbmNlIG1ldGFkYXRhLjwvcD4KICAgICAgICA8cD48c3Ryb25nPkluc3RhbmNlIElEOjwvc3Ryb25nPiAke0lOU1RBTkNFX0lEfTwvcD4KICAgICAgICA8cD48c3Ryb25nPkxvY2FsIElQdjQ6PC9zdHJvbmc+ICR7TE9DQUxfSVBWNH08L3A+CiAgICAgICAgPHA+PHN0cm9uZz5TdWJuZXQgSUQ6PC9zdHJvbmc+ICR7U1VCTkVUX0lEfTwvcD4KICAgICAgICA8cD48c3Ryb25nPlZQQyBJRDo8L3N0cm9uZz4gJHtWUENfSUR9PC9wPgogICAgICAgIDxwPjxzdHJvbmc+QXZhaWxhYmlsaXR5IFpvbmU6PC9zdHJvbmc+ICR7QVZBSUxBQklMSVRZX1pPTkV9PC9wPgogICAgICAgIDxkaXYgY2xhc3M9ImZvb3RlciI+CiAgICAgICAgICAgIDxwPiZjb3B5OyAkKGRhdGUgKyVZKSBUZXJyYWZvcm0gUHJvamVjdC4gQWxsIHJpZ2h0cyByZXNlcnZlZC48L3A+CiAgICAgICAgPC9kaXY+CiAgICA8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+CkVPRgoKIyAtLS0gQ29uZmlndXJlIE5naW54IHdpdGggU2VsZi1TaWduZWQgVExTIENlcnRpZmljYXRlIC0tLQojIG5vdCBuZWNlc3NhcnkgZm9yIHRoaXMgYXNzZXNzbWVudCB0YXNrIGJ1dCBkZW1vbnN0cmF0ZXMgbWV0aG9kIHRvIHVzZSBlcGhlbWVyYWwgc2VsZi1zaWduZWQgY2VydHMgaW4gdGFyZ2V0cwojIHRvIHN1cHBvcnQgZnVsbC1wYXRoIFRMUwplY2hvICJHZW5lcmF0aW5nIHNlbGYtc2lnbmVkIFNTTCBjZXJ0aWZpY2F0ZS4uLiIKc3VkbyBvcGVuc3NsIHJlcSAteDUwOSAtbm9kZXMgLWRheXMgMzY1IC1uZXdrZXkgcnNhOjIwNDggXAogICAgLWtleW91dCAvZXRjL25naW54L25naW54LmtleSBcCiAgICAtb3V0IC9ldGMvbmdpbngvbmdpbnguY3J0IFwKICAgIC1zdWJqICIvQz1VUy9TVD1DQS9MPVNpbWlWYWxsZXkvTz1NeU9yZy9PVT1JVC9DTj1leGFtcGxlLmNvbSIKCmVjaG8gIkNvbmZpZ3VyaW5nIE5naW54Li4uIgpzdWRvIHRlZSAvZXRjL25naW54L25naW54LmNvbmYgPiAvZGV2L251bGwgPDxFT0YKdXNlciBuZ2lueDsKd29ya2VyX3Byb2Nlc3NlcyBhdXRvOwplcnJvcl9sb2cgL3Zhci9sb2cvbmdpbngvZXJyb3IubG9nOwpwaWQgL3J1bi9uZ2lueC5waWQ7CgppbmNsdWRlIC91c3Ivc2hhcmUvbmdpbngvbW9kdWxlcy8qLmNvbmY7CgpldmVudHMgewogICAgd29ya2VyX2Nvbm5lY3Rpb25zIDEwMjQ7Cn0KCmh0dHAgewogICAgbG9nX2Zvcm1hdCAgbWFpbiAgJ1wkcmVtb3RlX2FkZHIgLSBcJHJlbW90ZV91c2VyIFtcJHRpbWVfbG9jYWxdICJcJHJlcXVlc3QiICcKICAgICAgICAgICAgICAgICAgICAgICdcJHN0YXR1cyBcJGJvZHlfYnl0ZXNfc2VudCAiXCRodHRwX3JlZmVyZXIiICcKICAgICAgICAgICAgICAgICAgICAgICciXCRodHRwX3VzZXJfYWdlbnQiICJcJGh0dHBfeF9mb3J3YXJkZWRfZm9yIic7CgogICAgYWNjZXNzX2xvZyAgL3Zhci9sb2cvbmdpbngvYWNjZXNzLmxvZyAgbWFpbjsKCiAgICBzZW5kZmlsZSAgICAgICAgICAgIG9uOwogICAgdGNwX25vcHVzaCAgICAgICAgICBvbjsKICAgIHRjcF9ub2RlbGF5ICAgICAgICAgb247CiAgICBrZWVwYWxpdmVfdGltZW91dCAgIDY1OwogICAgdHlwZXNfaGFzaF9tYXhfc2l6ZSAyMDQ4OwoKICAgIGluY2x1ZGUgICAgICAgICAgICAgL2V0Yy9uZ2lueC9taW1lLnR5cGVzOwogICAgZGVmYXVsdF90eXBlICAgICAgICBhcHBsaWNhdGlvbi9vY3RldC1zdHJlYW07CgogICAgIyBMb2FkIG1vZHVsYXIgY29uZmlndXJhdGlvbiBmaWxlcyBmcm9tIHRoZSAvZXRjL25naW54L2NvbmYuZCBkaXJlY3RvcnkuCiAgICAjIFNlZSBodHRwOi8vbmdpbngub3JnL2VuL2RvY3Mvbmd4X2NvcmVfbW9kdWxlLmh0bWwjaW5jbHVkZQogICAgIyBmb3IgbW9yZSBpbmZvcm1hdGlvbi4KICAgIGluY2x1ZGUgL2V0Yy9uZ2lueC9jb25mLmQvKi5jb25mOwoKICAgIHNlcnZlciB7CiAgICAgICAgbGlzdGVuIDgwOwogICAgICAgIHNlcnZlcl9uYW1lIF87CgogICAgICAgICMgZm9yIHByb2R1Y3Rpb24gdXNlIGZvcmNlIGh0dHBzCiAgICAgICAgIyByZXR1cm4gMzAxIGh0dHBzOi8vXCRob3N0XCRyZXF1ZXN0X3VyaTsgIyBSZWRpcmVjdCBIVFRQIHRvIEhUVFBTCiAgICAgICAgIyBpbnN0ZWFkIGp1c3Qgc2hvdyBwYWdlIQogICAgICAgIGxvY2F0aW9uIC8gewogICAgICAgICAgICByb290IC91c3Ivc2hhcmUvbmdpbngvaHRtbDsKICAgICAgICAgICAgaW5kZXggaW5kZXguaHRtbDsKICAgICAgICAgICAgdHJ5X2ZpbGVzIFwkdXJpIFwkdXJpLyA9NDA0OwogICAgICAgIH0KCiAgICAgICAgZXJyb3JfcGFnZSA0MDQgLzQwNC5odG1sOwogICAgICAgIGxvY2F0aW9uID0gLzQwNC5odG1sIHsKICAgICAgICAgICAgaW50ZXJuYWw7CiAgICAgICAgfQoKICAgICAgICBlcnJvcl9wYWdlIDUwMCA1MDIgNTAzIDUwNCAvNTB4Lmh0bWw7CiAgICAgICAgbG9jYXRpb24gPSAvNTB4Lmh0bWwgewogICAgICAgICAgICBpbnRlcm5hbDsKICAgICAgICB9CiAgICB9CgogICAgc2VydmVyIHsKICAgICAgICBsaXN0ZW4gNDQzIHNzbDsKICAgICAgICBzZXJ2ZXJfbmFtZSBfOwoKICAgICAgICBzc2xfY2VydGlmaWNhdGUgL2V0Yy9uZ2lueC9uZ2lueC5jcnQ7CiAgICAgICAgc3NsX2NlcnRpZmljYXRlX2tleSAvZXRjL25naW54L25naW54LmtleTsKCiAgICAgICAgc3NsX3Nlc3Npb25fY2FjaGUgc2hhcmVkOlNTTDoxbTsKICAgICAgICBzc2xfc2Vzc2lvbl90aW1lb3V0IDVtOwogICAgICAgIHNzbF9jaXBoZXJzIEhJR0g6IWFOVUxMOiFNRDU7CiAgICAgICAgc3NsX3ByZWZlcl9zZXJ2ZXJfY2lwaGVycyBvbjsKCiAgICAgICAgbG9jYXRpb24gLyB7CiAgICAgICAgICAgIHJvb3QgL3Vzci9zaGFyZS9uZ2lueC9odG1sOwogICAgICAgICAgICBpbmRleCBpbmRleC5odG1sOwogICAgICAgICAgICB0cnlfZmlsZXMgXCR1cmkgXCR1cmkvID00MDQ7CiAgICAgICAgfQoKICAgICAgICBlcnJvcl9wYWdlIDQwNCAvNDA0Lmh0bWw7CiAgICAgICAgbG9jYXRpb24gPSAvNDA0Lmh0bWwgewogICAgICAgICAgICBpbnRlcm5hbDsKICAgICAgICB9CgogICAgICAgIGVycm9yX3BhZ2UgNTAwIDUwMiA1MDMgNTA0IC81MHguaHRtbDsKICAgICAgICBsb2NhdGlvbiA9IC81MHguaHRtbCB7CiAgICAgICAgICAgIGludGVybmFsOwogICAgICAgIH0KICAgIH0KfQpFT0YKCiMgUmVzdGFydCBOZ2lueCB0byBhcHBseSBjaGFuZ2VzCmVjaG8gIlJlc3RhcnRpbmcgTmdpbnggdG8gYXBwbHkgbmV3IGNvbmZpZ3VyYXRpb24uLi4iCnN1ZG8gc3lzdGVtY3RsIHJlc3RhcnQgbmdpbngKCmVjaG8gIlVzZXIgZGF0YSBzY3JpcHQgY29tcGxldGVkLiIKCg==" -> null
      - vpc_security_group_ids               = [] -> null
        # (6 unchanged attributes hidden)

      - block_device_mappings {
          - device_name  = "/dev/sda1" -> null
            # (2 unchanged attributes hidden)

          - ebs {
              - delete_on_termination      = "true" -> null
              - encrypted                  = "true" -> null
              - iops                       = 0 -> null
              - throughput                 = 0 -> null
              - volume_initialization_rate = 0 -> null
              - volume_size                = 30 -> null
              - volume_type                = "gp3" -> null
                # (2 unchanged attributes hidden)
            }
        }

      - iam_instance_profile {
          - arn  = "arn:aws:iam::349580787393:instance-profile/dp-webapp-dev-ssm-profile-20250725150557396800000002" -> null
            name = null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_put_response_hop_limit = 0 -> null
          - http_tokens                 = "required" -> null
            # (2 unchanged attributes hidden)
        }

      - monitoring {
          - enabled = true -> null
        }

      - network_interfaces {
          - associate_public_ip_address  = "false" -> null
          - delete_on_termination        = "true" -> null
          - device_index                 = 0 -> null
          - ipv4_address_count           = 0 -> null
          - ipv4_addresses               = [] -> null
          - ipv4_prefix_count            = 0 -> null
          - ipv4_prefixes                = [] -> null
          - ipv6_address_count           = 0 -> null
          - ipv6_addresses               = [] -> null
          - ipv6_prefix_count            = 0 -> null
          - ipv6_prefixes                = [] -> null
          - network_card_index           = 0 -> null
          - security_groups              = [
              - "sg-06e9b17858b22f671",
            ] -> null
            # (7 unchanged attributes hidden)
        }

      - tag_specifications {
          - resource_type = "instance" -> null
          - tags          = {
              - "Author"           = "David Powers"
              - "AuthorEmail"      = "david@powersemail.com"
              - "Name"             = "dp-webapp-dev-instance"
              - "TerraformProject" = "dp-webapp"
            } -> null
        }
      - tag_specifications {
          - resource_type = "volume" -> null
          - tags          = {
              - "Author"           = "David Powers"
              - "AuthorEmail"      = "david@powersemail.com"
              - "Name"             = "dp-webapp-dev-volume"
              - "TerraformProject" = "dp-webapp"
            } -> null
        }
      - tag_specifications {
          - resource_type = "network-interface" -> null
          - tags          = {
              - "Author"           = "David Powers"
              - "AuthorEmail"      = "david@powersemail.com"
              - "Name"             = "dp-webapp-dev-eni"
              - "TerraformProject" = "dp-webapp"
            } -> null
        }
    }

  # module.ec2_launch_template.aws_ssm_parameter.launch_template_arn will be destroyed
  - resource "aws_ssm_parameter" "launch_template_arn" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/ec2/launch-templates/dp-webapp-dev/arn" -> null
      - data_type       = "text" -> null
      - description     = "ARN of the EC2 Launch Template for dp-webapp-dev" -> null
      - id              = "/ec2/launch-templates/dp-webapp-dev/arn" -> null
      - name            = "/ec2/launch-templates/dp-webapp-dev/arn" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

  # module.ec2_launch_template.aws_ssm_parameter.launch_template_id will be destroyed
  - resource "aws_ssm_parameter" "launch_template_id" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/ec2/launch-templates/dp-webapp-dev/id" -> null
      - data_type       = "text" -> null
      - description     = "ID of the EC2 Launch Template for dp-webapp-dev" -> null
      - id              = "/ec2/launch-templates/dp-webapp-dev/id" -> null
      - name            = "/ec2/launch-templates/dp-webapp-dev/id" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

  # module.ec2_launch_template.aws_ssm_parameter.launch_template_latest_version will be destroyed
  - resource "aws_ssm_parameter" "launch_template_latest_version" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/ec2/launch-templates/dp-webapp-dev/latest_version" -> null
      - data_type       = "text" -> null
      - description     = "Latest version of the EC2 Launch Template for dp-webapp-dev" -> null
      - id              = "/ec2/launch-templates/dp-webapp-dev/latest_version" -> null
      - name            = "/ec2/launch-templates/dp-webapp-dev/latest_version" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

  # module.ec2_launch_template.aws_ssm_parameter.project_ami_id will be destroyed
  - resource "aws_ssm_parameter" "project_ami_id" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/ec2/launch-templates/dp-webapp-dev/ami_id" -> null
      - data_type       = "text" -> null
      - description     = "AMI ID used for EC2 Launch Template dp-webapp-dev" -> null
      - id              = "/ec2/launch-templates/dp-webapp-dev/ami_id" -> null
      - name            = "/ec2/launch-templates/dp-webapp-dev/ami_id" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

  # module.shared_alb.aws_lb.shared_alb will be destroyed
  - resource "aws_lb" "shared_alb" {
      - arn                                                          = "arn:aws:elasticloadbalancing:us-east-1:349580787393:loadbalancer/app/dp-webapp-dev/f688b17bf2bb8907" -> null
      - arn_suffix                                                   = "app/dp-webapp-dev/f688b17bf2bb8907" -> null
      - client_keep_alive                                            = 3600 -> null
      - desync_mitigation_mode                                       = "defensive" -> null
      - dns_name                                                     = "dp-webapp-dev-1370733107.us-east-1.elb.amazonaws.com" -> null
      - drop_invalid_header_fields                                   = false -> null
      - enable_cross_zone_load_balancing                             = true -> null
      - enable_deletion_protection                                   = false -> null
      - enable_http2                                                 = true -> null
      - enable_tls_version_and_cipher_suite_headers                  = false -> null
      - enable_waf_fail_open                                         = false -> null
      - enable_xff_client_port                                       = false -> null
      - enable_zonal_shift                                           = false -> null
      - id                                                           = "arn:aws:elasticloadbalancing:us-east-1:349580787393:loadbalancer/app/dp-webapp-dev/f688b17bf2bb8907" -> null
      - idle_timeout                                                 = 60 -> null
      - internal                                                     = false -> null
      - ip_address_type                                              = "ipv4" -> null
      - load_balancer_type                                           = "application" -> null
      - name                                                         = "dp-webapp-dev" -> null
      - preserve_host_header                                         = false -> null
      - region                                                       = "us-east-1" -> null
      - security_groups                                              = [
          - "sg-0f74761e2c0379f15",
        ] -> null
      - subnets                                                      = [
          - "subnet-0760c8b586f5cd85e",
          - "subnet-0b1deef31d0e1be81",
        ] -> null
      - tags                                                         = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                                                     = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id                                                       = "vpc-03f3ebd6ea9460bfb" -> null
      - xff_header_processing_mode                                   = "append" -> null
      - zone_id                                                      = "Z35SXDOTRQ7X7K" -> null
        # (3 unchanged attributes hidden)

      - access_logs {
          - bucket  = "dp-webapp-dev-349580787393-us-east-1" -> null
          - enabled = true -> null
          - prefix  = "dp-webapp" -> null
        }

      - connection_logs {
          - enabled = false -> null
            # (2 unchanged attributes hidden)
        }

      - subnet_mapping {
          - subnet_id            = "subnet-0760c8b586f5cd85e" -> null
            # (4 unchanged attributes hidden)
        }
      - subnet_mapping {
          - subnet_id            = "subnet-0b1deef31d0e1be81" -> null
            # (4 unchanged attributes hidden)
        }
    }

  # module.shared_alb.aws_lb_listener.shared_alb_listener_http[0] will be destroyed
  - resource "aws_lb_listener" "shared_alb_listener_http" {
      - arn                                                                 = "arn:aws:elasticloadbalancing:us-east-1:349580787393:listener/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f" -> null
      - id                                                                  = "arn:aws:elasticloadbalancing:us-east-1:349580787393:listener/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f" -> null
      - load_balancer_arn                                                   = "arn:aws:elasticloadbalancing:us-east-1:349580787393:loadbalancer/app/dp-webapp-dev/f688b17bf2bb8907" -> null
      - port                                                                = 80 -> null
      - protocol                                                            = "HTTP" -> null
      - region                                                              = "us-east-1" -> null
      - routing_http_response_server_enabled                                = true -> null
      - tags                                                                = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-listener-http-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                                                            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-listener-http-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
        # (11 unchanged attributes hidden)

      - default_action {
          - order            = 1 -> null
          - type             = "fixed-response" -> null
            # (1 unchanged attribute hidden)

          - fixed_response {
              - content_type = "text/plain" -> null
              - message_body = "No matching rule found. Default fixed-response triggered. dp-webapp-listener-http-dev HTTP:80" -> null
              - status_code  = "200" -> null
            }
        }
    }

  # module.shared_alb.aws_s3_bucket.alb_access_logs_bucket[0] will be destroyed
  - resource "aws_s3_bucket" "alb_access_logs_bucket" {
      - arn                         = "arn:aws:s3:::dp-webapp-dev-349580787393-us-east-1" -> null
      - bucket                      = "dp-webapp-dev-349580787393-us-east-1" -> null
      - bucket_domain_name          = "dp-webapp-dev-349580787393-us-east-1.s3.amazonaws.com" -> null
      - bucket_region               = "us-east-1" -> null
      - bucket_regional_domain_name = "dp-webapp-dev-349580787393-us-east-1.s3.us-east-1.amazonaws.com" -> null
      - force_destroy               = true -> null
      - hosted_zone_id              = "Z3AQBSTGFYJSTF" -> null
      - id                          = "dp-webapp-dev-349580787393-us-east-1" -> null
      - object_lock_enabled         = false -> null
      - policy                      = jsonencode(
            {
              - Statement = [
                  - {
                      - Action    = "s3:PutObject"
                      - Effect    = "Allow"
                      - Principal = {
                          - AWS = "arn:aws:iam::127311923021:root"
                        }
                      - Resource  = [
                          - "arn:aws:s3:::dp-webapp-dev-349580787393-us-east-1/dp-webapp/AWSLogs/349580787393/*",
                          - "arn:aws:s3:::dp-webapp-dev-349580787393-us-east-1/dp-webapp/AWSLogs/349580787393",
                        ]
                    },
                  - {
                      - Action    = "s3:GetBucketAcl"
                      - Effect    = "Allow"
                      - Principal = {
                          - AWS = "arn:aws:iam::127311923021:root"
                        }
                      - Resource  = "arn:aws:s3:::dp-webapp-dev-349580787393-us-east-1"
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - region                      = "us-east-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-349580787393-us-east-1"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all                    = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-dev-349580787393-us-east-1"
          - "TerraformProject" = "dp-webapp"
        } -> null
        # (2 unchanged attributes hidden)

      - grant {
          - id          = "d110f3b2623006173eda9b14967a7781626c88e96abbf26e7d5c8fcf300eb413" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
            # (1 unchanged attribute hidden)
        }

      - lifecycle_rule {
          - abort_incomplete_multipart_upload_days = 7 -> null
          - enabled                                = true -> null
          - id                                     = "alb-logs-lifecycle" -> null
          - prefix                                 = "dp-webapp" -> null
          - tags                                   = {} -> null

          - expiration {
              - days                         = 60 -> null
              - expired_object_delete_marker = false -> null
                # (1 unchanged attribute hidden)
            }
        }

      - server_side_encryption_configuration {
          - rule {
              - bucket_key_enabled = false -> null

              - apply_server_side_encryption_by_default {
                  - sse_algorithm     = "AES256" -> null
                    # (1 unchanged attribute hidden)
                }
            }
        }

      - versioning {
          - enabled    = true -> null
          - mfa_delete = false -> null
        }
    }

  # module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0] will be destroyed
  - resource "aws_s3_bucket_lifecycle_configuration" "alb_access_logs_bucket_lifecycle" {
      - bucket                                 = "dp-webapp-dev-349580787393-us-east-1" -> null
      - id                                     = "dp-webapp-dev-349580787393-us-east-1" -> null
      - region                                 = "us-east-1" -> null
      - transition_default_minimum_object_size = "all_storage_classes_128K" -> null
        # (1 unchanged attribute hidden)

      - rule {
          - id     = "alb-logs-lifecycle" -> null
          - status = "Enabled" -> null
            # (1 unchanged attribute hidden)

          - abort_incomplete_multipart_upload {
              - days_after_initiation = 7 -> null
            }

          - expiration {
              - days                         = 60 -> null
              - expired_object_delete_marker = false -> null
            }

          - filter {
              - prefix = "dp-webapp" -> null
            }
        }
    }

  # module.shared_alb.aws_s3_bucket_ownership_controls.alb_access_logs_bucket_ownership[0] will be destroyed
  - resource "aws_s3_bucket_ownership_controls" "alb_access_logs_bucket_ownership" {
      - bucket = "dp-webapp-dev-349580787393-us-east-1" -> null
      - id     = "dp-webapp-dev-349580787393-us-east-1" -> null
      - region = "us-east-1" -> null

      - rule {
          - object_ownership = "BucketOwnerPreferred" -> null
        }
    }

  # module.shared_alb.aws_s3_bucket_policy.alb_access_logs_bucket_policy[0] will be destroyed
  - resource "aws_s3_bucket_policy" "alb_access_logs_bucket_policy" {
      - bucket = "dp-webapp-dev-349580787393-us-east-1" -> null
      - id     = "dp-webapp-dev-349580787393-us-east-1" -> null
      - policy = jsonencode(
            {
              - Statement = [
                  - {
                      - Action    = "s3:PutObject"
                      - Effect    = "Allow"
                      - Principal = {
                          - AWS = "arn:aws:iam::127311923021:root"
                        }
                      - Resource  = [
                          - "arn:aws:s3:::dp-webapp-dev-349580787393-us-east-1/dp-webapp/AWSLogs/349580787393/*",
                          - "arn:aws:s3:::dp-webapp-dev-349580787393-us-east-1/dp-webapp/AWSLogs/349580787393",
                        ]
                    },
                  - {
                      - Action    = "s3:GetBucketAcl"
                      - Effect    = "Allow"
                      - Principal = {
                          - AWS = "arn:aws:iam::127311923021:root"
                        }
                      - Resource  = "arn:aws:s3:::dp-webapp-dev-349580787393-us-east-1"
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - region = "us-east-1" -> null
    }

  # module.shared_alb.aws_s3_bucket_server_side_encryption_configuration.alb_access_logs_bucket_encryption[0] will be destroyed
  - resource "aws_s3_bucket_server_side_encryption_configuration" "alb_access_logs_bucket_encryption" {
      - bucket                = "dp-webapp-dev-349580787393-us-east-1" -> null
      - id                    = "dp-webapp-dev-349580787393-us-east-1" -> null
      - region                = "us-east-1" -> null
        # (1 unchanged attribute hidden)

      - rule {
          - bucket_key_enabled = false -> null

          - apply_server_side_encryption_by_default {
              - sse_algorithm     = "AES256" -> null
                # (1 unchanged attribute hidden)
            }
        }
    }

  # module.shared_alb.aws_s3_bucket_versioning.alb_access_logs_bucket_versioning[0] will be destroyed
  - resource "aws_s3_bucket_versioning" "alb_access_logs_bucket_versioning" {
      - bucket                = "dp-webapp-dev-349580787393-us-east-1" -> null
      - id                    = "dp-webapp-dev-349580787393-us-east-1" -> null
      - region                = "us-east-1" -> null
        # (1 unchanged attribute hidden)

      - versioning_configuration {
          - status     = "Enabled" -> null
            # (1 unchanged attribute hidden)
        }
    }

  # module.shared_alb.aws_security_group.alb_sg will be destroyed
  - resource "aws_security_group" "alb_sg" {
      - arn                    = "arn:aws:ec2:us-east-1:349580787393:security-group/sg-0f74761e2c0379f15" -> null
      - description            = "Security group for dp-webapp-dev ALB" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow all outbound traffic by default with no explicit egress"
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-0f74761e2c0379f15" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow HTTP from 0.0.0.0/0"
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
          - {
              - cidr_blocks      = [
                  - "10.100.0.0/16",
                ]
              - description      = "Allow HTTP from VPC CIDR"
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
        ] -> null
      - name                   = "dp-webapp-sg-dev" -> null
      - owner_id               = "349580787393" -> null
      - region                 = "us-east-1" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-sg-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all               = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "Name"             = "dp-webapp-sg-dev"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - vpc_id                 = "vpc-03f3ebd6ea9460bfb" -> null
        # (1 unchanged attribute hidden)
    }

  # module.shared_alb.aws_ssm_parameter.alb-access-logs-s3-bucket-arn[0] will be destroyed
  - resource "aws_ssm_parameter" "alb-access-logs-s3-bucket-arn" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/shared-resources/dp-webapp-dev/alb-access-logs-s3-bucket-arn" -> null
      - data_type       = "text" -> null
      - description     = "ARN of the S3 bucket for ALB access logs for dp-webapp-dev" -> null
      - id              = "/shared-resources/dp-webapp-dev/alb-access-logs-s3-bucket-arn" -> null
      - name            = "/shared-resources/dp-webapp-dev/alb-access-logs-s3-bucket-arn" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

  # module.shared_alb.aws_ssm_parameter.alb-arn will be destroyed
  - resource "aws_ssm_parameter" "alb-arn" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/shared-resources/dp-webapp-dev/alb-arn" -> null
      - data_type       = "text" -> null
      - description     = "ARN of the shared Application Load Balancer for dp-webapp-dev" -> null
      - id              = "/shared-resources/dp-webapp-dev/alb-arn" -> null
      - name            = "/shared-resources/dp-webapp-dev/alb-arn" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

  # module.shared_alb.aws_ssm_parameter.alb-dns-name will be destroyed
  - resource "aws_ssm_parameter" "alb-dns-name" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/shared-resources/dp-webapp-dev/alb-dns-name" -> null
      - data_type       = "text" -> null
      - description     = "DNS name of the shared Application Load Balancer for dp-webapp-dev" -> null
      - id              = "/shared-resources/dp-webapp-dev/alb-dns-name" -> null
      - name            = "/shared-resources/dp-webapp-dev/alb-dns-name" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

  # module.shared_alb.aws_ssm_parameter.alb-listener-http-arn[0] will be destroyed
  - resource "aws_ssm_parameter" "alb-listener-http-arn" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/shared-resources/dp-webapp-dev/alb-listener-http-arn" -> null
      - data_type       = "text" -> null
      - description     = "ARN of the HTTP listener (port 80) for dp-webapp-dev" -> null
      - id              = "/shared-resources/dp-webapp-dev/alb-listener-http-arn" -> null
      - name            = "/shared-resources/dp-webapp-dev/alb-listener-http-arn" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

  # module.shared_alb.aws_ssm_parameter.alb-security-group-id will be destroyed
  - resource "aws_ssm_parameter" "alb-security-group-id" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/shared-resources/dp-webapp-dev/alb-security-group-id" -> null
      - data_type       = "text" -> null
      - description     = "ID of the security group attached to the ALB for dp-webapp-dev" -> null
      - id              = "/shared-resources/dp-webapp-dev/alb-security-group-id" -> null
      - name            = "/shared-resources/dp-webapp-dev/alb-security-group-id" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

  # module.shared_alb.aws_ssm_parameter.alb-zone-id will be destroyed
  - resource "aws_ssm_parameter" "alb-zone-id" {
      - arn             = "arn:aws:ssm:us-east-1:349580787393:parameter/shared-resources/dp-webapp-dev/alb-zone-id" -> null
      - data_type       = "text" -> null
      - description     = "Route 53 Hosted Zone ID of the shared Application Load Balancer for dp-webapp-dev" -> null
      - id              = "/shared-resources/dp-webapp-dev/alb-zone-id" -> null
      - name            = "/shared-resources/dp-webapp-dev/alb-zone-id" -> null
      - region          = "us-east-1" -> null
      - tags            = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tags_all        = {
          - "Author"           = "David Powers"
          - "AuthorEmail"      = "david@powersemail.com"
          - "TerraformProject" = "dp-webapp"
        } -> null
      - tier            = "Standard" -> null
      - type            = "String" -> null
      - value           = (sensitive value) -> null
      - value_wo        = (write-only attribute) -> null
      - version         = 1 -> null
        # (2 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 45 to destroy.

Changes to Outputs:
  - alb_dns_name             = "dp-webapp-dev-1370733107.us-east-1.elb.amazonaws.com" -> null
  - alb_security_group_id    = "sg-0f74761e2c0379f15" -> null
  - ec2_asg_target_asg_name  = "dp-webapp-asg-dev" -> null
  - ec2_asg_target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a" -> null
  - private_subnet_ids       = [
      - "subnet-020467bad4b99eee8",
      - "subnet-05a61bc7f6d2a3da6",
    ] -> null
  - public_subnet_ids        = [
      - "subnet-0760c8b586f5cd85e",
      - "subnet-0b1deef31d0e1be81",
    ] -> null
  - vpc_id                   = "vpc-03f3ebd6ea9460bfb" -> null
module.shared_alb.aws_s3_bucket_policy.alb_access_logs_bucket_policy[0]: Destroying... [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_ssm_parameter.alb-arn: Destroying... [id=/shared-resources/dp-webapp-dev/alb-arn]
module.ec2_launch_template.aws_ssm_parameter.launch_template_arn: Destroying... [id=/ec2/launch-templates/dp-webapp-dev/arn]
module.ec2_launch_template.aws_ssm_parameter.project_ami_id: Destroying... [id=/ec2/launch-templates/dp-webapp-dev/ami_id]
module.shared_alb.aws_ssm_parameter.alb-security-group-id: Destroying... [id=/shared-resources/dp-webapp-dev/alb-security-group-id]
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Destroying... [id=dp-webapp-dev-349580787393-us-east-1]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0]: Destroying... [id=dp-webapp-asg-dev-cpu-low-alarm]
module.shared_alb.aws_ssm_parameter.alb-zone-id: Destroying... [id=/shared-resources/dp-webapp-dev/alb-zone-id]
module.shared_alb.aws_ssm_parameter.alb-dns-name: Destroying... [id=/shared-resources/dp-webapp-dev/alb-dns-name]
module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0]: Destroying... [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:listener-rule/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f/e09b3de0a86b5117]
module.shared_alb.aws_ssm_parameter.alb-arn: Destruction complete after 1s
module.ec2_launch_template.aws_ssm_parameter.project_ami_id: Destruction complete after 1s
module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0]: Destruction complete after 1s
module.ec2_launch_template.aws_ssm_parameter.launch_template_arn: Destruction complete after 1s
module.shared_alb.aws_ssm_parameter.alb-dns-name: Destruction complete after 1s
module.basic_vpc.aws_route_table_association.private[1]: Destroying... [id=rtbassoc-037313876f98e5688]
module.shared_alb.aws_s3_bucket_server_side_encryption_configuration.alb_access_logs_bucket_encryption[0]: Destroying... [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_ssm_parameter.alb-security-group-id: Destruction complete after 1s
module.basic_vpc.aws_route_table_association.public[0]: Destroying... [id=rtbassoc-0df7843ff800a38a9]
module.shared_alb.aws_ssm_parameter.alb-listener-http-arn[0]: Destroying... [id=/shared-resources/dp-webapp-dev/alb-listener-http-arn]
module.shared_alb.aws_s3_bucket_policy.alb_access_logs_bucket_policy[0]: Destruction complete after 1s
module.shared_alb.aws_ssm_parameter.alb-zone-id: Destruction complete after 1s
module.basic_vpc.aws_route_table_association.private[0]: Destroying... [id=rtbassoc-01dd1f0c5c0a36054]
module.ec2_launch_template.aws_iam_role_policy_attachment.ssm_policy_attach[0]: Destroying... [id=dp-webapp-dev-ssm-role-20250725150556437000000001/arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0]: Destruction complete after 1s
module.shared_alb.aws_ssm_parameter.alb-access-logs-s3-bucket-arn[0]: Destroying... [id=/shared-resources/dp-webapp-dev/alb-access-logs-s3-bucket-arn]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0]: Destroying... [id=dp-webapp-asg-dev-cpu-high-alarm]
module.basic_vpc.aws_route_table_association.public[1]: Destroying... [id=rtbassoc-03c50543af22f3015]
module.shared_alb.aws_ssm_parameter.alb-listener-http-arn[0]: Destruction complete after 0s
module.ec2_launch_template.aws_ssm_parameter.launch_template_latest_version: Destroying... [id=/ec2/launch-templates/dp-webapp-dev/latest_version]
module.shared_alb.aws_ssm_parameter.alb-access-logs-s3-bucket-arn[0]: Destruction complete after 0s
module.shared_alb.aws_s3_bucket_versioning.alb_access_logs_bucket_versioning[0]: Destroying... [id=dp-webapp-dev-349580787393-us-east-1]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0]: Destruction complete after 0s
module.shared_alb.aws_s3_bucket_lifecycle_configuration.alb_access_logs_bucket_lifecycle[0]: Destruction complete after 1s
module.ec2_launch_template.aws_ssm_parameter.launch_template_id: Destroying... [id=/ec2/launch-templates/dp-webapp-dev/id]
module.shared_alb.aws_s3_bucket_ownership_controls.alb_access_logs_bucket_ownership[0]: Destroying... [id=dp-webapp-dev-349580787393-us-east-1]
module.ec2_launch_template.aws_ssm_parameter.launch_template_latest_version: Destruction complete after 0s
module.ec2_asg_target.aws_autoscaling_policy.scale_down[0]: Destroying... [id=dp-webapp-asg-dev-scale-down]
module.shared_alb.aws_s3_bucket_versioning.alb_access_logs_bucket_versioning[0]: Destruction complete after 0s
module.ec2_launch_template.aws_iam_role_policy_attachment.ssm_policy_attach[0]: Destruction complete after 0s
module.ec2_launch_template.aws_ssm_parameter.launch_template_id: Destruction complete after 0s
module.shared_alb.aws_lb_listener.shared_alb_listener_http[0]: Destroying... [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:listener/app/dp-webapp-dev/f688b17bf2bb8907/995c7c8888fda17f]
module.ec2_asg_target.aws_autoscaling_policy.scale_up[0]: Destroying... [id=dp-webapp-asg-dev-scale-up]
module.shared_alb.aws_s3_bucket_ownership_controls.alb_access_logs_bucket_ownership[0]: Destruction complete after 0s
module.shared_alb.aws_lb_listener.shared_alb_listener_http[0]: Destruction complete after 0s
module.shared_alb.aws_lb.shared_alb: Destroying... [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:loadbalancer/app/dp-webapp-dev/f688b17bf2bb8907]
module.basic_vpc.aws_route_table_association.private[1]: Destruction complete after 0s
module.shared_alb.aws_s3_bucket_server_side_encryption_configuration.alb_access_logs_bucket_encryption[0]: Destruction complete after 0s
module.basic_vpc.aws_route_table_association.public[1]: Destruction complete after 0s
module.basic_vpc.aws_route_table_association.private[0]: Destruction complete after 0s
module.basic_vpc.aws_route_table.private[0]: Destroying... [id=rtb-009b771c73d2aa46b]
module.basic_vpc.aws_route_table_association.public[0]: Destruction complete after 0s
module.basic_vpc.aws_route_table.public: Destroying... [id=rtb-002cf1ee5625a84f8]
module.ec2_asg_target.aws_autoscaling_policy.scale_down[0]: Destruction complete after 1s
module.ec2_asg_target.aws_autoscaling_policy.scale_up[0]: Destruction complete after 1s
module.ec2_asg_target.aws_autoscaling_group.app_asg: Destroying... [id=dp-webapp-asg-dev]
module.basic_vpc.aws_route_table.private[0]: Destruction complete after 1s
module.basic_vpc.aws_nat_gateway.main[0]: Destroying... [id=nat-0a107f79c4d2be190]
module.basic_vpc.aws_route_table.public: Destruction complete after 1s
module.shared_alb.aws_lb.shared_alb: Still destroying... [id=arn:aws:elasticloadbalancing:us-east-1:...cer/app/dp-webapp-dev/f688b17bf2bb8907, 00m10s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m10s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0a107f79c4d2be190, 00m10s elapsed]
module.shared_alb.aws_lb.shared_alb: Still destroying... [id=arn:aws:elasticloadbalancing:us-east-1:...cer/app/dp-webapp-dev/f688b17bf2bb8907, 00m20s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m20s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0a107f79c4d2be190, 00m20s elapsed]
module.shared_alb.aws_lb.shared_alb: Destruction complete after 28s
module.shared_alb.aws_s3_bucket.alb_access_logs_bucket[0]: Destroying... [id=dp-webapp-dev-349580787393-us-east-1]
module.shared_alb.aws_s3_bucket.alb_access_logs_bucket[0]: Destruction complete after 2s
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m30s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0a107f79c4d2be190, 00m30s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m40s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0a107f79c4d2be190, 00m40s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m50s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0a107f79c4d2be190, 00m50s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m00s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0a107f79c4d2be190, 01m00s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m10s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0a107f79c4d2be190, 01m10s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Destruction complete after 1m12s
module.basic_vpc.aws_internet_gateway.main: Destroying... [id=igw-07cd5420e68637509]
module.basic_vpc.aws_subnet.public[0]: Destroying... [id=subnet-0760c8b586f5cd85e]
module.basic_vpc.aws_subnet.public[1]: Destroying... [id=subnet-0b1deef31d0e1be81]
module.basic_vpc.aws_eip.nat_gateway_eip[0]: Destroying... [id=eipalloc-071289c3849acdc74]
module.basic_vpc.aws_eip.nat_gateway_eip[0]: Destruction complete after 1s
module.basic_vpc.aws_subnet.public[0]: Destruction complete after 1s
module.basic_vpc.aws_subnet.public[1]: Destruction complete after 1s
module.basic_vpc.aws_internet_gateway.main: Destruction complete after 1s
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m20s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m30s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m40s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m50s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 02m00s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Destruction complete after 2m0s
module.basic_vpc.aws_subnet.private[1]: Destroying... [id=subnet-05a61bc7f6d2a3da6]
module.basic_vpc.aws_subnet.private[0]: Destroying... [id=subnet-020467bad4b99eee8]
module.ec2_asg_target.aws_lb_target_group.app_target_group: Destroying... [id=arn:aws:elasticloadbalancing:us-east-1:349580787393:targetgroup/dp-webapp-tg-dev/23f0cbbd6b45bc9a]
module.ec2_launch_template.aws_launch_template.main: Destroying... [id=lt-084b4530d502ebfba]
module.ec2_launch_template.aws_launch_template.main: Destruction complete after 0s
module.ec2_launch_template.aws_iam_instance_profile.ssm_instance_profile[0]: Destroying... [id=dp-webapp-dev-ssm-profile-20250725150557396800000002]
module.ec2_asg_target.aws_security_group.ec2_target_sg: Destroying... [id=sg-06e9b17858b22f671]
module.ec2_asg_target.aws_lb_target_group.app_target_group: Destruction complete after 0s
module.basic_vpc.aws_subnet.private[0]: Destruction complete after 0s
module.basic_vpc.aws_subnet.private[1]: Destruction complete after 0s
module.ec2_launch_template.aws_iam_instance_profile.ssm_instance_profile[0]: Destruction complete after 1s
module.ec2_launch_template.aws_iam_role.ssm_role[0]: Destroying... [id=dp-webapp-dev-ssm-role-20250725150556437000000001]
module.ec2_asg_target.aws_security_group.ec2_target_sg: Destruction complete after 1s
module.shared_alb.aws_security_group.alb_sg: Destroying... [id=sg-0f74761e2c0379f15]
module.ec2_launch_template.aws_iam_role.ssm_role[0]: Destruction complete after 0s
module.shared_alb.aws_security_group.alb_sg: Destruction complete after 0s
module.basic_vpc.aws_vpc.main: Destroying... [id=vpc-03f3ebd6ea9460bfb]
module.basic_vpc.aws_vpc.main: Destruction complete after 1s

Destroy complete! Resources: 45 destroyed.
```