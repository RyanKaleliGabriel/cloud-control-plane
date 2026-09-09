## What is Docker?

Docker is a software development platform to deploy apps

Apps are packaged in containers that can be run on any OS
Apps run the same, regardless of where they’re run
 - Any machine
 - No compatibility issues
 - Predictable behavior
 - Less work
 - Easier to maintain and deploy
 - Works with any language, any OS, any technology

Use cases: microservices architecture, lift-and-shift apps from on- premises to the AWS cloud, …

## Docker on an OS

![Image](../saa/dockeronos.png)

## Where are Docker images stored?

Docker images are stored in Docker Repositories

Docker Hub (https://hub.docker.com)
 - Public repository
 - Find base images for many technologies or OS (e.g., Ubuntu, MySQL, …)

Amazon ECR (Amazon Elastic Container Registry)
 - Private repository
 - Public repository (Amazon ECR Public Gallery https://gallery.ecr.aws)

## Docker vs. Virtual Machines

Docker is ”sort of ” a virtualization technology, but not exactly

Resources are shared with the host => many containers on one server

![Image](../saa/dockervsvms.png)

## Getting Started with Docker

![Image](../saa/gettingstartedwithdocker.png)

## Docker Containers Management on AWS

Amazon Elastic Container Service (Amazon ECS)
 - Amazon’s own container platform

Amazon Elastic Kubernetes Service (Amazon EKS)
 - Amazon’s managed Kubernetes (open source)

AWS Fargate
 - Amazon’s own Serverless container platform
 - Works with ECS and with EKS

Amazon ECR:
 - Store container images

## Amazon ECS - EC2 Launch Type

ECS = Elastic Container Service

Launch Docker containers on AWS = Launch ECS Tasks on ECS Clusters

EC2 Launch Type: you must provision & maintain the infrastructure (the EC2instances)

Each EC2 Instance must run the ECS Agent to register in the ECS Cluster

AWS takes care of starting / stopping containers

![Image](../saa/ec2_launchtype.png)

## Amazon ECS – Fargate Launch Type

• Launch Docker containers on AWS

• You do not provision the infrastructure (no EC2 instances to manage)

• It’s all Serverless!

• You just create task definitions

• AWS just runs ECS Tasks for you based on the CPU / RAM you need

• To scale, just increase the number of tasks. Simple - no more EC2 instances

![Image](../saa/ec2_fargate_launch.png)

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

![Image](../saa/ecs_iam.png)

## Amazon ECS – Load Balancer Integrations

• Application Load Balancer supported and works for most use cases

• Network Load Balancer recommended only for high throughput / high performance use cases, or to pair it with AWS Private Link

• Classic Load Balancer supported but not recommended (no advanced features – no Fargate)

![Image](../saa/ECS_LOADBALANCER.png)

## Amazon ECS – Data Volumes (EFS)

Mount EFS file systems onto ECS tasks

Works for both EC2 and Fargate launch types

Tasks running in any AZ will share the same data in the EFS file system

Fargate + EFS = Serverless

Use cases: persistent multi-AZ shared storage for your containers

Note:
 - Amazon S3 cannot be mounted as a file system

![Image](../saa/ECS_DATA_VOLUMES.png)