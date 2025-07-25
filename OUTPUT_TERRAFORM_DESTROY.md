```bash
➜  epcvip-devops-assessment git:(replace_ssm_with_ssh) ✗ ./terraform_destroy.sh dev                                                             <aws:epcvip-asg> <region:us-east-1>
Running terraform destroy for target environment dev
data.http.my_public_ip: Reading...
tls_private_key.generated_key: Refreshing state... [id=2204361dae5e0e45eec5eba78e5f3349c1a2ed2c]
data.http.my_public_ip: Read complete after 0s [id=https://api.ipify.org]
module.ec2_launch_template.data.aws_ssm_parameter.amazon_linux_2023_ami: Reading...
module.basic_vpc.data.aws_availability_zones.available: Reading...
module.shared_alb.data.aws_caller_identity.current: Reading...
aws_key_pair.generated_key: Refreshing state... [id=dp-webapp-dev-key]
data.aws_partition.current: Reading...
data.aws_caller_identity.current: Reading...
module.basic_vpc.aws_eip.nat_gateway_eip[0]: Refreshing state... [id=eipalloc-05b2c97c946de2770]
data.aws_region.current: Reading...
module.basic_vpc.aws_vpc.main: Refreshing state... [id=vpc-00cd3dabdab1960e1]
data.aws_partition.current: Read complete after 0s [id=aws]
data.aws_region.current: Read complete after 0s [id=us-east-1]
module.shared_alb.data.aws_caller_identity.current: Read complete after 0s [id=711685268649]
data.aws_caller_identity.current: Read complete after 0s [id=711685268649]
module.ec2_launch_template.data.aws_ssm_parameter.amazon_linux_2023_ami: Read complete after 0s [id=/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64]
module.basic_vpc.data.aws_availability_zones.available: Read complete after 0s [id=us-east-1]
local_file.ssh_private_key: Refreshing state... [id=f87397adcc9613a5379d680db88ada72548f27f7]
module.basic_vpc.aws_internet_gateway.main: Refreshing state... [id=igw-0fca28a1bb9ea39bf]
module.shared_alb.data.aws_vpc.selected_vpc: Reading...
module.basic_vpc.aws_subnet.public[0]: Refreshing state... [id=subnet-090bf3f802565046b]
module.basic_vpc.aws_subnet.private[0]: Refreshing state... [id=subnet-0afb2cac0abe54617]
module.basic_vpc.aws_subnet.private[1]: Refreshing state... [id=subnet-0cc4697baec71dc98]
module.basic_vpc.aws_subnet.public[1]: Refreshing state... [id=subnet-0d5623e4f26b7ce4f]
module.ec2_asg_target.aws_lb_target_group.app_target_group: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:711685268649:targetgroup/dp-webapp-tg-dev/a8da2f097124b31c]
module.basic_vpc.aws_route_table.public: Refreshing state... [id=rtb-064fef299eedddb56]
module.basic_vpc.aws_nat_gateway.main[0]: Refreshing state... [id=nat-0db4a1713db692d54]
module.basic_vpc.aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-04b8b205fd92a815d]
module.basic_vpc.aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-0041723e0e8286f51]
module.basic_vpc.aws_route_table.private[0]: Refreshing state... [id=rtb-005cad2d65ecd3a9f]
module.basic_vpc.aws_route_table_association.private[1]: Refreshing state... [id=rtbassoc-0a183132a9747d90a]
module.basic_vpc.aws_route_table_association.private[0]: Refreshing state... [id=rtbassoc-0456807b0e5486668]
module.shared_alb.data.aws_vpc.selected_vpc: Read complete after 1s [id=vpc-00cd3dabdab1960e1]
module.shared_alb.aws_security_group.alb_sg: Refreshing state... [id=sg-0a2e5dabae395a62f]
module.shared_alb.aws_lb.shared_alb: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:711685268649:loadbalancer/app/dp-webapp-dev/e2d274070a6469ec]
module.ec2_asg_target.aws_security_group.ec2_target_sg: Refreshing state... [id=sg-05c403e3351262f79]
module.ec2_launch_template.aws_launch_template.main: Refreshing state... [id=lt-041f7699441904d66]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Refreshing state... [id=dp-webapp-asg-dev]
module.shared_alb.aws_lb_listener.shared_alb_listener_http[0]: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:711685268649:listener/app/dp-webapp-dev/e2d274070a6469ec/16ec07e99101c5bc]
module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0]: Refreshing state... [id=arn:aws:elasticloadbalancing:us-east-1:711685268649:listener-rule/app/dp-webapp-dev/e2d274070a6469ec/16ec07e99101c5bc/e071207b8175eeb5]
module.ec2_asg_target.aws_autoscaling_policy.scale_down[0]: Refreshing state... [id=dp-webapp-asg-dev-scale-down]
module.ec2_asg_target.aws_autoscaling_policy.scale_up[0]: Refreshing state... [id=dp-webapp-asg-dev-scale-up]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0]: Refreshing state... [id=dp-webapp-asg-dev-cpu-low-alarm]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0]: Refreshing state... [id=dp-webapp-asg-dev-cpu-high-alarm]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_key_pair.generated_key will be destroyed
  - resource "aws_key_pair" "generated_key" {
      - arn             = "arn:aws:ec2:us-east-1:711685268649:key-pair/dp-webapp-dev-key" -> null
      - fingerprint     = "88:56:4f:7a:02:57:7a:87:77:da:81:63:15:86:00:20" -> null
      - id              = "dp-webapp-dev-key" -> null
      - key_name        = "dp-webapp-dev-key" -> null
      - key_pair_id     = "key-0f2d6ce1dcfef4c23" -> null
      - key_type        = "rsa" -> null
      - public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGjRHrLXp7GWaclFqbzKpyU+oLgPK2Sr5pRu164G8Tf5mz5WX98LeorEWMlLBjgFKHefSK3vhY7g7f/NNRkv6AKsuA8uaWTaGqdOEuShnRxzwQnknuNIj70l8fkFAvln7RsZUhuKPy1tHQFITruGOfJtkmvPCs5Dul+tLBMZeGeJvI9VW6uv2aTBHcINIlK9VtFGaCeWXZB6tV+fYEJzZZ5/1RGu6XG/zO+T3WJnd+OkjLNjnGf+Ue9D8DpLuYBcx8URpEu3fQeLqAkGRX9VEu2x5HOFPZyOl1l2BBiNJFh6B3dlJOz8vYQRDIPhmwJmRuhWYEIqgTo9zJ22U3yUZf1g5UWE4I9YY6nm2/ijDsYQcUX2U3wRwxkcUlMzI9U1YpghvlwWpO8GBlBCqDW6KAphOZ4Z0XbNJ28XvrLbxjXi4YgWDdc31I82cYK77vPPRMk/LgpDre34Q2uQjm6yPiJlTrPnC7Ab25xaeihxGFUyeV2LHBDUP9PMqexdvoyeJC+Mehkj9MGuNcCEyyI7s6d6z/OwAcO/+izM/aTYmwYG9W4vRD95o7zz4yLwYs4M/TCIrp0/60KwY0yWIVxczY9vNpKWeCtpTa8hp5kQl0zWSKGA2aqqUB1pmmxYzpBySdBJ0GYHxXgMdU2Wcb/9A0zr1m+OV/CDjguQErvolLwQ==" -> null
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
        # (1 unchanged attribute hidden)
    }

  # local_file.ssh_private_key will be destroyed
  - resource "local_file" "ssh_private_key" {
      - content              = (sensitive value) -> null
      - content_base64sha256 = "C3PuUizS2v6JXz6F5Vm84AQlbQDKHYZ+f4qtYgsVJJU=" -> null
      - content_base64sha512 = "xeRsDC9QxRfvAC+3gv6PumtAS/5jK6mPb1MoxgHPecM2K1kXzNNBm2VhC4cCrsgIJ+AMWBrzG5FRr8P2vsSDgg==" -> null
      - content_md5          = "780bf652c2919f097332a3a96ff0fd49" -> null
      - content_sha1         = "f87397adcc9613a5379d680db88ada72548f27f7" -> null
      - content_sha256       = "0b73ee522cd2dafe895f3e85e559bce004256d00ca1d867e7f8aad620b152495" -> null
      - content_sha512       = "c5e46c0c2f50c517ef002fb782fe8fba6b404bfe632ba98f6f5328c601cf79c3362b5917ccd3419b65610b8702aec80827e00c581af31b9151afc3f6bec48382" -> null
      - directory_permission = "0777" -> null
      - file_permission      = "0600" -> null
      - filename             = "/Users/dpowers/.ssh/dp-webapp-dev-key.pem" -> null
      - id                   = "f87397adcc9613a5379d680db88ada72548f27f7" -> null
    }

  # tls_private_key.generated_key will be destroyed
  - resource "tls_private_key" "generated_key" {
      - algorithm                     = "RSA" -> null
      - ecdsa_curve                   = "P224" -> null
      - id                            = "2204361dae5e0e45eec5eba78e5f3349c1a2ed2c" -> null
      - private_key_openssh           = (sensitive value) -> null
      - private_key_pem               = (sensitive value) -> null
      - private_key_pem_pkcs8         = (sensitive value) -> null
      - public_key_fingerprint_md5    = "d2:5a:0d:02:08:8a:e8:12:38:51:bd:d9:99:1e:24:3e" -> null
      - public_key_fingerprint_sha256 = "SHA256:D51ANxWaFJCi2mFzBLnCXt5yFxIN3nmbd933TzkFkJM" -> null
      - public_key_openssh            = <<-EOT
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGjRHrLXp7GWaclFqbzKpyU+oLgPK2Sr5pRu164G8Tf5mz5WX98LeorEWMlLBjgFKHefSK3vhY7g7f/NNRkv6AKsuA8uaWTaGqdOEuShnRxzwQnknuNIj70l8fkFAvln7RsZUhuKPy1tHQFITruGOfJtkmvPCs5Dul+tLBMZeGeJvI9VW6uv2aTBHcINIlK9VtFGaCeWXZB6tV+fYEJzZZ5/1RGu6XG/zO+T3WJnd+OkjLNjnGf+Ue9D8DpLuYBcx8URpEu3fQeLqAkGRX9VEu2x5HOFPZyOl1l2BBiNJFh6B3dlJOz8vYQRDIPhmwJmRuhWYEIqgTo9zJ22U3yUZf1g5UWE4I9YY6nm2/ijDsYQcUX2U3wRwxkcUlMzI9U1YpghvlwWpO8GBlBCqDW6KAphOZ4Z0XbNJ28XvrLbxjXi4YgWDdc31I82cYK77vPPRMk/LgpDre34Q2uQjm6yPiJlTrPnC7Ab25xaeihxGFUyeV2LHBDUP9PMqexdvoyeJC+Mehkj9MGuNcCEyyI7s6d6z/OwAcO/+izM/aTYmwYG9W4vRD95o7zz4yLwYs4M/TCIrp0/60KwY0yWIVxczY9vNpKWeCtpTa8hp5kQl0zWSKGA2aqqUB1pmmxYzpBySdBJ0GYHxXgMdU2Wcb/9A0zr1m+OV/CDjguQErvolLwQ==
        EOT -> null
      - public_key_pem                = <<-EOT
            -----BEGIN PUBLIC KEY-----
            MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAxo0R6y16exlmnJRam8yq
            clPqC4Dytkq+aUbteuBvE3+Zs+Vl/fC3qKxFjJSwY4BSh3n0it74WO4O3/zTUZL+
            gCrLgPLmlk2hqnThLkoZ0cc8EJ5J7jSI+9JfH5BQL5Z+0bGVIbij8tbR0BSE67hj
            nybZJrzwrOQ7pfrSwTGXhnibyPVVurr9mkwR3CDSJSvVbRRmgnll2QerVfn2BCc2
            Wef9URrulxv8zvk91iZ3fjpIyzY5xn/lHvQ/A6S7mAXMfFEaRLt30Hi6gJBkV/VR
            LtseRzhT2cjpdZdgQYjSRYegd3ZSTs/L2EEQyD4ZsCZkboVmBCKoE6PcydtlN8lG
            X9YOVFhOCPWGOp5tv4ow7GEHFF9lN8EcMZHFJTMyPVNWKYIb5cFqTvBgZQQqg1ui
            gKYTmeGdF2zSdvF76y28Y14uGIFg3XN9SPNnGCu+7zz0TJPy4KQ63t+ENrkI5usj
            4iZU6z5wuwG9ucWnoocRhVMnldixwQ1D/TzKnsXb6MniQvjHoZI/TBrjXAhMsiO7
            Ones/zsAHDv/oszP2k2JsGBvVuL0Q/eaO88+Mi8GLODP0wiK6dP+tCsGNMliFcXM
            2PbzaSlngraU2vIaeZEJdM1kihgNmqqlAdaZpsWM6QcknQSdBmB8V4DHVNlnG//Q
            NM69Zvjlfwg44LkBK76JS8ECAwEAAQ==
            -----END PUBLIC KEY-----
        EOT -> null
      - rsa_bits                      = 4096 -> null
    }

  # module.basic_vpc.aws_eip.nat_gateway_eip[0] will be destroyed
  - resource "aws_eip" "nat_gateway_eip" {
      - allocation_id            = "eipalloc-05b2c97c946de2770" -> null
      - arn                      = "arn:aws:ec2:us-east-1:711685268649:elastic-ip/eipalloc-05b2c97c946de2770" -> null
      - association_id           = "eipassoc-05398b2bf28b3528d" -> null
      - domain                   = "vpc" -> null
      - id                       = "eipalloc-05b2c97c946de2770" -> null
      - network_border_group     = "us-east-1" -> null
      - network_interface        = "eni-093ff1cddea708985" -> null
      - private_dns              = "ip-10-100-1-249.ec2.internal" -> null
      - private_ip               = "10.100.1.249" -> null
      - public_dns               = "ec2-18-205-232-100.compute-1.amazonaws.com" -> null
      - public_ip                = "18.205.232.100" -> null
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
      - arn      = "arn:aws:ec2:us-east-1:711685268649:internet-gateway/igw-0fca28a1bb9ea39bf" -> null
      - id       = "igw-0fca28a1bb9ea39bf" -> null
      - owner_id = "711685268649" -> null
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
      - vpc_id   = "vpc-00cd3dabdab1960e1" -> null
    }

  # module.basic_vpc.aws_nat_gateway.main[0] will be destroyed
  - resource "aws_nat_gateway" "main" {
      - allocation_id                      = "eipalloc-05b2c97c946de2770" -> null
      - association_id                     = "eipassoc-05398b2bf28b3528d" -> null
      - connectivity_type                  = "public" -> null
      - id                                 = "nat-0db4a1713db692d54" -> null
      - network_interface_id               = "eni-093ff1cddea708985" -> null
      - private_ip                         = "10.100.1.249" -> null
      - public_ip                          = "18.205.232.100" -> null
      - region                             = "us-east-1" -> null
      - secondary_allocation_ids           = [] -> null
      - secondary_private_ip_address_count = 0 -> null
      - secondary_private_ip_addresses     = [] -> null
      - subnet_id                          = "subnet-090bf3f802565046b" -> null
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
      - arn              = "arn:aws:ec2:us-east-1:711685268649:route-table/rtb-005cad2d65ecd3a9f" -> null
      - id               = "rtb-005cad2d65ecd3a9f" -> null
      - owner_id         = "711685268649" -> null
      - propagating_vgws = [] -> null
      - region           = "us-east-1" -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - nat_gateway_id             = "nat-0db4a1713db692d54"
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
      - vpc_id           = "vpc-00cd3dabdab1960e1" -> null
    }

  # module.basic_vpc.aws_route_table.public will be destroyed
  - resource "aws_route_table" "public" {
      - arn              = "arn:aws:ec2:us-east-1:711685268649:route-table/rtb-064fef299eedddb56" -> null
      - id               = "rtb-064fef299eedddb56" -> null
      - owner_id         = "711685268649" -> null
      - propagating_vgws = [] -> null
      - region           = "us-east-1" -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-0fca28a1bb9ea39bf"
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
      - vpc_id           = "vpc-00cd3dabdab1960e1" -> null
    }

  # module.basic_vpc.aws_route_table_association.private[0] will be destroyed
  - resource "aws_route_table_association" "private" {
      - id             = "rtbassoc-0456807b0e5486668" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-005cad2d65ecd3a9f" -> null
      - subnet_id      = "subnet-0afb2cac0abe54617" -> null
        # (1 unchanged attribute hidden)
    }

  # module.basic_vpc.aws_route_table_association.private[1] will be destroyed
  - resource "aws_route_table_association" "private" {
      - id             = "rtbassoc-0a183132a9747d90a" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-005cad2d65ecd3a9f" -> null
      - subnet_id      = "subnet-0cc4697baec71dc98" -> null
        # (1 unchanged attribute hidden)
    }

  # module.basic_vpc.aws_route_table_association.public[0] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-04b8b205fd92a815d" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-064fef299eedddb56" -> null
      - subnet_id      = "subnet-090bf3f802565046b" -> null
        # (1 unchanged attribute hidden)
    }

  # module.basic_vpc.aws_route_table_association.public[1] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0041723e0e8286f51" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-064fef299eedddb56" -> null
      - subnet_id      = "subnet-0d5623e4f26b7ce4f" -> null
        # (1 unchanged attribute hidden)
    }

  # module.basic_vpc.aws_subnet.private[0] will be destroyed
  - resource "aws_subnet" "private" {
      - arn                                            = "arn:aws:ec2:us-east-1:711685268649:subnet/subnet-0afb2cac0abe54617" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az1" -> null
      - cidr_block                                     = "10.100.101.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0afb2cac0abe54617" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "711685268649" -> null
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
      - vpc_id                                         = "vpc-00cd3dabdab1960e1" -> null
        # (4 unchanged attributes hidden)
    }

  # module.basic_vpc.aws_subnet.private[1] will be destroyed
  - resource "aws_subnet" "private" {
      - arn                                            = "arn:aws:ec2:us-east-1:711685268649:subnet/subnet-0cc4697baec71dc98" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1b" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.100.102.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0cc4697baec71dc98" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "711685268649" -> null
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
      - vpc_id                                         = "vpc-00cd3dabdab1960e1" -> null
        # (4 unchanged attributes hidden)
    }

  # module.basic_vpc.aws_subnet.public[0] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:us-east-1:711685268649:subnet/subnet-090bf3f802565046b" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az1" -> null
      - cidr_block                                     = "10.100.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-090bf3f802565046b" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "711685268649" -> null
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
      - vpc_id                                         = "vpc-00cd3dabdab1960e1" -> null
        # (4 unchanged attributes hidden)
    }

  # module.basic_vpc.aws_subnet.public[1] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:us-east-1:711685268649:subnet/subnet-0d5623e4f26b7ce4f" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1b" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.100.2.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0d5623e4f26b7ce4f" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "711685268649" -> null
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
      - vpc_id                                         = "vpc-00cd3dabdab1960e1" -> null
        # (4 unchanged attributes hidden)
    }

  # module.basic_vpc.aws_vpc.main will be destroyed
  - resource "aws_vpc" "main" {
      - arn                                  = "arn:aws:ec2:us-east-1:711685268649:vpc/vpc-00cd3dabdab1960e1" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.100.0.0/16" -> null
      - default_network_acl_id               = "acl-06068a1fdfbc24ec0" -> null
      - default_route_table_id               = "rtb-09348237b744bbaf2" -> null
      - default_security_group_id            = "sg-0fe02735173c23254" -> null
      - dhcp_options_id                      = "dopt-b60423cd" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-00cd3dabdab1960e1" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-09348237b744bbaf2" -> null
      - owner_id                             = "711685268649" -> null
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
      - arn                              = "arn:aws:autoscaling:us-east-1:711685268649:autoScalingGroup:59672766-430b-491c-b5e3-2c931e838832:autoScalingGroupName/dp-webapp-asg-dev" -> null
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
      - service_linked_role_arn          = "arn:aws:iam::711685268649:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling" -> null
      - suspended_processes              = [] -> null
      - target_group_arns                = [
          - "arn:aws:elasticloadbalancing:us-east-1:711685268649:targetgroup/dp-webapp-tg-dev/a8da2f097124b31c",
        ] -> null
      - termination_policies             = [] -> null
      - vpc_zone_identifier              = [
          - "subnet-090bf3f802565046b",
          - "subnet-0d5623e4f26b7ce4f",
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
          - id      = "lt-041f7699441904d66" -> null
          - name    = "dp-webapp-dev20250725155042347900000004" -> null
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
          - identifier = "arn:aws:elasticloadbalancing:us-east-1:711685268649:targetgroup/dp-webapp-tg-dev/a8da2f097124b31c" -> null
          - type       = "elbv2" -> null
        }
    }

  # module.ec2_asg_target.aws_autoscaling_policy.scale_down[0] will be destroyed
  - resource "aws_autoscaling_policy" "scale_down" {
      - adjustment_type           = "ChangeInCapacity" -> null
      - arn                       = "arn:aws:autoscaling:us-east-1:711685268649:scalingPolicy:a992ea3e-4a3a-421e-beca-128a13399707:autoScalingGroupName/dp-webapp-asg-dev:policyName/dp-webapp-asg-dev-scale-down" -> null
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
      - arn                       = "arn:aws:autoscaling:us-east-1:711685268649:scalingPolicy:58fdb7b5-3026-4a5b-bfe2-e5dc2c41fab1:autoScalingGroupName/dp-webapp-asg-dev:policyName/dp-webapp-asg-dev-scale-up" -> null
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
          - "arn:aws:autoscaling:us-east-1:711685268649:scalingPolicy:58fdb7b5-3026-4a5b-bfe2-e5dc2c41fab1:autoScalingGroupName/dp-webapp-asg-dev:policyName/dp-webapp-asg-dev-scale-up",
        ] -> null
      - alarm_description                     = "This alarm triggers a scale-up when CPU utilization is high." -> null
      - alarm_name                            = "dp-webapp-asg-dev-cpu-high-alarm" -> null
      - arn                                   = "arn:aws:cloudwatch:us-east-1:711685268649:alarm:dp-webapp-asg-dev-cpu-high-alarm" -> null
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
          - "arn:aws:autoscaling:us-east-1:711685268649:scalingPolicy:a992ea3e-4a3a-421e-beca-128a13399707:autoScalingGroupName/dp-webapp-asg-dev:policyName/dp-webapp-asg-dev-scale-down",
        ] -> null
      - alarm_description                     = "This alarm triggers a scale-down when CPU utilization is low." -> null
      - alarm_name                            = "dp-webapp-asg-dev-cpu-low-alarm" -> null
      - arn                                   = "arn:aws:cloudwatch:us-east-1:711685268649:alarm:dp-webapp-asg-dev-cpu-low-alarm" -> null
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
      - arn          = "arn:aws:elasticloadbalancing:us-east-1:711685268649:listener-rule/app/dp-webapp-dev/e2d274070a6469ec/16ec07e99101c5bc/e071207b8175eeb5" -> null
      - id           = "arn:aws:elasticloadbalancing:us-east-1:711685268649:listener-rule/app/dp-webapp-dev/e2d274070a6469ec/16ec07e99101c5bc/e071207b8175eeb5" -> null
      - listener_arn = "arn:aws:elasticloadbalancing:us-east-1:711685268649:listener/app/dp-webapp-dev/e2d274070a6469ec/16ec07e99101c5bc" -> null
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
          - target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:711685268649:targetgroup/dp-webapp-tg-dev/a8da2f097124b31c" -> null
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
      - arn                                = "arn:aws:elasticloadbalancing:us-east-1:711685268649:targetgroup/dp-webapp-tg-dev/a8da2f097124b31c" -> null
      - arn_suffix                         = "targetgroup/dp-webapp-tg-dev/a8da2f097124b31c" -> null
      - deregistration_delay               = "20" -> null
      - id                                 = "arn:aws:elasticloadbalancing:us-east-1:711685268649:targetgroup/dp-webapp-tg-dev/a8da2f097124b31c" -> null
      - ip_address_type                    = "ipv4" -> null
      - lambda_multi_value_headers_enabled = false -> null
      - load_balancer_arns                 = [
          - "arn:aws:elasticloadbalancing:us-east-1:711685268649:loadbalancer/app/dp-webapp-dev/e2d274070a6469ec",
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
      - vpc_id                             = "vpc-00cd3dabdab1960e1" -> null
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
      - arn                    = "arn:aws:ec2:us-east-1:711685268649:security-group/sg-05c403e3351262f79" -> null
      - description            = "Allow traffic from ALB and SSH for dp-webapp" -> null
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
      - id                     = "sg-05c403e3351262f79" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "98.97.140.100/32",
                ]
              - description      = "Allow SSH access from specified CIDR blocks"
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = []
              - description      = "Allow traffic from the Application Load Balancer"
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = [
                  - "sg-0a2e5dabae395a62f",
                ]
              - self             = false
              - to_port          = 80
            },
        ] -> null
      - name                   = "dp-webapp-ec2-sg-20250725155039046000000003" -> null
      - name_prefix            = "dp-webapp-ec2-sg-" -> null
      - owner_id               = "711685268649" -> null
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
      - vpc_id                 = "vpc-00cd3dabdab1960e1" -> null
    }

  # module.ec2_launch_template.aws_launch_template.main will be destroyed
  - resource "aws_launch_template" "main" {
      - arn                                  = "arn:aws:ec2:us-east-1:711685268649:launch-template/lt-041f7699441904d66" -> null
      - default_version                      = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - id                                   = "lt-041f7699441904d66" -> null
      - image_id                             = (sensitive value) -> null
      - instance_type                        = "t3.micro" -> null
      - key_name                             = "dp-webapp-dev-key" -> null
      - latest_version                       = 1 -> null
      - name                                 = "dp-webapp-dev20250725155042347900000004" -> null
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
        # (5 unchanged attributes hidden)

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
          - associate_public_ip_address  = "true" -> null
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
              - "sg-05c403e3351262f79",
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

  # module.shared_alb.aws_lb.shared_alb will be destroyed
  - resource "aws_lb" "shared_alb" {
      - arn                                                          = "arn:aws:elasticloadbalancing:us-east-1:711685268649:loadbalancer/app/dp-webapp-dev/e2d274070a6469ec" -> null
      - arn_suffix                                                   = "app/dp-webapp-dev/e2d274070a6469ec" -> null
      - client_keep_alive                                            = 3600 -> null
      - desync_mitigation_mode                                       = "defensive" -> null
      - dns_name                                                     = "dp-webapp-dev-1423329573.us-east-1.elb.amazonaws.com" -> null
      - drop_invalid_header_fields                                   = false -> null
      - enable_cross_zone_load_balancing                             = true -> null
      - enable_deletion_protection                                   = false -> null
      - enable_http2                                                 = true -> null
      - enable_tls_version_and_cipher_suite_headers                  = false -> null
      - enable_waf_fail_open                                         = false -> null
      - enable_xff_client_port                                       = false -> null
      - enable_zonal_shift                                           = false -> null
      - id                                                           = "arn:aws:elasticloadbalancing:us-east-1:711685268649:loadbalancer/app/dp-webapp-dev/e2d274070a6469ec" -> null
      - idle_timeout                                                 = 60 -> null
      - internal                                                     = false -> null
      - ip_address_type                                              = "ipv4" -> null
      - load_balancer_type                                           = "application" -> null
      - name                                                         = "dp-webapp-dev" -> null
      - preserve_host_header                                         = false -> null
      - region                                                       = "us-east-1" -> null
      - security_groups                                              = [
          - "sg-0a2e5dabae395a62f",
        ] -> null
      - subnets                                                      = [
          - "subnet-090bf3f802565046b",
          - "subnet-0d5623e4f26b7ce4f",
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
      - vpc_id                                                       = "vpc-00cd3dabdab1960e1" -> null
      - xff_header_processing_mode                                   = "append" -> null
      - zone_id                                                      = "Z35SXDOTRQ7X7K" -> null
        # (3 unchanged attributes hidden)

      - access_logs {
          - enabled = false -> null
            # (2 unchanged attributes hidden)
        }

      - connection_logs {
          - enabled = false -> null
            # (2 unchanged attributes hidden)
        }

      - subnet_mapping {
          - subnet_id            = "subnet-090bf3f802565046b" -> null
            # (4 unchanged attributes hidden)
        }
      - subnet_mapping {
          - subnet_id            = "subnet-0d5623e4f26b7ce4f" -> null
            # (4 unchanged attributes hidden)
        }
    }

  # module.shared_alb.aws_lb_listener.shared_alb_listener_http[0] will be destroyed
  - resource "aws_lb_listener" "shared_alb_listener_http" {
      - arn                                                                 = "arn:aws:elasticloadbalancing:us-east-1:711685268649:listener/app/dp-webapp-dev/e2d274070a6469ec/16ec07e99101c5bc" -> null
      - id                                                                  = "arn:aws:elasticloadbalancing:us-east-1:711685268649:listener/app/dp-webapp-dev/e2d274070a6469ec/16ec07e99101c5bc" -> null
      - load_balancer_arn                                                   = "arn:aws:elasticloadbalancing:us-east-1:711685268649:loadbalancer/app/dp-webapp-dev/e2d274070a6469ec" -> null
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

  # module.shared_alb.aws_security_group.alb_sg will be destroyed
  - resource "aws_security_group" "alb_sg" {
      - arn                    = "arn:aws:ec2:us-east-1:711685268649:security-group/sg-0a2e5dabae395a62f" -> null
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
      - id                     = "sg-0a2e5dabae395a62f" -> null
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
      - owner_id               = "711685268649" -> null
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
      - vpc_id                 = "vpc-00cd3dabdab1960e1" -> null
        # (1 unchanged attribute hidden)
    }

Plan: 0 to add, 0 to change, 29 to destroy.

Changes to Outputs:
  - alb_dns_name             = "dp-webapp-dev-1423329573.us-east-1.elb.amazonaws.com" -> null
  - alb_security_group_id    = "sg-0a2e5dabae395a62f" -> null
  - ec2_asg_target_asg_name  = "dp-webapp-asg-dev" -> null
  - ec2_asg_target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:711685268649:targetgroup/dp-webapp-tg-dev/a8da2f097124b31c" -> null
  - generated_key_pair_name  = "dp-webapp-dev-key" -> null
  - private_subnet_ids       = [
      - "subnet-0afb2cac0abe54617",
      - "subnet-0cc4697baec71dc98",
    ] -> null
  - public_subnet_ids        = [
      - "subnet-090bf3f802565046b",
      - "subnet-0d5623e4f26b7ce4f",
    ] -> null
  - ssh_private_key_path     = "/Users/dpowers/.ssh/dp-webapp-dev-key.pem" -> null
  - vpc_id                   = "vpc-00cd3dabdab1960e1" -> null
local_file.ssh_private_key: Destroying... [id=f87397adcc9613a5379d680db88ada72548f27f7]
local_file.ssh_private_key: Destruction complete after 0s
module.basic_vpc.aws_route_table_association.private[0]: Destroying... [id=rtbassoc-0456807b0e5486668]
module.basic_vpc.aws_route_table_association.public[0]: Destroying... [id=rtbassoc-04b8b205fd92a815d]
module.basic_vpc.aws_route_table_association.public[1]: Destroying... [id=rtbassoc-0041723e0e8286f51]
module.basic_vpc.aws_route_table_association.private[1]: Destroying... [id=rtbassoc-0a183132a9747d90a]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0]: Destroying... [id=dp-webapp-asg-dev-cpu-high-alarm]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0]: Destroying... [id=dp-webapp-asg-dev-cpu-low-alarm]
module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0]: Destroying... [id=arn:aws:elasticloadbalancing:us-east-1:711685268649:listener-rule/app/dp-webapp-dev/e2d274070a6469ec/16ec07e99101c5bc/e071207b8175eeb5]
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_high[0]: Destruction complete after 1s
module.ec2_asg_target.aws_lb_listener_rule.app_listener_rule[0]: Destruction complete after 1s
module.ec2_asg_target.aws_cloudwatch_metric_alarm.cpu_low[0]: Destruction complete after 1s
module.ec2_asg_target.aws_autoscaling_policy.scale_up[0]: Destroying... [id=dp-webapp-asg-dev-scale-up]
module.ec2_asg_target.aws_autoscaling_policy.scale_down[0]: Destroying... [id=dp-webapp-asg-dev-scale-down]
module.shared_alb.aws_lb_listener.shared_alb_listener_http[0]: Destroying... [id=arn:aws:elasticloadbalancing:us-east-1:711685268649:listener/app/dp-webapp-dev/e2d274070a6469ec/16ec07e99101c5bc]
module.shared_alb.aws_lb_listener.shared_alb_listener_http[0]: Destruction complete after 0s
module.shared_alb.aws_lb.shared_alb: Destroying... [id=arn:aws:elasticloadbalancing:us-east-1:711685268649:loadbalancer/app/dp-webapp-dev/e2d274070a6469ec]
module.basic_vpc.aws_route_table_association.private[1]: Destruction complete after 1s
module.basic_vpc.aws_route_table_association.private[0]: Destruction complete after 1s
module.basic_vpc.aws_route_table_association.public[0]: Destruction complete after 1s
module.basic_vpc.aws_subnet.private[0]: Destroying... [id=subnet-0afb2cac0abe54617]
module.basic_vpc.aws_subnet.private[1]: Destroying... [id=subnet-0cc4697baec71dc98]
module.basic_vpc.aws_route_table.private[0]: Destroying... [id=rtb-005cad2d65ecd3a9f]
module.basic_vpc.aws_route_table_association.public[1]: Destruction complete after 1s
module.basic_vpc.aws_route_table.public: Destroying... [id=rtb-064fef299eedddb56]
module.ec2_asg_target.aws_autoscaling_policy.scale_up[0]: Destruction complete after 0s
module.ec2_asg_target.aws_autoscaling_policy.scale_down[0]: Destruction complete after 0s
module.ec2_asg_target.aws_autoscaling_group.app_asg: Destroying... [id=dp-webapp-asg-dev]
module.basic_vpc.aws_subnet.private[0]: Destruction complete after 1s
module.basic_vpc.aws_subnet.private[1]: Destruction complete after 1s
module.basic_vpc.aws_route_table.private[0]: Destruction complete after 1s
module.basic_vpc.aws_nat_gateway.main[0]: Destroying... [id=nat-0db4a1713db692d54]
module.basic_vpc.aws_route_table.public: Destruction complete after 1s
module.shared_alb.aws_lb.shared_alb: Still destroying... [id=arn:aws:elasticloadbalancing:us-east-1:...cer/app/dp-webapp-dev/e2d274070a6469ec, 00m10s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m10s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0db4a1713db692d54, 00m10s elapsed]
module.shared_alb.aws_lb.shared_alb: Still destroying... [id=arn:aws:elasticloadbalancing:us-east-1:...cer/app/dp-webapp-dev/e2d274070a6469ec, 00m20s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m20s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0db4a1713db692d54, 00m20s elapsed]
module.shared_alb.aws_lb.shared_alb: Destruction complete after 28s
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m30s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0db4a1713db692d54, 00m30s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m40s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0db4a1713db692d54, 00m40s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 00m50s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0db4a1713db692d54, 00m50s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m00s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Still destroying... [id=nat-0db4a1713db692d54, 01m00s elapsed]
module.basic_vpc.aws_nat_gateway.main[0]: Destruction complete after 1m1s
module.basic_vpc.aws_internet_gateway.main: Destroying... [id=igw-0fca28a1bb9ea39bf]
module.basic_vpc.aws_eip.nat_gateway_eip[0]: Destroying... [id=eipalloc-05b2c97c946de2770]
module.basic_vpc.aws_eip.nat_gateway_eip[0]: Destruction complete after 1s
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m10s elapsed]
module.basic_vpc.aws_internet_gateway.main: Still destroying... [id=igw-0fca28a1bb9ea39bf, 00m10s elapsed]
module.basic_vpc.aws_internet_gateway.main: Destruction complete after 18s
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m20s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m30s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Still destroying... [id=dp-webapp-asg-dev, 01m40s elapsed]
module.ec2_asg_target.aws_autoscaling_group.app_asg: Destruction complete after 1m47s
module.basic_vpc.aws_subnet.public[1]: Destroying... [id=subnet-0d5623e4f26b7ce4f]
module.basic_vpc.aws_subnet.public[0]: Destroying... [id=subnet-090bf3f802565046b]
module.ec2_asg_target.aws_lb_target_group.app_target_group: Destroying... [id=arn:aws:elasticloadbalancing:us-east-1:711685268649:targetgroup/dp-webapp-tg-dev/a8da2f097124b31c]
module.ec2_launch_template.aws_launch_template.main: Destroying... [id=lt-041f7699441904d66]
module.ec2_asg_target.aws_lb_target_group.app_target_group: Destruction complete after 0s
module.ec2_launch_template.aws_launch_template.main: Destruction complete after 0s
aws_key_pair.generated_key: Destroying... [id=dp-webapp-dev-key]
module.ec2_asg_target.aws_security_group.ec2_target_sg: Destroying... [id=sg-05c403e3351262f79]
module.basic_vpc.aws_subnet.public[1]: Destruction complete after 1s
module.basic_vpc.aws_subnet.public[0]: Destruction complete after 1s
aws_key_pair.generated_key: Destruction complete after 1s
tls_private_key.generated_key: Destroying... [id=2204361dae5e0e45eec5eba78e5f3349c1a2ed2c]
tls_private_key.generated_key: Destruction complete after 0s
module.ec2_asg_target.aws_security_group.ec2_target_sg: Destruction complete after 1s
module.shared_alb.aws_security_group.alb_sg: Destroying... [id=sg-0a2e5dabae395a62f]
module.shared_alb.aws_security_group.alb_sg: Destruction complete after 1s
module.basic_vpc.aws_vpc.main: Destroying... [id=vpc-00cd3dabdab1960e1]
module.basic_vpc.aws_vpc.main: Destruction complete after 1s

Destroy complete! Resources: 29 destroyed.
```