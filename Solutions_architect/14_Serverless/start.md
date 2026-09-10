## Serverless Overview

## What’s serverless?

• Serverless is a new paradigm in which the developers don’t have to manage servers anymore…

• They just deploy code

• They just deploy… functions !

• Initially... Serverless == FaaS (Function as a Service)

• Serverless was pioneered by AWS Lambda but now also includes anything that’s managed: “databases, messaging, storage, etc.”

• Serverless does not mean there are no servers… it means you just don’t manage / provision / see them

## Serverless in AWS
• AWS Lambda

• DynamoDB

• AWS Cognito

• AWS API Gateway

• Amazon S3

• AWS SNS & SQS

• AWS Kinesis Data Firehose

• Aurora Serverless

• Step Functions

• Fargate

![Image](../saa/serverlessaws.png)

## Why AWS Lambda

• Virtual Servers in the Cloud

• Limited by RAM and CPU

• Continuously running

• Scaling means intervention to add / remove servers

• Virtual functions – no servers to manage!

• Limited by time - short executions

• Run on-demand

• Scaling is automated!

## Benefits of AWS Lambda

Easy Pricing:
 - Pay per request and compute time
 - Free tier of 1,000,000 AWS Lambda requests and 400,000 GBs of compute time

Integrated with the whole AWS suite of services

Integrated with many programming languages

Easy monitoring through AWS CloudWatch

Easy to get more resources per functions (up to 10GB of RAM!)

Increasing RAM will also improve CPU and network!

## AWS Lambda language support

Node.js (JavaScript)

Python

Java

C# (.NET Core) / Powershell

Ruby

Custom Runtime API (community supported, example Rust or Golang)

Lambda Container Image
 - The container image must implement the Lambda Runtime API
 - ECS / Fargate is preferred for running arbitrary Docker images

## AWS Lambda Integrations Main ones

- API Gateway
- Kinesis
- DynamoDB
- S3
- CloudFront
- Cloudwatch events eventbridge
- Cloudwatch logs
- SNS
- SQS
- Cognito

## Example: Serverless Thumbnail creation

![Image](../saa/serverlessthumbnail.png)

## Example: Serverless CRON Job

![Image](../saa/serverlesscron.png)

## AWS Lambda Pricing: example

You can find overall pricing information here: https://aws.amazon.com/lambda/pricing/

Pay per calls:
 - First 1,000,000 requests are free
 - $0.20 per 1 million requests thereafter ($0.0000002 per request)

Pay per duration: (in increment of 1 ms)
 - 400,000 GB-seconds of compute time per month for FREE
 - == 400,000 seconds if function is 1GB RAM
 - == 3,200,000 seconds if function is 128 MB RAM
 - After that $1.00 for 600,000 GB-seconds

It is usually very cheap to run AWS Lambda so it’s very popular

## AWS Lambda Limits to Know - per region

Execution:
 - Memory allocation: 128 MB – 10GB (1 MB increments)
 - Maximum execution time: 900 seconds (15 minutes)
 - Environment variables (4 KB)
 - Disk capacity in the “function container” (in /tmp): 512 MB to 10GB
 - Concurrency executions: 1000 (can be increased)

Deployment:
 - Lambda function deployment size (compressed .zip): 50 MB
 - Size of uncompressed deployment (code + dependencies): 250 MB
 - Can use the /tmp directory to load other files at startup
 - Size of environment variables: 4 KB

## Lambda Concurrency and Throttling

Concurrency limit: up to 1000 concurrent executions

![Image](../saa/concurrency_lambda.png)

Can set a “reserved concurrency” at the function level (=limit)

Each invocation over the concurrency limit will trigger a “Throttle”

Throttle behavior:
 - If synchronous invocation => return ThrottleError - 429
 - If asynchronous invocation => retry automatically and then go to DLQ

If you need a higher limit, open a support ticket

## Lambda Concurrency Issue

• If you don’t reserve (=limit) concurrency, the following can happen:

![Image](../saa/lambda_concurrency_issue.png)

## Concurrency and Asynchronous Invocations

• If the function doesn't have enough concurrency available to process all events,additional requests are throttled.

• For throttling errors (429) and system errors (500-series), Lambda returns the event to the queue and attempts to run the function again for up to 6 hours.

• The retry interval increases exponentially from 1 second after the first attempt to a maximum of 5 minutes.

![Image](../saa/concurrency_asynchronous.png)

## Cold Starts & Provisioned Concurrency

Cold Start:
 - New instance => code is loaded and code outside the handler run (init)
 - If the init is large (code, dependencies, SDK…) this process can take some time.
 - First request served by new instances has higher latency than the rest

Provisioned Concurrency:
 - Concurrency is allocated before the function is invoked (in advance)
 - So the cold start never happens and all invocations have low latency
 - Application Auto Scaling can manage concurrency (schedule or target utilization)

Note:
 - Note: cold starts in VPC have been dramatically reduced in Oct & Nov 2019
 - https://aws.amazon.com/blogs/compute announcing-improved-vpc-networking-for-aws-lambda-functions/

## Reserved and Provisioned Concurrency

![Image](../saa/reserved_provisioned_concurrency.png)