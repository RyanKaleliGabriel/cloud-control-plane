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