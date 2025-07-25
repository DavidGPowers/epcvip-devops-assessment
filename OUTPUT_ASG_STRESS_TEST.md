## ASG Stress Test Output

_see [STRESS_TEST.md](./STRESS_TEST.md)_

```bash
➜  epcvip-devops-assessment git:(replace_ssm_with_ssh) ✗ ./asg_stress_test.sh dev                                                               <aws:epcvip-asg> <region:us-east-1>
Target environment set to: dev
Using SSH Key: /Users/dpowers/.ssh/dp-webapp-dev-key.pem
----------------------------------------------------------------
Using AWS Region: us-east-1
Retrieving Auto Scaling Group name from Terraform state...
Target Auto Scaling Group: dp-webapp-asg-dev
----------------------------------------------------------------
Fetching Public IPs of 'InService' instances...
(Waiting up to 2 minutes for instances to be ready)...

Found instances to test: 44.213.247.62
3.87.200.6
----------------------------------------------------------------
Connecting to each instance via SSH to start the stress test...
This will generate high CPU load for 360 seconds (6 minutes).
Starting test on instance: 44.213.247.62
Starting test on instance: 3.87.200.6
Stress test commands sent to all instances. Waiting for completion...

Stress test duration has elapsed.
Waiting 600 seconds (10 minutes) for ASG to cool down...

Cooldown period finished. Fetching ASG activity history...
----------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
|                                       DescribeScalingActivities                                       |
+----------------------------------------------------+-------------+------------------------------------+
|                     Description                    |   Status    |               Time                 |
+----------------------------------------------------+-------------+------------------------------------+
|  Terminating EC2 instance: i-0b01d9b0b19c74813     |  Successful |  2025-07-25T16:07:37.953000+00:00  |
|  Terminating EC2 instance: i-04f30cb9786287fa6     |  Successful |  2025-07-25T16:07:37.893000+00:00  |
|  Launching a new EC2 instance: i-06fc6791b47f5de77 |  Successful |  2025-07-25T16:01:52.636000+00:00  |
|  Launching a new EC2 instance: i-0219a861958a368d6 |  Successful |  2025-07-25T16:01:52.486000+00:00  |
|  Launching a new EC2 instance: i-0b01d9b0b19c74813 |  Successful |  2025-07-25T15:50:56.991000+00:00  |
|  Launching a new EC2 instance: i-04f30cb9786287fa6 |  Successful |  2025-07-25T15:50:56.902000+00:00  |
+----------------------------------------------------+-------------+------------------------------------+

Load test simulation complete.
```