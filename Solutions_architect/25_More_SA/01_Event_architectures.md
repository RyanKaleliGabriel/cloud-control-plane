## More Solutions Architecture

## Lambda, SNS & SQS

![Image](../saa/lambda_sns_sqs.png)

## Fan Out Pattern: deliver to multiple SQS

![Image](../saa/sqs_fan_out.png)

## S3 Event Notifications

• S3:ObjectCreated, S3:ObjectRemoved, S3:ObjectRestore, S3:Replication…

• Object name filtering possible (*.jpg)

• Use case: generate thumbnails of images uploaded to S3

• Can create as many “S3 events” as desired

• S3 event notifications typically deliver events in seconds but can sometimes take a minute or longer

![Image](../saa/s3_event_nots.png)

## S3 Event Notifications with Amazon EventBridge

![Image](../saa/s3_event_nots_with_eventbridge.png)

• Advanced filtering options with JSON rules (metadata, object size, name...)

• Multiple Destinations – ex Step Functions, Kinesis Streams / Firehose…

• EventBridge Capabilities – Archive, Replay Events, Reliable delivery


## Amazon EventBridge – Intercept API Calls

![Image](../saa/amazon_eventbridge_api_calls.png)

## API Gateway – AWS Service Integration Kinesis Data Streams example

![Image](../saa/api_gateway_kinesis.png)