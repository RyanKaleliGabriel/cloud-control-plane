## API GATEWAY

Amazon API Gateway is a fully managed AWS service for creating, publishing, securing, and monitoring APIs (REST, HTTP, and WebSocket) at any scale. It acts as the "front door" for your backend services, such as Lambda functions, EC2, or other AWS services, handling traffic management, authentication, throttling, and request routing for you.

WebSocket: A protocol that keeps a persistent, two-way connection open between client and server, so either side can send data at any time without repeated requests.
Example: A chat app where new messages appear instantly without refreshing the page.

Throttling: Limiting how many requests a client can make in a given time to protect your backend from overload or abuse.
Example: Allowing only 100 requests per second per user; request 101 gets an HTTP 429 “Too Many Requests” error.

## Example: Building a Serverless API

![Image](../saa/serverlessapi.png)

## API Gateway - Endpoint Types

Edge-Optimized (default): For global clients
 - Requests are routed through the CloudFront Edge locations (improves latency)
 - The API Gateway still lives in only one region
 - Edge-Optimized: A global e-commerce app with customers in the US, Europe, and Asia. Requests hit the nearest CloudFront edge location, then travel to your API in one region (e.g., us-east-1), cutting latency for distant users.

Regional:
 - For clients within the same region
 - Could manually combine with CloudFront (more control over the caching strategies and the distribution)
 - Regional: A Kenyan banking app whose users are all in the same region as the API (e.g., af-south-1). You skip the extra CloudFront hop, or add your own CloudFront distribution to customize caching.

Private:
 - Can only be accessed from your VPC using an interface VPC endpoint (ENI)
 - Use a resource policy to define access
 - Private: An internal HR system used only by company servers inside your VPC. It’s reachable only through an interface VPC endpoint, with a resource policy allowing just specific VPCs or endpoints, so it’s never exposed to the internet.

## API Gateway – Security

User Authentication through
 - IAM Roles (useful for internal applications)
 - Cognito (identity for external users – example mobile users)
 - Custom Authorizer (your own logic)

Custom Domain Name HTTPS security through integration with AWS Certificate Manager (ACM)
 - If using Edge-Optimized endpoint, then the certificate must be in us-east-1
 - If using Regional endpoint, the certificate must be in the API Gateway region
 - Must setup CNAME or A-alias record in Route 53

## Step functions

## AWS Step Functions

AWS Step Functions is a serverless workflow service that chains multiple AWS services into a visual, step-by-step process, with built-in error handling and retries. 

For example, in an online order workflow, a Lambda function first validates the order, then another Lambda charges the payment, retrying up to three times if it fails. Next, the inventory is updated in DynamoDB, and finally a confirmation email is sent through SNS. If the payment still fails after all retries, the workflow jumps to a “Cancel order” step instead of leaving the process half-finished.

SO step functions just draw flow charts?

No, the flowchart is just how you design and view the workflow. Step Functions actually runs it: it triggers each step, passes data between them, retries failures, waits for responses (even for days), runs steps in parallel, and tracks the state of every execution. You define the workflow in a JSON-based language (Amazon States Language), and the visual diagram is a handy way to build it and see where each execution is or where it failed.

Features: sequence, parallel, conditions, timeouts, error handling, …

Can integrate with EC2, ECS, On-premises servers, API Gateway, SQS queues, etc…

Possibility of implementing human approval feature

Use cases: order fulfillment, data processing, web applications, any workflow

![Image](../saa/aws_step_functions.png)
