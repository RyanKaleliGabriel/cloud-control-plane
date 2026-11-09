## Amazon ECS - EC2 Launch Type

• ECS = Elastic Container Service

• Launch Docker containers on AWS = Launch ECS Tasks on ECS Clusters

• EC2 Launch Type: you must provision & maintain the infrastructure (the EC2 instances)

• Each EC2 Instance must run the ECS Agent to register in the ECS Cluster

• AWS takes care of starting / stopping containers

![Image](../DPI/ecs_ec2.png)

## Amazon ECS – Fargate Launch Type

• Launch Docker containers on AWS

• You do not provision the infrastructure (no EC2 instances to manage)

• It’s all Serverless!

• You just create task definitions

• AWS just runs ECS Tasks for you based on the CPU / RAM you need

• To scale, just increase the number of tasks. Simple - no more EC2 instances

![Image](../DPI/ecs_fargate_launch_type.png)

## Amazon ECS – IAM Roles for ECS

EC2 Instance Profile (EC2 Launch Type only):
 
 - Used by the ECS agent
 
 - Makes API calls to ECS service
 
 - Send container logs to CloudWatch Logs
 
 - Pull Docker image from ECR
 
 - Reference sensitive data in Secrets Manager or SSM Parameter Store

ECS Task Role:
 
 - Allows each task to have a specific role
 
 - Use different roles for the different ECS Services you run
 
 - Task Role is defined in the task definition

![Image](../DPI/ecs_iam_roles_ecs.png)

## Amazon ECS – Load Balancer Integrations

• Application Load Balancer supported and works for most use cases

• Network Load Balancer recommended only for high throughput / high performance use cases, or to pair it with AWS Private Link

• Classic Load Balancer supported but not recommended (no advanced features – no Fargate)

![Image](../DPI/ecs_load_balancer_integrations.png)

## Amazon ECS – Data Volumes (EFS)

• Mount EFS file systems onto ECS tasks

• Works for both EC2 and Fargate launch types

• Tasks running in any AZ will share the same data in the EFS file system

• Fargate + EFS = Serverless

• Use cases: persistent multi-AZ shared storage for your containers

![Image](../DPI/ecs_data_volumes.png)

## Amazon ECS – Data Volumes (S3 Files)

• Mount S3 Files file systems onto ECS tasks (S3 bucket exposed as a file system)

• Works for Fargate and ECS Managed Instances (EC2 launch type is NOT supported)

• Changes sync automatically to the S3 bucket

• Use cases: containers needing shared file access to data that already lives in S3

![Image](../DPI/ecs_data_volumes_s3.png)

## ECS Service Auto Scaling

Automatically increase/decrease the desired number of ECS tasks

Amazon ECS Auto Scaling uses AWS Application Auto Scaling
 - ECS Service Average CPU Utilization
 - ECS Service Average Memory Utilization - Scale on RAM
 - ALB Request Count Per Target – metric coming from the ALB

Target Tracking – scale based on target value for a specific CloudWatch metric

Step Scaling – scale based on a specified CloudWatch Alarm

Scheduled Scaling – scale based on a specified date/time (predictable changes)

ECS Service Auto Scaling (task level) ≠ EC2 Auto Scaling (EC2 instance level)

Fargate Auto Scaling is much easier to setup (because Serverless)

## EC2 Launch Type – Auto Scaling EC2 Instances

Accommodate ECS Service Scaling by adding underlying EC2 Instances

Auto Scaling Group Scaling
 - Scale your ASG based on CPU Utilization
 - Add EC2 instances over time

ECS Cluster Capacity Provider
 - Used to automatically provision and scale the infrastructure for your ECS Tasks
 - Capacity Provider paired with an Auto Scaling Group
 - Add EC2 Instances when you’re missing capacity (CPU, RAM…)

## ECS Scaling – Service CPU Usage Example

![Image](../DPI/ecs_scaling_service_cpu.png)

## ECS tasks invoked by Event Bridge

![Image](../DPI/ecs_tasks_inoked_eb.png)

## ECS tasks invoked by Event Bridge Schedule

![Image](../DPI/ecs_tasks_eb2.png)

## ECS – SQS Queue Example

![Image](../DPI/ecs-sqs-queue-example.png)

## ECS – Intercept Stopped Tasks using EventBridge

![Image](../DPI/ecs-intercept-stopped-tasks.png)

## ECS – Logging with “awslogs” driver

• Containers can send application logs directly to CloudWatch Logs

• You need to turn on awslogs log driver (for CW Logs)

• Configure logConfiguration parameters in your Task Definition

Fargate Launch Type
 - Task Execution Role must have the required permissions
 - Supports awslogs, splunk, awsfirelens log drivers

EC2 Launch Type
 - Prevents logs from taking up disk space on your container EC2 instances
 - Uses CloudWatch Unified Agent & ECS Container Agent
 - Enable logging using ECS_AVAILABLE_LOGGING_DRIVERS in /etc/ecs/ecs.config
 - Container EC2 instances must have permissions

![Image](../DPI/ecs_logging_with_advisors.png)

## ECS – Logging with Sidecar Container

Using a sidecar container which is responsible for collecting logs from all other containers and files on the file system and send the logs to a log storage (e.g., CloudWatch Logs)

![Image](../DPI/ecs_logging_with_sidecar_container.png)