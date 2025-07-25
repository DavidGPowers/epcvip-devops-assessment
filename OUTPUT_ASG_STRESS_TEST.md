## ASG Stress Test Output

_see [STRESS_TEST.md](./STRESS_TEST.md)_

```bash
➜  epcvip-devops-assessment git:(main) ✗ ./asg_stress_test.sh dev                                                                                      <aws:eai> <region:us-east-1>
Target environment set to: dev
----------------------------------------------------------------
Using AWS Region: us-east-1
Retrieving Auto Scaling Group name from Terraform state...
Starting load test simulation for Auto Scaling Group: dp-webapp-asg-dev
----------------------------------------------------------------
Fetching target instance IDs from ASG...
(Waiting up to 2 minutes for instances to become 'InService')...
Current instance states reported by API:
-------------------------------------------------
|           DescribeAutoScalingGroups           |
+---------+-----------------------+-------------+
| Health  |          ID           |    State    |
+---------+-----------------------+-------------+
|  Healthy|  i-02a2a409cb7ac7571  |  InService  |
|  Healthy|  i-0aaf6da5e8c30230a  |  InService  |
+---------+-----------------------+-------------+

Found instances to test: i-02a2a409cb7ac7571    i-0aaf6da5e8c30230a

Sending stress test command to all instances via SSM...
This will generate high CPU load for 360 seconds (6 minutes).
SSM Command sent successfully. Command ID: 9b6a85b8-eb64-4ad7-ad8d-dad559ba3568
Waiting for the stress test to complete...

Stress test duration has elapsed.
Waiting 600 seconds (10 minutes) for ASG to cool down and scale in...

Cooldown period finished. Fetching ASG activity history...
----------------------------------------------------------------
Auto Scaling Group Activity for: dp-webapp-asg-dev
----------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
|                                       DescribeScalingActivities                                       |
+----------------------------------------------------+-------------+------------------------------------+
|                     Description                    |   Status    |               Time                 |
+----------------------------------------------------+-------------+------------------------------------+
|  Terminating EC2 instance: i-0aaf6da5e8c30230a     |  Successful |  2025-07-25T15:39:10.073000+00:00  |
|  Terminating EC2 instance: i-02a2a409cb7ac7571     |  Successful |  2025-07-25T15:39:09.931000+00:00  |
|  Launching a new EC2 instance: i-0aa06fa277063bc3d |  Successful |  2025-07-25T15:33:52.738000+00:00  |
|  Launching a new EC2 instance: i-03a7925954e84a0c9 |  Successful |  2025-07-25T15:33:52.727000+00:00  |
|  Launching a new EC2 instance: i-02a2a409cb7ac7571 |  Successful |  2025-07-25T15:06:27.430000+00:00  |
|  Launching a new EC2 instance: i-0aaf6da5e8c30230a |  Successful |  2025-07-25T15:06:27.369000+00:00  |
+----------------------------------------------------+-------------+------------------------------------+

Load test simulation complete.
```