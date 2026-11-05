## AWS Systems Manager Overview


• Helps you manage your EC2 and On-Premises systems at scale

• Get operational insights about the state of your infrastructure

• Easily detect problems

• Patching automation for enhanced compliance

• Works for both Windows and Linux OS

• Integrated with CloudWatch metrics / dashboards

• Integrated with AWS Config

• Free service

## AWS Systems Manager Features

Node Tools
 
 - Fleet Manager
 
 - Compliance
 
 - Inventory
 
 - Hybrid Activations
 
 - Session Manager
 
 - Run Command
 
 - State Manager
 
 - Patch Manager
 
 - Distributer

Change Management

 - Automation

 - Change Calendar

 - Maintenance Windows

 - Documents

 - Quick Setup

Application Tools
 - Application Manager
 - AppConfig
 - Parameter Store
 - Resource Groups

Operations Tools
 
 - Explorer
 
 - OpsCenter
 
 - CloudWatch Dashboard

## How Systems Manager works

• We need to install the SSM agent onto the systems we control

• Installed by default on Amazon Linux 2 AMI & some Ubuntu AMI

• If an instance can’t be controlled with SSM, it’s probably an issue with the SSM agent!

• Make sure the EC2 instances have a proper IAM role to allow SSM actions

![Image](../DPI/system_manager_works.png)

## AWS Tags


You can add text key-value pairs called Tags to many AWS resources

Commonly used in EC2

Free naming, common tags are Name, Environment, Team …

They’re used for
 - Resource grouping
 - Automation
 - Cost allocation

Better to have too many tags than too few!

## Resource Groups

Create, view or manage logical group of resources thanks to tags

Allows creation of logical groups of resources such as
 - Applications
 - Different layers of an application stack
 - Production versus development environments

• Regional service

• Works with EC2, S3, DynamoDB, Lambda, etc…

![Image](../DPI/resource_groups.png)

## SSM – Documents

• Documents can be in JSON or YAML

• You define parameters

• You define actions

• Many documents already exist in AWS

![Image](../DPI/ssm_docs2.png)

![Image](../DPI/ssm_douments.png)

## SSM – Run Command

• Execute a document (= script) or just run a command

• Run command across multiple instances (using resource groups)

• Rate Control / Error Control

• Integrated with IAM & CloudTrail

• No need for SSH

• Command Output can be shown in the Console, sent to S3 bucket or CloudWatch Logs

• Send notifications to SNS about command statues (In progress, Success, Failed...)

• Can be invoked using EventBridge

![Image](../DPI/ssm_run_command.png)

## SSM – Automation

Simplifies common maintenance and deployment tasks of EC2 instances and other AWS resources

Example: restart instances, create an AMI, EBS snapshot
 
 - Automation Runbook
 
 - SSM Documents of type Automation
 
 - Defines actions preformed on your EC2 instances or AWS resources
 
 - Pre-defined runbooks (AWS) or create custom runbooks

Can be triggered
 
 - Manually using AWS Console, AWS CLI or SDK
 
 - By Amazon EventBridge
 
 - On a schedule using Maintenance Windows
 
 - By AWS Config for rules remediations

 ![Image](../DPI/ssm_automation.png)

## SSM Parameter Store


• Secure storage for configuration and secrets

• Optional Seamless Encryption using KMS

• Serverless, scalable, durable, easy SDK

• Version tracking of configurations / secrets

• Security through IAM

• Notifications with Amazon EventBridge

• Integration with CloudFormation

![Image](../DPI/ssm_parameter_store.png)

## SSM Parameter Store Hierarchy

![Image](../DPI/ssm_parameter_store_hierarchy.png)

• /other-department/

• /aws/reference/secretsmanager/secret_ID_in_Secrets_Manager

• /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 
(public)

## Standard and advanced parameter tiers

![Image](../DPI/standard_and_advanced_parameter_tiers.png)

## Parameters Policies (for advanced parameters)

• Allow to assign a TTL to a parameter (expiration date) to force updating or deleting sensitive data such as passwords

• Can assign multiple policies at a time

![Image](../DPI/parameter_policies.png)

## SSM – Patch Manager

• Automates the process of patching managed instances

• OS updates, applications updates, security updates...

• Supports both EC2 instances and on-premises servers

• Supports Linux, macOS, and Windows

• Patch on-demand or on a schedule using Maintenance Windows

• Scan instances and generate patch compliance report (missing patches)

• Patch compliance report can be sent to S3

## SSM – Patch Manager

Patch Baseline
 
 - Defines which patches should and shouldn’t be installed on your instances
 
 - Ability to create custom Patch Baselines (specify approved rejected patches)
 
 - Patches can be auto-approved within days of their release
 
 - By default, install only critical patches and patches related to security

Patch Group
 
 - Associate a set of instances with a specific Patch Baseline
 
 - Example: create Patch Groups for different environments (dev, test, prod)
 
 - Instances should be defined with the tag key Patch Group
 
 - An instance can only be in one Patch Group
 
 - Patch Group can be registered with only one Patch Baseline

## SSM – Patch Manager Patch Baselines

Pre-Defined Patch Baseline
 
 - Managed by AWS for different Operating Systems (can’t be modified)
 
 - AWS-RunPatchBaseline (SSM Document) – apply both operating system and application patches (Linux, macOS, Windows Server)

Custom Patch Baseline
 
 - Create your own Patch Baseline and choose which patches to auto-approve
 
 - Operating System, allowed patches, rejected patches...
 
 - Ability to specify custom and alternative patch repositories

 ## SSM – Patch Manager

 ![Image](../DPI/ssm_patch_manager.png)

## SSM – Maintenance Windows

Defines a schedule for when to perform actions on your instances

Example: OS patching, updating drivers, installing software...

Maintenance Window contains
 
 - Schedule
 
 - Duration
 
 - Set of registered instances
 
 - Set of registered tasks

## SSM – Session Manager

• Allows you to start a secure shell on your EC2 and on- premises servers

• Access through AWS Console, AWS CLI, or Session Manager SDK

• Does not need SSH access, bastion hosts, or SSH keys

• Supports Linux, macOS, and Windows

• Log connections to your instances and executed commands

• Session log data can be sent to S3 or CloudWatch Logs

• CloudTrail can intercept StartSession events

![Image](../DPI/ssm_session_manager.png)

## SSM – Session Manager

• IAM Permissions
 
 - Control which users/groups can access Session Manager and which instances
 
 - Use tags to restrict access to only specific EC2 instances
 
 - Access SSM + write to S3 + write to CloudWatch

• Optionally, you can restrict commands a user can run in a session

![Image](../DPI/ssm_session_manager2.png)

## SSH vs. SSM Session Manager

![Image](../DPI/ssh_vs_ssm.png)

## Systems Manager Default Host Management Configuration

• When enabled, it automatically configure your EC2 instances as managed instances without the use of EC2 Instance Profile

• Instance Identity Role – a type of IAM Role with no permissions beyond identifying the EC2 instance to AWS Services (e.g., Systems Manager)

• EC2 instances must have IMDSv2 enabled and SSM Agent installed (doesn’t support IMDSv1)

• Automatically enables Session Manager, Patch Manager, and Inventory

• Automatically keeps the SSM Agent up to date

• Must be enabled per AWS Region

![Image](../DPI/system_manager_default_host.png)

## Systems Manager - Hybrid Environments

• You can setup Systems Manager to manage on-premises servers, IoT devices, edge devices, and virtual machines (e.g., VMs in other cloud providers)

• In Systems Manager Console, EC2 instances use the prefix “i-" and hybrid managed nodes use the prefix “mi-”

![Image](../DPI/systems_manager_hybrid_env.png)

## Automating SSM Hybrid Activations Creation

![Image](../DPI/automating_ssm_hybrid_activations_creation.png)

## IoT Greengrass Instance Activation

• Manage IoT Greengrass Core devices using SSM

• Install SSM Agent on Greengrass Core devices (registered as a managed node in SSM)

• SSM Agent can be installed manually or deployed as a Greengrass Component (pre-built software module that you deploy directly to Greengrass Core devices)

• You must add permissions to the Token Exchange Role (IAM Role for the IoT core device) to communicate with Systems Manager

• Supports all SSM Capabilities (Patch Manager, Session Manager, Run Command...)

• Use cases: easily update and maintain OS and software updates across a fleet of Greengrass Core devices

![Image](../DPI/IOT_Greengrass_instance_activation.png)

## Systems Manager – Automation – Use Cases

![Image](../DPI/systems_manager_automation_use_cases.png)

## Systems Manager – Automation – Use Cases

![Image](../DPI/systems_manager_automation_use_cases2.png)

## Systems Manager – Automation – Use Cases

![Image](../DPI/systems_manager_automation_use_cases3.png)

## Systems Manager – Compliance

Scan your fleet of managed nodes for patch compliance and configuration inconsistencies

Displays current data about:
 - Patches in Patch Manager
 - Associations in State Manager

Can sync data to an S3 bucket using Resource Data Sync, and you can analyze using Athena and QuickSight

Can collect and aggregate data from multiple accounts and regions

Can send compliance data to Security Hub

![Image](../DPI/systems_manager_compliance.png)

## Systems Manager – OpsCenter

Allows you to view, investigate, and remediate issues in one place (no need to navigate across different AWS services)

Security issues (Security Hub), performance issues (DynamoDB throttle), failures (ASG failed launch instance)...
Reduce meantime to resolve issues

OpsItems
 - Operational issue or interruption that needs investigation and remediation
 - Event, resource, AWS Config changes, CloudTrail logs EventBridge...
 - Provides recommended Runbooks to resolve the issue

Supports both EC2 instances and on-premises managed nodes

## Systems Manager – OpsCenter

![Image](../DPI/ssm_ops_center.png)

## Systems Manager – OpsCenter – Reduce Costs by Deleting Orphaned EBS Volumes

![Image](../DPI/ssm_opscenter2.png)

## VPC Endpoint – SSM Session Manager

• Connect to EC2 instances in private subnets, without Internet access

![Image](../DPI/ssm_session_manager2.png)