## Amazon EventBridge (formerly CloudWatch Events)

• Schedule: Cron jobs (scheduled scripts)

![Image](../DPI/eb1.png)

• Event Pattern: Event rules to react to a service doing something

![Image](../DPI/eb2.png)

• Trigger Lambda functions, send SQS/SNS messages…

## Amazon EventBridge Rules

![Image](../DPI/eb_rules.png)

## Amazon EventBridge

![Image](../DPI/aws_eb.png)

• Event buses can be accessed by other AWS accounts using Resource-based Policies

• You can archive events (all/filter) sent to an event bus (indefinitely or set period)

• Ability to replay archived events

## Amazon EventBridge – Schema Registry

• EventBridge can analyze the events in your bus and infer the schema

• The Schema Registry allows you to generate code for your application, that will know in advance how data is structured in the event bus

• Schema can be versioned

![Image](../DPI/aws_eb_scr.png)

## Amazon EventBridge – Resource-based Policy

• Manage permissions for a specific Event Bus

• Example: allow/deny events from another AWS account or AWS region

• Use case: aggregate all events from your AWS Organization in a single AWS account or AWS region

![Image](../DPI/aws_eb_rbp.png)

## S3 Event Notifications

• S3:ObjectCreated, S3:ObjectRemoved,
S3:ObjectRestore, S3:Replication…

• Object name filtering possible (*.jpg)

• Use case: generate thumbnails of images
uploaded to S3

• Can create as many “S3 events” as desired

• S3 event notifications typically deliver events in seconds but can sometimes take a minute or longer

![Image](../DPI/s3_events_nots.png)

## S3 Event Notifications – IAM Permissions

![Image](../DPI/s3_events_nots_iamp.png)

## S3 Event Notifications with Amazon EventBridge

![Image](../DPI/s3_event_nots_with_aeb.png)

• Advanced filtering options with JSON rules (metadata, object size, name...)

• Multiple Destinations – ex Step Functions, Kinesis Streams / Firehose…

• EventBridge Capabilities – Archive, Replay Events, Reliable delivery

## Amazon S3 – Object Integrity

• S3 uses checksum to validate the integrity of uploaded objects

• Using MD5
![Image](../DPI/s3_object_integrity.png)

Using MD5 & Etag
 - ETag – represents a specific version of the object, ETag = MD5 (if SSE-S3)

![Image](../DPI/s3_object_integrity2.png)

• Other supported checksums: SHA-1, SHA-256, CRC32, CRC32C

## AWS Health Dashboard - Service History

• Shows all regions, all services health

• Shows historical information for each day

• Has an RSS feed you can subscribe to

• Previously called AWS Service Health Dashboard

![Image](../DPI/ahd_sh.png)

## AWS Health Dashboard – Your Account

• Previously called AWS Personal Health Dashboard (PHD)

• AWS Account Health Dashboard provides alerts and remediation
guidance when AWS is experiencing events that may impact you.

• While the Service Health Dashboard displays the general status of AWS services, Account Health Dashboard gives you a personalized view into the performance and availability of the AWS services underlying your AWS resources.

• The dashboard displays relevant and timely information to help you manage events in progress and provides proactive notification to help you plan for scheduled activities.

• Can aggregate data from an entire AWS Organization

## AWS Health Dashboard – Your Account

• Global service

• Shows how AWS outages directly impact you & your AWS resources

• Alert, remediation, proactive, scheduled activities

![Image](../DPI/ahd_ya.png)

## Health Event Notifications

• Use EventBridge to react to changes for AWS Health events in your AWS account

• Example: receive email notifications when EC2 instances in your AWS account are scheduled for updates

• This is possible for Account events (resources that are affected in your account)and Public Events (Regional availability of a service)

• Use cases: send notifications, capture event information, take corrective action...

![Image](../DPI/hen.png)

## AWS Health Dashboard – Examples

![Image](../DPI/aws_hd_ex.png)

## Status Checks

• Automated checks to identify hardware and software issues

System Status Checks
 - Monitors problems with AWS systems (software/hardware issues on the physical host, loss of system power, …)

 - Check Personal Health Dashboard for any scheduled critical maintenance by AWS to your instance’s host

 - Resolution: stop and start the instance (instance migrated to a new host)

Instance Status Checks
 - Monitors software/network configuration of your instance (invalid network configuration, exhausted memory, …)
 
 - Resolution: reboot the instance or change instance configuration

Attached EBS Status Checks
 - Monitors EBS volumes attached to your instance (reachable & complete I/O Operations)
 
 - Resolution: reboot the instance or replace affected EBS volumes

![Image](../DPI/status_checks.png)

## Status Checks - CW Metrics & Recovery

CloudWatch Metrics (1 minute interval)
 - StatusCheckFailed_System
 - StatusCheckFailed_Instance
 - StatusCheckFailed_AttachedEBS
 - StatusCheckFailed (for any)

Option 1: CloudWatch Alarm
 - Recover EC2 instance with the same private/public IP, EIP, metadata, and Placement Group
 - Send notifications using SNS

Option 2: Auto Scaling Group
 - Set min/max/desired 1 to recover an instance but won't keep the same private and elastic IP

![Image](../DPI/sc_cw_m_and_r.png)

![Image](../DPI/sc_cw_m_and_r2.png)