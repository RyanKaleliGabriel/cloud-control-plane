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