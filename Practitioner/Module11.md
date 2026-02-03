## Introduction to Pricing and Support

## AWS pricing, AWS support, and cost optimization

## AWS Pricing Concepts

 - Pay as you go
   With pay as you go, you can adapt to changing business needs and reduce the risk of overprovisioning or missing capacity. 

 - Save when you commit
   For certain services, such as Compute services on AWS, Savings Plans offer savings over On-Demand prices when you commit to a 1-year or 3-year plan.

 - Pay less by using more
   With AWS, you can realize important savings as your usage increases. For some services, pricing is tiered, meaning the more you use, the less you pay.

Driving factors of cost

The pricing of AWS services varies based on several factors, such as:
 - service category or type
 - configuration
 - AWS Region
 - which pricing model you choose

There are three fundamental drivers of cost with AWS: compute, storage, and outbound data transfer. These driving factors impact AWS service categories in different ways.

 -  Compute
    For compute resources, you pay by a certain span of time, like by the hour or by the second. Unless you've made a reservation for which the cost is agreed upon beforehand, you pay from the time you launch a resource until the time you stop the instance.

 - Storage
    You can choose from a broad portfolio of storage solutions with deep functionality for storing, accessing, protecting, and analyzing data. Pricing for storage largely depends on how much storage you have provisioned or how much you are using.

    For some storage options, such as Amazon Simple Storage Service (Amazon S3), storage cost is tiered. This means you can optimize storage costs based on how frequently and quickly you need to access data. With Amazon S3, consider the following six cost components when storing and managing customer data:
    - Storage pricing
    - Request and data retrieval pricing
    - Data transfer and transfer acceleration pricing
    - Data management and analytics pricing
    - Replication pricing
    - The price to process your data with Amazon S3 Object Lambda

 -  Data transfer
    In most cases, there is no charge for inbound data transfer or for data transfer between AWS services within the same Region. There are some exceptions, so be sure to verify data transfer rates before beginning. 

    Outbound data transfer is aggregated across services and then charged at the outbound data transfer rate. The more data you transfer, the less you pay per gigabyte. For data storage and transfer, you typically pay per gigabyte.

## AWS Pricing and Billing Services

You learned about various AWS pricing and billing services and tools. These services are purpose-built to help you forecast, track, manage, and view your AWS costs.

1. AWS Organizations
   AWS Organizations provides centralized management and governance of your AWS environment. Using AWS Organizations, you can create, group, and manage accounts. You can also apply security policies at the account level and consolidate billing with multiple accounts using a single payment method. Sets up and manage payment methods.



2. AWS Billing and Cost Management dashboard
   The AWS Billing and Cost Management dashboard centralizes cost management, showing current charges, usage, forecasts, and detailed breakdowns. It also provides tools to manage payments, view invoices, set budgets, and consolidate billing. Forecast future expenses based on current usage trends.

3. AWS Cost Explorer
   AWS Cost Explorer helps visualize, analyze, and manage AWS costs and usage with interactive graphs, reports, and forecasts. It provides insights into spending patterns, trends, and Reserved Instance recommendations.

4. AWS Pricing Calculator
   Another helpful tool is the AWS Pricing Calculator. The AWS Pricing Calculator is a web-based planning tool that you can use to create estimates. You input specific configurations such as instance types, storage options, and data transfer volumes. Then, based on your configurations, you receive a detailed cost breakdown to help you budget for your AWS resource allocation.

5. AWS Budgets
   AWS Budgets helps set custom budgets and sends alerts when costs, usage, or Savings Plans and Reserved Instances (RIs) utilization or coverage exceed defined thresholds.

## AWS Support Plans

Types of AWS support

## AWS Support Plans Overview

| Feature                            | Basic Support                                         | Developer Support                                             | Business Support                                                                                       | Enterprise On-Ramp Support                                                     | Enterprise Support                                                                         |
| ---------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| Availability                       | Included for all AWS customers                        | Optional paid plan                                            | Optional paid plan                                                                                     | Optional paid plan                                                             | Optional paid plan                                                                         |
| Recommended Use                    | Getting started with AWS                              | Experimenting or testing workloads                            | Minimum tier for production workloads                                                                  | Production & business-critical workloads                                       | Business- & mission-critical workloads                                                     |
| Documentation & re:Post            | Access to documentation, whitepapers, and AWS re:Post | Access to documentation, whitepapers, and AWS re:Post         | Access to documentation, whitepapers, and AWS re:Post                                                  | Access to documentation, whitepapers, and AWS re:Post                          | Access to documentation, whitepapers, and AWS re:Post                                      |
| **Response Times**                 | N/A                                                   | < 24 hours (general guidance)<br>< 12 hours (system impaired) | Includes previous plan response times<br>< 4 hours (production impaired)<br>< 1 hour (production down) | Includes previous plan response times<br>< 30 minutes (business‑critical down) | Includes previous plan response times<br>< 15 minutes (business‑ or mission‑critical down) |
| AWS Trusted Advisor                | Core checks                                           | Core checks                                                   | Full set of checks                                                                                     | Full set of checks                                                             | Full set of checks + prioritized recommendations by AWS account team                       |
| Technical Account Management (TAM) | Not included                                          | Not included                                                  | Not included                                                                                           | Pool of TAMs providing proactive guidance                                      | Designated TAM providing consultative architectural & operational guidance                 |

## Additional resources for your cloud journey

- AWS re:Post is a community-driven, question-and-answer platform where users can seek help, share knowledge, and find solutions related to AWS services and technologies. AWS re:Post also houses AWS Knowledge Center. AWS Knowledge Center contains articles and videos covering the most frequently asked questions and requests from AWS customers.
- AWS Trust and Safety Center. The AWS Trust and Safety Center provides information on how to report activity or content on AWS that you suspect is abusive. 
- AWS Professional Services. AWS Professional Services is a consulting service that offers deeper, project-based support. They help with complex migrations, security audits, performance tuning, and more.
- Self-support at AWS.AWS also provides extensive documentation and self-support resources that you can use to research, answer a question, or troubleshoot an issue. Documentation includes user guides for AWS services, SDK guides, blog posts, and whitepapers for specific solutions.

## AWS Marketplace and AWS Partners

The AWS Marketplace is a digital catalog that includes thousands of software listings from independent software vendors. You can use AWS Marketplace to find, test, and buy software that runs on AWS. For each listing in AWS Marketplace, you can access detailed information on pricing options and reviews from other AWS customers. Solutions and services offered in the AWS Marketplace include the following:

1. Software as a service (SaaS):
   Business applications such as project management tools
   Marketing tools such as customer engagement platforms
   Collaboration tools such as file sharing services

2. Machine learning (ML) and AI:
   Prebuilt models for image recognition, natural language processing, and more
   ML algorithms for training custom models

3. Data and analytics:
   Business intelligence platforms for visualization and reporting
   Data integration tools

You can also explore software solutions by industry and use case. For example, suppose your company is in the healthcare industry. In AWS Marketplace, you can review use cases that software helps you to address, such as implementing solutions to protect patient records or using machine learning models to analyze a patient’s medical history and predict possible health risks.

## AWS Partner Network

The AWS Partner Network (APN) is a global community that uses AWS technologies, programs, expertise, and tools to build solutions and services for customers. 
You can work with AWS Partners to create or use specialized solutions that are tailored to your unique business needs.

You can also become an AWS Partner. There are many benefits to becoming a partner, including the following:

 - Funding benefits: As businesses join the AWS Partner Network and participate in specific programs available to AWS Partners, they can unlock various funding benefits to help build, market, and sell with AWS.

 - AWS Partner events: AWS Partner events include webinars, virtual workshops, and in-person learning opportunities. You can use AWS Partner events to network with other partners, learn more about new or current offerings, and collaborate with AWS experts.

 - AWS Partner Training and Certification: Take advantage of unique, partner-centered offerings from AWS Training and Certification. From certification to a specific service or learning objective, the AWS Partner training portfolio has numerous opportunities to upskill your cloud knowledge.

 ## Cost Optimization

1. Amazon EC2
   One way to optimize cost with Amazon EC2 instances is to rightsize your resources. This means that you analyze and adjust your resources to meet the needs of your workload. Services such as AWS Compute Optimizer can help rightsize your compute resources.

   Also, using Spot Instances can help optimize for cost. Spot Instances work well for workloads that are tolerant to interruptions. Spot Instances use spare Amazon EC2 capacity for a significant discount compared to On-Demand instances.

2. Auto scaling
   Another way to help optimize cost with compute resources is auto scaling. When demand drops, AWS Auto Scaling will automatically remove any excess resource capacity, so you avoid overspending. Application load balancing also helps distribute traffic across EC2 instances.

3. Amazon RDS
   Rightsizing is an important piece of cost optimization in your Amazon Relational Database Service (Amazon RDS) instances. Amazon RDS can scale storage using storage autoscaling which prevents over- or underprovisioning.

   Read replicas scale capacity horizontally, meaning your resources won't need to a scale up into a larger instance. Instead of scaling the primary instance, read replicas are used to store data and can be used for heavy read workloads which in turn reduces the strain on the primary instance. Similarly, using something like Amazon Elasticache for caching can also reduce the load on your primary instance and optimize for cost.

4. Amazon S3
   Using the right storage class is key to optimizing cost in the cloud.

   For example, you might use S3 Glacier Deep Archive as a low-cost storage tier ideal for data that is accessed once or twice a year. For data with unknown or changing access patterns, S3 Intelligent-Tiering is a great choice.

   You can also use VPC endpoints to help optimize for cost as well, as using VPC endpoints for Amazon S3 access can help reduce data transfer costs.