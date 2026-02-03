## Introduction to Going Global

## How to choose a Region or set of Regions
If we were to expand our coffee shop by opening new locations, there would be multiple things to consider, like customer demand and development cost. Similarly, you have several factors to consider when selecting a Region or set of Regions for your real-life resources.

## AWS edge locations
Like our coffee franchise could expand with smaller versions of the shop such as mobile coffee carts, AWS has smaller footprint facilities called edge locations. Edge locations cache items like images, videos, and other resources, so that users can access the content they need with lower latency.

## Infrastructure as code and CloudFormation
Another important consideration of a coffee shop expansion would be to maintain a consistent product from location to location. AWS has services, such as CloudFormation, that you can use to help automate the deployment of your cloud resources. These services use infrastructure as code, or IaC, helping you achieve a consistent, reliable set up each time your business grows.

## Key considerations when choosing Regions

1. Compliance. Different geographical locations have varying regulatory requirements and data protection laws that organizations must follow. For example, the General Data Protection Regulation (GDPR) is designed to protect the personal data and privacy of individuals within the European Union (EU). An online retail company operating in the EU would be required to meet GDPR compliance to protect customer data. GDPR compliance includes obtaining proper consent for data collection and providing mechanisms for data access and deletion.

2. Proximity. When selecting a Region, you also want to consider how to achieve low latency for your users. Regions closer to your user base minimize data travel time, which reduces latency and enhances application responsiveness.

3. Feature availability
   You also want to consider which specific features and services are available in each Region. AWS is constantly expanding features and services to multiple locations, but not all Regions contain all AWS offerings. For example, AWS GovCloud Regions are specifically designed to meet the compliance and security requirements of US government agencies and their contractors. These Regions have stringent physical, operational, and personnel security controls in place. These controls are only available in specific Regions to meet certain governmental regulatory requirements.

3. Pricing
   When selecting a Region, pricing is also a factor that can influence your decision. Some Regions have lower operational costs than others. These operational costs can impact the overall expenses for hosting applications and services. Tax laws and regulations can also play a role in cost. Some Regions might offer tax incentives or have lower tax rates, which can affect customer pricing. Additionally, data sovereignty laws in certain Regions might require data to be stored locally, affecting both compliance and cost.

## Diving Deeper into AWS Global Infrastructure

## Designing highly available architectures

## Deploying multi-Region and multi-AZ resources

You've learned how deploying your cloud resources to multiple Regions can achieve high availability. In addition to deploying to multiple Regions, you also want to deploy resources to multiple Availability Zones. By building redundant architectures or replicating your resources across multiple levels of AWS infrastructure, you can improve application reliability so that your users have access to your content when they need it.

In addition to high availability, the AWS Global Infrastructure also helps you achieve agility and elasticity for your business.

 - High availability: High availability refers to the capability of a system to operate continuously without failing. In the context of AWS infrastructure, it means that your applications can handle the failure of individual components without significant downtime.

 - Agility: Agility refers to the ability to quickly adapt to changing requirements or market conditions. With AWS infrastructure in place, you can modify and deploy services rapidly.

 - Elasticity: Elasticity refers to the ability of a system to scale resources up or down automatically in response to changes in demand. AWS infrastructure is set up for you to scale resources up and down on demand.

 ## Edge locations

In addition to AWS Regions that contain Availability Zones, AWS has a global edge network that provides quicker content access to users outside of standard Regions. These edge locations are strategically placed in areas like Atlanta, Georgia, USA or Shanghai, China to provide low-latency access to AWS services and content delivery. Edge locations offer multiple services to run closer to end users, including AWS networking services like Amazon CloudFront. CloudFront is a content delivery network (CDN) and caching system that you learn more about later in this training.

## Key elements of AWS global infrastructure

1. AWS regions
   Regions are geographical areas around the world that are made up of multiple data centers. These data centers provide scalable and redundant infrastructure for hosting cloud services. Each Region consists of multiple, isolated locations known as Availability Zones. Each Region has three or more Availability Zones.

2. Availability Zones
   Availability Zones are distinct locations within a Region, each designed as an independent zone with its own power, networking, and connectivity. Availability Zones maintain high availability and fault tolerance for applications. Each Availability Zones consists of one or more data centers.

3. Edge locations
   Edge locations are strategically placed sites around the world that cache content to deliver data, video, and applications with lower latency and higher transfer speeds. Edge locations are considered a vital part of the AWS content delivery network (CDN) and use services like CloudFront to efficiently distribute data to end users.

## Infrastructure and Automation

## CloudFormation

CloudFormation is a service that helps you model and set up your AWS resources so that you can spend less time managing those resources and more time focusing on your applications that run in AWS. With CloudFormation, you can define your infrastructure as code. You create a template that describes all the AWS resources that you want (like Amazon Elastic Compute Cloud (Amazon EC2) instances), and CloudFormation takes care of provisioning and configuring those resources for you.

## Interacting with AWS resources

As you've learned, there are a number of ways you can operate in the AWS Cloud. To interact with AWS resources, you must invoke AWS APIs. To interact with these APIs, you can use the AWS SDKs, the AWS Command Line Interface (AWS CLI), the AWS Management Console, or IaC tools such as CloudFormation. To review functions and use cases for using these approaches, choose each of the numbered markers.

1. Programmatic Access. Programmatic access includes options like the AWS CLI and AWS SDKs.
   Use cases for AWS CLI actions and SDKs include the following:
   - AWS CLI: Automate routine tasks. For example, you might write a script to provide routine backups for a service such as Amazon Elastic Block Store (Amazon EBS).
   - SDKs: Invoke APIs for one part of an application process. For example, you might use an SDK to store user data in an AWS storage service such as Amazon Simple Storage Service (Amazon S3).

2. The AWS Management Console is a web interface that you use for managing AWS services, offering quick access to services, search functionality, and simplified workflows.
   Use cases for using the console include the following:
   - Billing and cost optimization dashboards and visualizations
   - Services focused on graphical representations, like Amazon QuickSight and Amazon Neptune

3. Infrastructure as Code. With IaC tools such as CloudFormation, you can automate resource management across your organization with AWS service integrations offering efficient and repeatable resource creation and management.
   Use cases for CloudFormation include the following:
   - Managing infrastructure with DevOps such as continuous integration and delivery (CI/CD) pipelines
   - Scaling resources such as Amazon EC2 instances to multi-Region applications in a consistent, repeatable way