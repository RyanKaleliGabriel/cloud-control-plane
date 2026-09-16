## Advanced Identity in AWS

## AWS Organizations

• Global service

• Allows to manage multiple AWS accounts

• The main account is the management account

• Other accounts are member accounts

• Member accounts can only be part of one organization

• Consolidated Billing across all accounts - single payment method

• Pricing benefits from aggregated usage (volume discount for EC2, S3…)

• Shared reserved instances and Savings Plans discounts across accounts

• API is available to automate AWS account creation

## AWS Organizations

![image](../saa/aws_organizations.png)

## Organizational Units (OU) - Examples

![Image](../saa/organizational_units.png)

## AWS Organizations

Advantages
 - Multi Account vs One Account Multi VPC
 - Use tagging standards for billing purposes
 - Enable CloudTrail on all accounts, send logs to central S3 account
 - Send CloudWatch Logs to central logging account
 - Establish Cross Account Roles for Admin purposes

Security: Service Control Policies (SCP)
 - IAM policies applied to OU or Accounts to restrict Users and Roles
 - They do not apply to the management account (full admin power)
 - Must have an explicit allow from the root through each OU in the direct path to the target account (does not allow anything by default – like IAM)

## SCP Hierarchy

![IMAGE](../saa/scp_hierarchy.png)

## SCP Examples Blocklist and Allowlist strategies

![Image](../saa/SCP_EXAMPLES.png)

## AWS Organizations – Tag Policies

• Helps you standardize tags across resources in an AWS Organization

• Ensure consistent tags, audit tagged resources, maintain proper resources categorization, …

• You define tag keys and their allowed values

• Helps with AWS Cost Allocation Tags and Attribute-based Access Control

• Prevent any non-compliant tagging operations on specified services and resources (has no effect on resources without tags)

• Generate a report that lists all tagged/non- compliant resources

• Use EventBridge to monitor non-compliant tags

![Image](../saa/organizations_tag_policies.png)

## IAM Conditions

aws:SourceIp
restrict the client IP from
which the API calls are being made

![Image](../saa/iam_conditions1.png)

aws:RequestedRegion
restrict the region the
API calls are made to

![Image](../saa/iam_conditions2.png)

## IAM Conditions

ec2:ResourceTag
restrict based on tags

![Image](../saa/iam_conditions3.png)

aws:MultiFactorAuthPresent
to force MFA

![Image](../saa/iam_conditions4.png)

## IAM for S3

• s3:ListBucket permission applies to arn:aws:s3:::test

• => bucket level permission

• s3:GetObject, s3:PutObject,s3:DeleteObject applies to arn:awn:s3:::test/*

• => object level permission

![Image](../saa/iam-for-s3.png)

## Resource Policies & aws:PrincipalOrgID

• aws:PrincipalOrgID can be used in any resource policies to restrict
access to accounts that are member of an AWS Organization

![IMAGE](../saa/resource_policies_principlaorgid.png)

## IAM Roles vs Resource Based Policies

Cross account:
 - attaching a resource-based policy to a resource (example: S3 bucket policy)
 - OR using a role as a proxy

![Image](../saa/iam_roles_vs_resource_based_policies.png)

## IAM Roles vs Resource-Based Policies

• When you assume a role (user, application or service), you give up your original permissions and take the permissions assigned to the role

• When using a resource-based policy, the principal doesn’t have to give up his permissions

• Example: User in account A needs to scan a DynamoDB table in Account A and dump it  in an S3 bucket in Account B.

• Supported by: Amazon S3 buckets, SNS topics, SQS queues, etc…

## Amazon EventBridge – Security

• When a rule runs, it needs permissions on the target

• Resource-based policy: Lambda, SNS, SQS, S3 buckets, API Gateway…

• IAM role: EC2 Auto Scaling, Systems Manager Run Command, ECS task…

![Image](../saa/eventbridge_security.png)

## IAM Permission Boundaries

• IAM Permission Boundaries are supported for users and roles (not groups)

• Advanced feature to use a managed policy to set the maximum permissions an IAM entity can get.

![Image](../saa/iam_permissions_boundaries.png)

## IAM Permission Boundaries

• Can be used in combinations of AWS Organizations SCP

![Image](../saa/iam_permissions_boundaries2.png)

Use cases

• Delegate responsibilities to non administrators within their permission boundaries, for example create new IAM users

• Allow developers to self-assign policies and manage their own permissions, while making sure they can’t “escalate” their privileges (= make themselves admin)

• Useful to restrict one specific user (instead of a whole account usingOrganizations & SCP)

## IAM Policy Evaluation Logic

![Image](../saa/iam_policy-evaluation_logic.png)

## Example IAM Policy

• Can you perform sqs:CreateQueue?

• Can you perform sqs:DeleteQueue?

• Can you perform ec2:DescribeInstances?

![Image](../saa/example_iam_policy.png)

## AWS IAM Identity Center (successor to AWS Single Sign-On)

One login (single sign-on) for all your
 - AWS accounts in AWS Organizations
 - Business cloud applications (e.g., Salesforce, Box, Microsoft 365, …)
 - SAML2.0-enabled applications
 - EC2 Windows Instances

Identity providers
 - Built-in identity store in IAM Identity Center
 - 3rd party: Active Directory (AD), OneLogin, Okta…

## AWS IAM Identity Center – Login Flow

![Image](../saa/iam_login_flow.png)

## AWS IAM Identity Center

![Image](../saa/iam_identity_center.png)

## IAM Identity Center

![Image](../saa/iam_identity_center2.png)

## AWS IAM Identity Center Fine-grained Permissions and Assignments

Multi-Account Permissions
- Manage access across AWS accounts in your AWS Organization
- Permission Sets – a collection of one or more IAM Policies assigned to users and groups to define AWS access

Application Assignments
 - SSO access to many SAML 2.0 business applications (Salesforce, Box, Microsoft 365, …)
- Provide required URLs, certificates, and metadata

Attribute-Based Access Control (ABAC)
 - Fine-grained permissions based on users’ attributes stored in IAM Identity Center Identity Store
 - Example: cost center, title, locale, …
 - Use case: Define permissions once, then modify AWS access by changing the attributes

![Image](../saa/fine-grained_iam_identity_center.png)

## What is Microsoft Active Directory (AD)?

• Found on any Windows Server with AD Domain Services

• Database of objects: User Accounts, Computers, Printers, File Shares, Security Groups

• Centralized security management, create account, assign permissions

• Objects are organized in trees

• A group of trees is a forest

![Image](../saa/microsoft_ad.png)

## AWS Directory Services

AWS Managed Microsoft AD
 - Create your own AD in AWS, manage users locally, supports MFA
 - Establish “trust” connections with your on-premises AD

AD Connector
 - Directory Gateway (proxy) to redirect to on-premises AD, supports MFA
 - Users are managed on the on-premises AD

Simple AD
 - AD-compatible managed directory on AWS
 - Cannot be joined with on-premises AD

![Image](../saa/aws_directory_services.png)

## IAM Identity Center – Active Directory Setup

Connect to an AWS Managed Microsoft AD (Directory Service)
 - Integration is out of the box
 ![Image](../saa/iam_ic_ad_setup.png)

Connect to a Self-Managed Directory
 - Create Two-way Trust Relationship using AWS Managed Microsoft AD
 - Create an AD Connector
  ![Image](../saa/iam_ic_ad_setup2.png)

## AWS Control Tower

Easy way to set up and govern a secure and compliant multi-account AWS environment based on best practices

AWS Control Tower uses AWS Organizations to create accounts

Benefits:
 - Automate the set up of your environment in a few clicks
 - Automate ongoing policy management using guardrails
 - Detect policy violations and remediate them
 - Monitor compliance through an interactive dashboard

## AWS Control Tower – Guardrails

• Provides ongoing governance for your Control Tower environment (AWS Accounts)
• Preventive Guardrail – using SCPs (e.g., Restrict Regions across all your accounts)
• Detective Guardrail – using AWS Config (e.g., identify untagged resources)

![Image](../saa/control_tower_guardrails.png)

