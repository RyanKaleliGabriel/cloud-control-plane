## Amazon SNS

• What if you want to send one message to many receivers?

![Image](../saa/sns.png)


## Amazon SNS

• The “event producer” only sends message to one SNS topic
• As many “event receivers” (subscriptions) as we want to listen to the SNS topic notifications
• Each subscriber to the topic will get all the messages (note: new feature to filter messages)
• Up to 12,500,000 subscriptions per topic
• 100,000 topics limit

![Image](../saa/amazonsns.png)

## SNS integrates with a lot of AWS services

• Many AWS services can send data directly to SNS for notifications

![Image](../saa/snsintergrates.png)


## Amazon SNS – How to publish

Topic Publish (using the SDK)
 - Create a topic
 - Create a subscription (or many)
 - Publish to the topic
    
Direct Publish (for mobile apps SDK)
 - Create a platform application
 - Create a platform endpoint
 - Publish to the platform endpoint
 - Works with Google GCM, Apple APNS, Amazon ADM…

## Amazon SNS – Security

Encryption
 - In-flight encryption using HTTPS API
 - At-rest encryption using KMS keys
 - Client-side encryption if the client wants to perform encryption/decryption itself

Access Controls: IAM policies to regulate access to the SNS API

SNS Access Policies (similar to S3 bucket policies)
 - Useful for cross-account access to SNS topics
 - Useful for allowing other services ( S3…) to write to an SNS topic

## SNS + SQS: Fan Out - Exam important

![Image](../saa/snsplussqs.png)

## Application: S3 Events to multiple queues - Exam important

For the same combination of: event type (e.g. object create) and prefix (e.g. images/) you can only have one S3 Event rule

If you want to send the same S3 event to many SQS queues, use fan-out

![Image](../saa/s3eventstoqueues.png)

## Application: SNS to Amazon S3 through Kinesis Data Firehose - Exam important

• SNS can send to Kinesis and therefore we can have the following
solutions architecture:

![Image](../saa/snstos3.png)

## Amazon SNS – FIFO Topic - Exam important

• FIFO = First In First Out (ordering of messages in the topic)

![Image](../saa/sqs_fifo_queue.png)

Similar features as SQS FIFO:
 - Ordering by Message Group ID (all messages in the same group are ordered)
 - Deduplication using a Deduplication ID or Content Based Deduplication

Can have SQS Standard and FIFO queues as subscribers

Limited throughput (same throughput as SQS FIFO)

## SNS FIFO + SQS FIFO: Fan Out - Exam important

• In case you need fan out + ordering + deduplication

![Image](../saa/snsvssqsfifo.png)

## SNS – Message Filtering - Exam important

• JSON policy used to filter messages sent to SNS topic’s subscriptions

• If a subscription doesn’t have a filter policy, it receives every message

![Image](../saa/snsmessage.png)




