## Introduction to Well-Architected Solutions

## AWS Specialized Services

Types of services

AWS services are purpose-built for specific use cases. In the following section, you will learn more about the following four types of specialized AWS services:
Development services, Business application services, End-user computing services, IoT services

## Development services

1. AWS CodeBuild

   CodeBuild is a fully managed continuous integration service that compiles source code, runs tests, and produces software packages for deployment. It automatically scales to meet demand, and you only pay for the build time that you use.


2. AWS CodePipeline

   CodePipeline is a fully managed CI/CD service that automates the build, test, and deploy phases of your release process. This helps developers streamline software release workflows and reliably deliver new features and fixes without needing to provision servers.

3. AWS X-Ray

   X-Ray is a powerful tracing, debugging, and performance analysis tool that helps developers visualize application behavior. With X-Ray, developers can quickly identify performance bottlenecks, troubleshoot issues, and optimize applications for better efficiency and reliability.


4. AWS AppSync

   AWS AppSync is a fully managed GraphQL service. With AWS AppSync, developers can create a single GraphQL API that can securely access, manipulate, and combine data from 
   multiple data sources. This helps developers connect frontend applications with backend data.

5. AWS Amplify

   Amplify helps you streamline the process of developing, deploying, and managing secure and scalable full-stack applications on AWS. With Amplify, developers can quickly add features, like authentication, APIs, storage, and hosting, with minimal infrastructure management.  

## Business application services

These services are ideal for managing business application needs such as customer service operations and email promotions.

1. Amazon Connect

   Businesses can use this AI-powered contact center service to efficiently set up and operate a scalable customer service call center. Amazon Connect provides capabilities for call routing, recording, and analytics while integrating seamlessly with other AWS services.


2. Amazon Simple Email Service (Amazon SES)

   Amazon SES is a scalable and cost-effective email service provider that can be integrated into any application for reliable, high-volume email automation. It helps businesses optimize the delivery of transactional and marketing emails, resulting in enhanced customer engagement.

## End-user computing services

In modern businesses, IT departments often need to provide remote access to resources like virtual desktops and applications. Let's explore some AWS services that can be used to set up these environments for employees.

1. Amazon AppStream 2.0
   AppStream 2.0 is a fully managed service that streams applications from the cloud directly to any compatible device. This includes software-as-a-service (SaaS) applications and applications converted from desktop to SaaS without code revisions. This provides instant access to powerful software without the need for high-end local hardware.

2. Amazon WorkSpaces

   WorkSpaces is a fully managed cloud-based desktop computing service. With WorkSpaces, employees can securely access their work environment from any device with an internet connection. Employees can perform the same tasks as if they were on a physical office computer, while companies can benefit from cost-efficiency and easy administration.

3. Amazon WorkSpaces Secure Browser (formerly Amazon WorkSpaces Web)

   WorkSpaces Secure Browser is a fully managed remote enterprise browser. It provides a protected environment for employees to access private websites, SaaS applications, and the public internet. With WorkSpaces Secure Browser, IT departments don't need to manage specialized client software, infrastructure, or VPN connections.

## IoT services

Internet of Things (IoT) is a network of connected physical devices embedded with sensors and software that collect and exchange data over the internet.

These devices can be monitored and controlled remotely to improve efficiency, provide new services, and enhance quality of life.

AWS IoT Core

AWS IoT Core is a managed cloud service used to securely connect physical devices with cloud applications. It helps you create efficient IoT solutions by streamlining the complex process of ingesting, processing, and acting on device data. Device connections and data are secured with mutual authentication and end-to-end encryption, and you can choose from several communication protocols.

Some IoT solutions include the following:
 - Smart security cameras – Home monitoring that sends alerts to your phone
 - Smart pet feeders – A pet feeder that you can control remotely
 - Smart irrigation systems – A rain machine that adjusts watering based on weather and soil conditions

 ## AWS Well-Architected Framework

To help you design cloud solutions that are not just functional but also optimized, AWS offers the Well-Architected Framework. It gives you a structured approach to building secure, high performing, resilient, and efficient architectures aligned with best practices.

## Key takeaways: Well-Architected Framework pillars

1. Operational Excellence:
   Focuses on operations, monitoring, automation, and continuous improvement.

2. Security:
   Protects systems and data through best practices like least privilege and data integrity

3. Reliability:
   Emphasizes recovery planning and system adaptability to meet changing demands

4. Performance Efficiency:
   Encourages using the right resources for the job and adjusting as needs evolve

5. Cost Optimization:
   Helps control and reduce costs through smart provisioning and resource management

6. Sustainability:
   Promotes energy-efficient design and environmentally conscious resource usage.

## AWS Well-Architected Tool

The AWS Well-Architected Tool (AWS WA Tool) is a free service that helps assess and improve cloud workloads based on the six key pillars: Operational Excellence, Security, Reliability, Performance Efficiency, Cost Optimization, and Sustainability. 

It offers workload reviews, milestone tracking, and custom lenses for tailored evaluations and improvement plans. Integrated with AWS services like AWS Identity and Access Management (IAM) and APIs, it supports team collaboration and continuous progress tracking. 

The AWS WA Tool is ideal for architects, engineers, and compliance teams, and it promotes consistent, actionable, and well-documented architecture reviews.

## Optimizing a cloud architecture

Imagine you own a bustling online florist business, with orders flowing in during peak times like Valentine’s Day or Mother’s Day. Behind the scenes, the cloud architecture needs to be just as resilient and efficient as the operations. Let’s use the Well-Architected Framework to optimize the system for reliability, performance, security, cost savings, and sustainability.

1. Starting architecture

![Starting Architecture](../../images/start_architecture.png)

Let’s look at your current setup. You have a classic ecommerce architecture. It includes Amazon Elastic Compute Cloud (Amazon EC2) instances for the website and Amazon Relational Database Service (Amazon RDS) databases to handle orders and customer data. It also has an Amazon Simple Storage Service (Amazon S3) bucket full of product images. It’s functional, but let's evaluate how well it's scaling and handling traffic—especially during busy times.

2. Operational Excellence

![Operational Excellence](../../images/operational_excellence.png)

Your business is running smoothly, but what happens if an EC2 instance crashes during a rush of orders? To be truly resilient, you can automate scaling with EC2 Auto Scaling. Additionally, to make day to day operations more reliable and efficient, you can use infrastructure as code and implement self healing mechanisms like auto-rollback. These practices help your system adapt during high-demand periods as well as operate efficiently over time.

3. Security

![Security](../../images/security.png)

You’ve already got a secure foundation with an Amazon Virtual Private Cloud (Amazon VPC), but there’s more to do. Ask yourself: Are your EC2 instances regularly patched? Do your IAM policies follow the principle of least privilege? Protecting customer data—like names, addresses, and payment info—requires strong encryption for data at rest and in transit, along with fine-grained access controls. Strengthening these layers builds trust with your customers and safeguards sensitive information.

4. Reliability

![Reliability](../../images/reliability.png)

During busy seasons, availability is everything. You’ve already taken a great step by deploying resources across multiple Availability Zones, but you can increase reliability even further. Use Amazon CloudWatch to monitor your system’s health and set up automated recovery actions.

5. Performance Efficiency

![Performance efficiency](../../images/performance_efficiency.png)

As your business scales, your system should scale with it. Are your EC2 instances and RDS instances rightsized for your workload? AWS Compute Optimizer can help make sure you’re not wasting resources or underprovisioning your infrastructure. You’re already using AWS Lambda for event-driven tasks like image processing, which is great for flexible scaling. Make sure those functions are rightsized, too. And with Amazon CloudFront, you can already deliver product images quickly to global customers for a smooth, fast shopping experience.

6. Cost Optimization

![Cost optimiaztion](../../images/cost_optimization.png)

You're currently using On-Demand EC2 instances, which are great to start with, but switching to Spot Instances for variable traffic and Savings Plans for steady workloads can cut costs significantly. Track and manage your cloud spending in real time with AWS Budgets and AWS Cost Explorer. These tools help you make smart, cost-effective decisions while maintaining performance and reliability.

7. Sustainability

![Sustainability](../../images/sustainability.png)

Your use of serverless and elastic resources already reduces your environmental footprint. To go further, continue optimizing workloads to minimize resource waste. Doing so benefits both the planet and your bottom line—proving that environmentally conscious decisions can also be business-smart.

QUestions for architecting
1. Cheaper options
2. Combine different opensource tools with cloud services
3. More sophisticated approach/expensive
4. Differenct development techinques, like lets say the app is in containers

## Specialized use cases architecture diagrams


## Serverless web backend monitored by X-Ray

1. Receive traffic An Amazon API Gateway receives and validates HTTP requests
2. The API Gateway triggers a Lambda function that sends requests to Amazon DynamoDB.
3. X-Ray traces requests through API Gateway, Lambda, DynamoDB and back to the client. This helps developers troubleshoot any problems.

## Serverless static website with contact form

This serverless setup demonstrates a static website with a contact form hosted on Amazon S3. To review the components of this solution, choose each of the three numbered markers.

1. Customers submit questions using a contact form housed on a static Amazon S3 website.
2. An API Gateway receives and validates the contact form request.
3. The API Gateway then invokes a Lambda function that sends an email to the business owner using Amazon SES.

## Customer support with callback option

1. A customer calls or texts a customer support center. Calls are placed into the Amazon Connect interactive voice response (IVR) system. Text messages are routed to Amazon Connect from CloudFront.
2. Amazon Connect tries to connect the customer with a live agent.
3. For calls with long wait lines, customers can choose to receive an agent callback or they can switch to text through a Lambda function.