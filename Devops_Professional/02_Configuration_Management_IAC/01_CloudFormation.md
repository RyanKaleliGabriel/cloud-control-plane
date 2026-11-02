## AWS CloudFormation

• CloudFormation is a declarative way of outlining your AWSInfrastructure, for any resources (most of them are supported)

For example, within a CloudFormation template, you say:

 - I want a security group

 - I want two EC2 instances using this security group

 - I want two Elastic IPs for these EC2 instances

 - I want an S3 bucket

 - I want a load balancer (ELB) in front of these EC2 instances

• Then CloudFormation creates those for you, in the right order, with the exact configuration that you specify

## CloudFormation – Template Example

![Image](../DPI/cf_template_example.png)

## Benefits of AWS CloudFormation (1/2)


Infrastructure as code

No resources are manually created, which is excellent for control

The code can be version controlled for example using Git

Changes to the infrastructure are reviewed through code

Cost

 - Each resources within the stack is tagged with an identifier so you can easily see how much a stack costs you

 - You can estimate the costs of your resources using the CloudFormation template

 - Savings strategy: In Dev, you could automation deletion of templates at 5 PM and recreated at 8 AM, safely

 ## Benefits of AWS CloudFormation (2/2)

Productivity

 - Ability to destroy and re-create an infrastructure on the cloud on the fly

 - Automated generation of Diagram for your templates!

 - Declarative programming (no need to figure out ordering and orchestration)

Separation of concern: create many stacks for many apps, and many layers. Ex:

 - VPC stacks

 - Network stacks

 - App stacks

Don’t re-invent the wheel

 - Leverage existing templates on the web!

 - Leverage the documentation

## How CloudFormation Works


Templates must be uploaded in S3 and then referenced in CloudFormation

To update a template, we can’t edit previous ones. We have to re- upload a new version of the template to AWS

Stacks are identified by a name

Deleting a stack deletes every single artifact that was created by CloudFormation.

![Image](../DPI/cf_works.png)

## Deploying CloudFormation Templates

Manual way
 
 - Editing templates in Infrastructure Composer or code editor
 
 - Using the console to input parameters, etc…
 
 - We’ll mostly do this way in the course for learning purposes

Automated way
 
 - Editing templates in a YAML file
 
 - Using the AWS CLI (Command Line Interface) to deploy the templates, or using a Continuous Delivery (CD) tool
 
 - Recommended way when you fully want to automate your flow

 ![Image](../DPI/cf_templates.png)

## CloudFormation – Building Blocks

Template’s Components
 
 - AWSTemplateFormatVersion – identifies the capabilities of the template “2010-09-09”
 
 - Description – comments about the template
 
 - Resources (MANDATORY) – your AWS resources declared in the template
 
 - Parameters – the dynamic inputs for your template
 
 - Mappings – the static variables for your template
 
 - Outputs – references to what has been created
 
 - Conditionals – list of conditions to perform resource creation

Template’s Helpers
 
 - References
 
 - Functions

## Introductory Example

• We’re going to create a simple EC2 instance

• And we’re going to add security group to it

• For now, forget about the code syntax

• We’ll look at the structure of the files later

• We’ll see how in no-time, we are able to get started with CloudFormation!

![Image](../DPI/cf_intro_example.png)

## YAML Crash Course

• YAML and JSON are the languages you canuse for CloudFormation

• JSON is horrible for CF

• YAML is great in so many ways

• Let’s learn a bit about it!

• Key value Pairs

• Nested objects

• Support Arrays

• Multi line strings

• Can include comments!

![Image](../DPI/yaml_crash_course.png)

## CloudFormation – Resources

• Resources are the core of your CloudFormation template (MANDATORY)

• They represent the different AWS Components that will be created and configured

• Resources are declared and can reference each other

• AWS figures out creation, updates and deletes of resources for us

• There are over 700 types of resources (!)

Resource types identifiers are of the form:
 - service-provider::service-name::data-type-name

## How do I find Resources documentation?

• I can’t teach you all the 700+ resources, but I can teach you how to learn how to use them

• All the resources can be found here: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/a ws-template-resource-type-ref.html

• Then, we just read the docs J

• Example here (for an EC2 instance): https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-instance.html

## Analysis of CloudFormation Template

• Going back to the example of the introductory lecture, let’s learn why it was written this way.

Relevant documentation can be found here:
 - https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws- resource-ec2-instance.html
 
 - https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws- resource-ec2-securitygroup.html
 
 - http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-eip.html

## CloudFormation – Resources FAQ

Can I create a dynamic number of resources?
 - Yes, you can by using CloudFormation Macros and Transform

 - It is not in the scope of this course

Is every AWS Service supported?
 - Almost. Only a select few niches are not there yet

 - You can work around that using CloudFormation Custom Resources

## CloudFormation – Parameters

• Parameters are a way to provide inputs to your AWS CloudFormation template

They’re important to know about if:
 - You want to reuse your templates across the company
 - Some inputs can not be determined ahead of time

• Parameters are extremely powerful, controlled, and can prevent errors from happening in your templates, thanks to types

![Imae](../DPI/cf_parameters.png)

## When should you use a Parameter?

![Image](../DPI/cf_params_2.png)

Ask yourself this:
 - Is this CloudFormation resource configuration likely to change in the future?
 - If so, make it a parameter

You won’t have to re-upload a template to change its content 

## CloudFormation – Parameters Settings

• Parameters can be controlled by all these settings:

Type:
 - String
 - Number
 - CommaDelimitedList
 - List<Number>
 - AWS-Specific Parameter (to help catch invalid values – match against existing values in the AWS account)
 - List<AWS-Specific Parameter>
 - SSM Parameter (get parameter value from SSM Parameter store)

• Description

• ConstraintDescription (String)

• Min/MaxLength

• Min/MaxValue

• Default

• AllowedValues (array)

• AllowedPattern (regex)

• NoEcho (Boolean)

## CloudFormation – Parameters Example

![Image](../DPI/cf_paramas_example.png)

## How to Reference a Parameter?

![Image](../DPI/how_to_reference_a_param.png)

## CloudFormation – Pseudo Parameters

• AWS offers us Pseudo Parameters in any CloudFormation template

• These can be used at any time and are enabled by default

• Important pseudo parameters:

![Image](../DPI/pseudo_params.png)

## CloudFormation – Mappings

• Mappings are fixed variables within your CloudFormation template

• They’re very handy to differentiate between different environments (dev vs prod) regions (AWS regions), AMI types…

• All the values are hardcoded within the template

![Image](../DPI/cf_mappings.png)

## Accessing Mapping Values (Fn::FindInMap)

• We use Fn::FindInMap to return a named value from a specific key

• !FindInMap [ MapName, TopLevelKey, SecondLevelKey ]

![Image](../DPI/accessing_mapping_values.png)

## When would you use Mappings vs. Parameters?

Mappings are great when you know in advance all the values that can be taken and that they can be deduced from variables such as
 
 - Region
 
 - Availability Zone
 
 - AWS Account
 
 - Environment (dev vs prod)
 
 - etc…


• They allow safer control over the template

• Use parameters when the values are really user specific

## CloudFormation – Outputs

• The Outputs section declares optional outputs values that we can import into other stacks (if you export them first)!

• You can also view the outputs in the AWS Console or in using the AWS CLI

• They’re very useful for example if you define a network CloudFormation, and output the variables such as VPC ID and your Subnet IDs

• It’s the best way to perform some collaboration cross stack, as you let expert handle their own part of the stack

![Image](../DPI/cf_outputs.png)

## CloudFormation – Outputs

• Creating a SSH Security Group as part of one template

• We create an output that references that security group

![Image](../DPI/cf_oututs2.png)

## CloudFormation – Outputs Cross-Stack Reference

• We then create a second template that leverages that security group

• For this, we use the Fn::ImportValue function

• You can’t delete the underlying stack until all the references are deleted

![Image](../DPI/cf_outputs_coss_stack.png)

## CloudFormation – Conditions

Conditions are used to control the creation of resources or outputs based on a condition

Conditions can be whatever you want them to be, but common ones are:
 
 - Environment (dev / test / prod)
 
 - AWS Region
 
 - Any parameter value

![Image](../DPI/cf_conditions.png)

## How to define a Condition

![Image](../DPI/how_to_define__a_condition.png)

The logical ID is for you to choose. It’s how you name condition

The intrinsic function (logical) can be any of the following:

-  Fn::And

-  Fn::Equals

-  Fn::If

-  Fn::Not

-  Fn::Or

## How to use a Condition

• Conditions can be applied to resources / outputs / etc…

![Image](../DPI/how_to_use_a_condition.png)

## CloudFormation – Intrinsic Functions


Ref

Fn::Base64

Fn::GetAtt

Fn::Cidr

Fn::FindInMap

Fn::GetAZs

Fn::ImportValue

Fn::Select

Fn::Join

Fn::Split

Fn::Sub

Fn::Transform

Fn::ForEach

Fn::Length

Fn::ToJsonString

Condition Functions (Fn::If, Fn::Not, Fn::Equals, etc…)

## Intrinsic Functions – Fn::Ref

The Fn::Ref function can be leveraged to reference
 
 - Parameters – returns the value of the parameter
 
 - Resources – returns the physical ID of the underlying resource (e.g., EC2 ID)

The shorthand for this in YAML is !Ref

![Image](../DPI/intrinsic_function.png)

## Intrinsic Functions – Fn::GetAtt

• Attributes are attached to any resources you create

• To know the attributes of your resources, the best place to look at is the documentation

• Example: the public DNS name of an EC2 instance!

![Image](../DPI/intrinsic_function2.png)

## Intrinsic Functions – Fn::FindInMap

• We use Fn::FindInMap to return a named value from a specific key

• !FindInMap [ MapName, TopLevelKey, SecondLevelKey ]

![Image](../DPI/intrinsic_function3.png)

## Intrinsic Functions – Fn::ImportValue

• Import values that are exported in other stacks

• For this, we use the Fn::ImportValue function

![Image](../DPI/intrinsic_function4.png)

## Intrinsic Functions – Fn::Base64

• Convert String to it’s Base64 representation

![Imafe](../DPI/intrinsic_function5.png)

• Example: pass encoded data to EC2 Instance’s UserData property

![Image](../DPI/intrinsic_function6.png)

## Intrinsic Functions – Condition Functions

![Image](../DPI/intrinsic_function7.png)

• The logical ID is for you to choose. It’s how you name condition

The intrinsic function (logical) can be any of the following:

- Fn::And

- Fn::Equals

- Fn::If

- Fn::Not

- Fn::Or

## CloudFormation – Rollbacks

Stack Creation Fails:
 - Default: everything rolls back (gets deleted). We can look at the log
 - Option to disable rollback and troubleshoot what happened

Stack Update Fails:
 - The stack automatically rolls back to the previous known working state
 - Ability to see in the log what happened and error messages

Rollback Failure? Fix resources manually then issue ContinueUpdateRollback API from Console
 - Or from the CLI using continue-update-rollback API call

## CloudFormation – Service Role

IAM role that allows CloudFormation to create/update/delete stack resources on your behalf

Give ability to users to create/update/delete the stack resources even if they don’t have permissions to work with the resources in the stack

Use cases:
 
 - You want to achieve the least privilege principle
 
 - But you don’t want to give the user all the required permissions to create the stack resources

• User must have iam:PassRole permissions

![Image](../DPI/cf_service_role.png)

## CloudFormation Capabilities

CAPABILITY_NAMED_IAM and CAPABILITY_IAM

 - Necessary to enable when you CloudFormation template is creating or updating IAM resources (IAM User, Role, Group, Policy, Access Keys, Instance Profile…)

 - Specify CAPABILITY_NAMED_IAM if the resources are named

CAPABILITY_AUTO_EXPAND

 - Necessary when your CloudFormation template includes Macros or Nested Stacks (stacks within stacks) to perform dynamic transformations

 - You’re acknowledging that your template may change before deploying

InsufficientCapabilitiesException

 - Exception that will be thrown by CloudFormation if the capabilities haven’t been acknowledged when deploying a template (security measure)

## CloudFormation – DeletionPolicy Delete

DeletionPolicy:
 - Control what happens when the CloudFormation template is deleted or when a resource is removed from a CloudFormation template
 - Extra safety measure to preserve and backup resources

Default DeletionPolicy=Delete
 - Delete won’t work on an S3 bucket if the bucket is not empty

![IMAGE](../DPI/cf_deletionpolicy.png)

## CloudFormation – DeletionPolicy Retain

DeletionPolicy=Retain:
 - Specify on resources to preserve in case of CloudFormation deletes

Works with any resources

![Image](../DPI/cf_deletionpolicy_retain.png)

## CloudFormation – DeletionPolicy Snapshot

• DeletionPolicy=Snapshot

• Create one final snapshot before deleting the resource

Examples of supported resources:

- EBS Volume, ElastiCache Cluster, ElastiCache ReplicationGroup

- RDS DBInstance, RDS DBCluster, Redshift Cluster, Neptune DBCluster, DocumentDB DBCluster

![Image](../DPI/cf_deletionpolicy_snapshot.png)

## CloudFormation – Stack Policies

• During a CloudFormation Stack update, all update actions are allowed on all resources (default)
• A Stack Policy is a JSON document that defines the update actions that are allowed on specific resources during Stack updates

• Protect resources from unintentional updates

• When you set a Stack Policy, all resources in the Stack are protected by default

• Specify an explicit ALLOW for the resources you want to be allowed to be updated

![Image](../DPI/cf_stackpolicies.png)

## CloudFormation – Termination Protection

• To prevent accidental deletes of CloudFormation Stacks, use TerminationProtection

## CloudFormation – Custom Resources

Used to
 
 - define resources not yet supported by CloudFormation
 
 - define custom provisioning logic for resources can that be outside of CloudFormation (on-premises resources, 3rd party resources…)
 
 - have custom scripts run during create / update / delete through Lambda functions (running a Lambda function to empty an S3 bucket before being deleted)

• Defined in the template using AWS::CloudFormation::CustomResource or Custom::MyCustomResourceTypeName (recommended)

• Backed by a Lambda function (most common) or an SNS topic

## How to define a Custom Resource?

• ServiceToken specifies where CloudFormation sends requests to, such as Lambda ARN or SNS ARN (required & must be in the same region)

• Input data parameters (optional)

![Image](../DPI/custom_resource.png)

## Use Case – Delete content from an S3 bucket

• You can’t delete a non-empty S3 bucket

• To delete a non-empty S3 bucket, you must first delete all the objects inside it

• We can use a custom resource to empty an S3 bucket before it gets deleted by CloudFormation

![Image](../DPI/delete_from_s3.png)

## Custom Resources – How does it work?

![Image](../DPI/custom_resources_how_does_it_work.png)

## Hands-On: Lambda-backed Custom Resource

• You can’t delete a non-empty S3 bucket

• To delete a non-empty S3 bucket, you must first delete all the objects inside it

• We’ll create a custom resource with AWS Lambda that will be used to empty an S3 bucket before deleting it

• Let’s create our first Custom Resource!

![Image](../DPI/lambda_custom_resource.png)

## CloudFormation – Dynamic References

• Reference external values stored in Systems Manager Parameter Store and Secrets Manager within CloudFormation templates

• CloudFormation retrieves the value of the specified reference during create/update delete operations

• For example: retrieve RDS DB Instance master password from Secrets Manager

Supports
 - ssm – for plaintext values stored in SSM Parameter Store
 - ssm-secure – for secure strings stored in SSM Parameter Store
 - secretsmanager – for secret values stored in Secrets Manager
  ‘{{resolve:service-name:reference-key}}’

![Image](../DPI/cf_dynamic_ref.png)

## CloudFormation – Dynamic References

![Image](../DPI/cf_dynamic_ref2.png)

## CloudFormation, Secrets Manager & RDS Option 1 – ManageMasterUserPassword

• ManageMasterUserPassword – creates admin secret implicitly

• RDS, Aurora will manage the secret in Secrets Manager and its rotation

![Image](../DPI/cf_secrets_rds.png)

## CloudFormation, Secrets Manager & RDS Option 2 – Dynamic Reference

![Image](../DPI/cf_secrets_rds2.png)

## User Data in EC2 for CloudFormation

• We can have user data at EC2 instance launch through the console

• Let’s learn how to write the same EC2 user-data script in our CloudFormation template

• The important thing to pass is the entire script through the function Fn::Base64

• Good to know, user data script log is in /var/log/cloud-init-output.log

• Let’s see how to do this in CloudFormation!

## The Problems with EC2 User Data

• What if we want to have a very large instance configuration?

• What if we want to evolve the state of the EC2 instance without terminating it and creating a new one?

• How do we make EC2 user-data more readable?

• How do we know or signal that our EC2 user-data script completed successfully?

Enter CloudFormation Helper Scripts!
 - Python scripts, that come directly on Amazon Linux AMIs, or can be installed using yum or dnf on non-Amazon Linux AMIs
 - cfn-init, cfn-signal, cfn-get-metadata, cfn-hup

## AWS::CloudFormation::Init

• A config contains the following and is executed in that order
 
 - Packages: used to download and install pre-packaged apps and components on Linux Windows (ex. MySQL, PHP, etc…)
 
 - Groups: define user groups
 
 - Users: define users, and which group they belong to
 
 - Sources: download files and archives and place them on the EC2 instance
 
 - Files: create files on the EC2 instance, using inline or can be pulled from a URL
 
 - Commands: run a series of commands
 
 - Services: launch a list of sysvinit

![Image](../DPI/cf_init.png)

## CloudFormation – cfn-init

• Used to retrieve and interpret the resource metadata, installing packages, creating files and starting services

• With the cfn-init script, it helps make complex EC2 configurations readable

• The EC2 instance will query the CloudFormation service to get init data

• AWS::CloudFormation::Init must be in the Metadata of a resource

• Logs go to /var/log/cfn-init.log

![Image](../DPI/cf_cfn_init.png)

## CloudFormation – cfn-signal & Wait Conditions

• We still don’t know how to tell CloudFormation that the EC2 instance got properly configured after a cfn-init
• For this, we can use the cfn-signal script!
• We run cfn-signal right after cfn-init
• Tell CloudFormation service that the resource creation success/fail
to keep on going or fail
• We need to define WaitCondition:
• Block the template until it receives a signal from cfn-signal
• We attach a CreationPolicy (also works on EC2, ASG)
• We can define a Count > 1 (in case you need more than 1 signal)

![Image](../DPI/cf_cfn_signal_wait.png)

## Wait Condition Didn't Receive the Required Number of Signals from an Amazon EC2 Instance

• Ensure that the AMI you're using has the AWS CloudFormation helper scripts installed. If the AMI doesn't include the helper scripts, you can also download them to your instance

• Verify that the cfn-init & cfn-signal command was successfully run on the instance. You can view logs, such as /var/log cloud-init.log or /var/log/cfn-init.log, to help you debug the instance launch

• You can retrieve the logs by logging in to your instance, but you must disable rollback on failure or else AWS CloudFormation  deletes the instance after your stack fails to create

• Verify that the instance has a connection to the Internet. If the instance is in a VPC, the instance should be able to connect to the Internet through a NAT device if it's is in a private subnet or through an Internet gateway if it's in a public subnet

• For example, run: curl -I https://aws.amazon.com

## CloudFormation – Nested Stacks

• Nested stacks are stacks as part of other stacks

• They allow you to isolate repeated patterns / common components in separate stacks and call them from other stacks

Example:
 
 - Load Balancer configuration that is re-used
 
 - Security Group that is re-used
• Nested stacks are considered best practice

• To update a nested stack, always update the parent (root stack)

• Nested stacks can have nested stacks themselves!

![Image](../DPI/cf_nested_stacks.png)

## Cross Stacks vs. Nested Stacks

Cross Stacks

 - Helpful when stacks have different lifecycles

 - Use Outputs Export and Fn::ImportValue

 - When you need to pass export values to many stacks (VPC Id…)

Nested Stacks
 - Helpful when components must be re-used

 - Example: re-use how to properly configure an Application Load Balancer

 - The nested stack only is important to the higher-level stack (it’s not shared)

![Image](../DPI/cross_stacks_nested_stacks.png)

## CloudFormation – DependsOn

Specify that the creation of a specific resource follows another

When added to a resource, that resource is created only after the creation of the resource specified in the DependsOn attribute

Applied automatically when using !Ref and !GetAtt

Use with any resource

![Image](../DPI/cf_depends_on.png)

## CloudFormation – StackSets

• Create, update, or delete stacks across multiple accounts and regions with a single operation/template

• Administrator account to create StackSets

• Target accounts to create, update, delete stack instances from StackSets

• When you update a stack set, all associated stack instances are updated throughout all accounts and regions

• Can be applied into all accounts of an AWS organizations

![Image](../DPI/cf_stacksets.png)

## CloudFormation – StackSets Permission Models

Self-managed Permissions
 
 - Create the IAM roles (with established trusted relationship) in both administrator and target accounts
 
 - Deploy to any target account in which you have permissions to create IAM role

Service-managed Permissions
 
 - Deploy to accounts managed by AWS Organizations
 
 - StackSets create the IAM roles on your behalf (enable trusted access with AWS Organizations)
 
 - Must enable all features in AWS Organizations
 
 - Ability to deploy to accounts added to your organization in the future (Automatic Deployments)

![Image](../DPI/cf_stacksets_permission_models.png)

## StackSets with AWS Organizations

• Ability to automatically deploy Stack instances to new Accounts in an Organization

• Can delegate StackSets administration to member accounts in AWS Organization

• Trusted access with AWS Organizations must be enabled before delegated administrators can deploy to accounts managed by Organizations

## StackSets with AWS Organizations

![Image](../DPI/stacksets_aws_organizations.png)

## Hands-On: StackSets

• We’ll use StackSets to enable AWS Config across AWS regions with a single click

• Let’s see how this works!

![Image](../DPI/hands-on-stacksets.png)

## CloudFormation – Troubleshooting

DELETE_FAILED

 • Some resources must be emptied before deleting, such as S3 buckets

 • Use Custom Resources with Lambda functions to automate some actions

 • Security Groups cannot be deleted until all EC2 instances in the group are gone

 • Think about using DeletionPolicy=Retain to skip deletions

UPDATE_ROLLBACK_FAILED

 • Can be caused by resources changed outside of CloudFormation, insufficient permissions, Auto Scaling Group that doesn’t receive enough signals…

 • Manually fix the error and then ContinueUpdateRollback

## CloudFormation – StackSet Troubleshooting

A stack operation failed, and the stack instance status is OUTDATED.
 
 - Insufficient permissions in a target account for creating resources that are specified in your template.
 
 - The template could be trying to create global resources that must be unique but aren't, such as S3 buckets
 
 - The administrator account does not have a trust relationship with the target account
 
 - Reached a limit or a quota in the target account (too many resources)

## CloudFormation – Troubleshooting

• You can’t set EC2 instance private DNS name in a CloudFormation template (there’s no PrivateDnsName attribute)
 - Or anything else you wouldn’t be able to set through the AWS Console

If your CloudFormation template works in one Region and doesn’t work in
another Region:
 
 - Check if AWS services in the template are available in this Region
 
 - Check AMI IDs (AMIs are regional)
 
 - Check hardcoded region-specific values (e.g., ARNs)
 
 - Check unique names for resources that require it (e.g., S3 bucket names are globally unique)

## CloudFormation – ChangeSets

• When you update a stack, you need to know what changes will happen before it applying them for greater confidence

• ChangeSets won’t say if the update will be successful

• For Nested Stacks, you see the changes across all stacks

![Image](../DPI/cf_changesets.png)

## cfn-hup

• Can be used to tell your EC2 instance to look for Metadata changes every 15 minutes and apply the Metadata configuration again

• It’s very powerful but you really need to try it out to understand how it works

• It relies on a cfn-hup configuration, see /etc/cfn/cfn- hup.conf and /etc/cfn/hooks.d/cfn-auto-reloader.conf

![Image](../DPI/cf-hub.png)

## CloudFormation – Drift

• CloudFormation allows you to create infrastructure

• But it doesn’t protect you against manual configuration changes

• How do we know if our resources have drifted?

• We can use CloudFormation Drift!

• Detect drift on an entire stack or on individual resources within a stack

![Image](../DPI/cf_drift.png)

## StackSet Drift Detection

• Performs drift detection on the stack associated with each stack instance in the StackSet

If the current state of a resource in a stack varies from the expected state:
 
 - The stack considered drifted
 
 - And the stack instance that the stack associated with considered drifted
 
 - And the StackSet is considered drifted

• Drift detection identifies unmanaged changes (outside CloudFormation)

• Changes made through CloudFormation to a stack directly (not at the StackSet level), aren’t considered drifted

• You can stop drift detection on a StackSet

![Image](../DPI/stackset_drift_detection.png)

## AWS Service Catalog

• Users that are new to AWS have too many options, and may create stacks that are not compliant / in line with the rest of the organization

• Some users just want a quick self-service portal to launch a set of authorized products pre-defined by admins

• Includes: virtual machines, databases, storage options, etc…

• Enter AWS Service Catalog!

## Service Catalog diagram

![Image](../DPI/service_catalog_diagram.png)

## AWS Service Catalog


• Create and manage catalogs of IT services that are approved on AWS

• The “products” are CloudFormation templates

• Ex: Virtual machine images, Servers, Software, Databases, Regions, IP address ranges

• CloudFormation helps ensure consistency, and standardization by Admins

• They are assigned to Portfolios (teams)

• Teams are presented a self-service portal where they can launch the products

• All the deployed products are centrally managed deployed services

• Helps with governance, compliance, and consistency

• Can give user access to launching products without requiring deep AWS knowledge

• Integrations with “self-service portals” such as ServiceNow

## Service Catalog – Stack Set Constraints

• Allows you to configure Product deployment options using CloudFormation StackSets

• Accounts – identify AWS accounts where you want to create Products

• Regions – identify AWS regions where you want to deploy to (with Order)

• Permissions – IAM StackSet Administrator Role to manage target AWS accounts

![ImAGE](../DPI/service_catalog_stackset_constraints.png)

## Service Catalog – Launch Constraints

IAM Role assigned to a Product which allows a user to launch, update, or terminate a product with minimal IAM permissions

Example: end user has access only to Service Catalog, all other permissions required are attached to the Launch Constraint IAM Role IAM Role must have the following permissions:
 - CloudFormation (Full Access)

 - AWS Services in the CloudFormation template

 - S3 Bucket which contains the CloudFormation template (Read Access)

 ## Service Catalog – Continuous Delivery Pipeline (Syncing with CodeCommit)

 ![Image](../DPI/sc_cd_pipeline.png)