## Introduction to Security on AWS

Authentication and authorization are two mechanisms that play a big role in data privacy and system protection.

## Authentication and authorization
Authentication is the process of verifying the identity of a user or entity through credentials like a username and password combination.
 - Use case: An employee logs in to an employee portal.

Authorization grants users certain access rights and permissions that determine which actions they can perform in a system or application.
 - Use case: An employee can only access their own employee records inside the employee portal.

AWS shared responsibility model

Customers: Security in the cloud:
1. Managing the security of data, systems, and applications
2. Deciding what data and workloads to store or run in AWS
3. Determining which AWS services to use
4. Controlling who has access to environments and resources

AWS: Security of the cloud
This includes securing the following:
1. The foundational software that powers AWS services
2. The virtualization layer
3. The hardware and global infrastructure that supports the data centers from which services operate. This includes protection for AWS Regions, Availability Zones, and edge locations.

AWS security controls
AWS offers multiple security mechanisms to protect your cloud resources. These controls can help you do the following:
 1. Prevent security incidents through proper permission and access management.
 2. Protect networks, applications, and data.
 3. Detect and respond to security incidents as they occur.

 ## AWS Identity and Access Management (IAM)

One of the best ways to prevent security incidents before they happen is through proper permission and access management. With IAM, by default, all actions are denied. You must explicitly grant permission to someone before they can perform any actions in your account.

When you grant permissions, you should provide access only on a need-to-have basis. This concept is called the principle of least privilege.

The principle of least privilege dictates that you should only give people and systems access to what they need and nothing else.

IAM provides users, groups, and roles so you can configure access based on your company’s specific operational and security needs. IAM policies define the needed access for these identities.

To learn more about IAM identities and controls, choose each of the following five numbered markers.

1. AWS account root user
   
   All AWS accounts are given an AWS account root user. The root user is the account owner and has permission to do anything inside the AWS account. 
   
   You should associate a strong password with this powerful account and turn on multi-factor authentication (MFA), which requires at least two verification methods to log in. To handle daily tasks, you should create other IAM identities, such as IAM users.

2. IAM users
   An IAM user represents a person or application that interacts with AWS services and resources. It consists of a name and credentials. AWS recommends creating individual IAM users for each person who needs to access the AWS account, so they have their own unique set of security credentials.

3. IAM groups
   An IAM group is a collection of IAM users. When you assign permissions to a group, all users in the group inherit the permissions. For example, you might assign standard access permissions to a group called employees so all your employees receive the same generic access.

4. IAM roles
   An IAM role is an identity you can assume to gain temporary access to permissions. For example, an employee might need to work as a barista in the morning and a cashier in the afternoon. When someone assumes an IAM role, they abandon all previous permissions they had under a previous role and assume the permissions of the new role.

5. IAM policies
   An IAM policy is a JSON document that allows or denies permission to access AWS services and resources. IAM policies can also define the level of access to resources. For example, you can allow employees to access all the Amazon S3 buckets in your AWS account or only a specific bucket.

## Additional access management services

1. AWS IAM Identity Center
   IAM Identity Center centralizes identity and access management across AWS accounts and applications. IAM Identity Center can also connect to an existing identity source and provide your workforce with single sign-on access to all your connected AWS services and accounts. This is called federated identity management.
   Federated identity management is a system that allows users to access multiple applications, services, or domains using a single set of credentials.

2. AWS Secrets Manager
   Secrets Manager provides a secure way to manage, rotate, and retrieve database credentials, API keys, and other secrets throughout their lifecycle. This helps keep your applications, services, and IT resources safe.

3. AWS Systems Manager
   Systems Manager provides a centralized view of nodes across your organization’s accounts and Regions and multi-cloud and hybrid environments. With this service, you can quickly access node information, such as ID and operating system details, and automate registry edits, user management, and security patching.

## Protecting Networks and Applications

## DoS attacks
In a denial of service attack, an attacker floods a web application with excessive network traffic. Legitimate customer requests are denied if the web application becomes overloaded and can no longer respond.

## DDOS attacks

In a distributed denial of service (DDoS) attack, an attacker can use multiple infected computers (called zombie bots) to unknowingly send excessive traffic to a web application.

## AWS network and application protection

AWS automatically protects against low-level, brute-force attacks, such as DDoS, through its built-in infrastructure and network architecture. AWS infrastructure reaches across the globe and includes multiple Regions, Availability Zones, and edge locations. It is designed to make it difficult for attackers to overwhelm the system.

## AWS protection through infrastructure

1. Security groups. Security groups only allow in proper request traffic. They operate at the AWS network level so they can shrug off massive attacks using the entire AWS Region's capacity.

2. Elastic Load Balancing (ELB). ELB handles traffic first before handing it off, so your frontend server is not overwhelmed. Like security groups, it runs at the Region level.

3. AWS Regions. The enormous capacity of Regions makes them extremely difficult to overwhelm. It would be massively expensive to achieve.

## AWS protection through services

1. AWS Shield

   AWS Shield Standard is designed to automatically protect AWS customers from the most common, frequently occurring types of DDoS attacks at no cost. It uses a variety of analysis techniques to detect and mitigate incoming malicious network traffic in real time.

   AWS Shield Advanced is a paid service that provides detailed attack diagnostics and the ability to detect and mitigate sophisticated DDoS attacks. It also integrates with other services, such as Amazon CloudFront, Amazon Route 53, and ELB.

   Additionally, you can integrate AWS Shield with AWS WAF by writing custom rules to mitigate complex DDoS attacks.

2. AWS WAF
   AWS WAF is a web application firewall that monitors network requests that come into your web applications. When a request comes into AWS WAF, it checks the IP address against a web access control list (web ACL). If the request comes from a blocked IP address on the web ACL, AWS WAF denies access. Legitimate requests are allowed access.

## Protecting Data

## Data encryption

Encryption basics

Data encryption works like a lock and key mechanism. If you have the right key, you can access the encrypted data. Otherwise, you cannot access the data. 

For example, let's say you are protecting a customer's profile. An encryption key is used to turn the profile information into a randomized set of characters. A decryption key is used to access the customer's information, such as their name, only when it's needed by your application.

Data encryption comes in the following two forms: 

1. Data encryption at rest: The data is idle and not moving, like when it's stored in a database.

2. Data encryption in transit: The data is moving between locations, like when it's being sent from a database to an application. SSL/TLS certificates are used to establish encrypted network connections from one system to another.

## AWS data protection

AWS has a variety of methods for protecting data. They include built-in data protection for storage options and services specifically designed for enhanced data protection.

AWS built-in data protection:
 - Amazon S3. By default, all new S3 buckets have encryption configured, and all uploaded objects are encrypted at rest.
 - Amazon EBS. Amazon EBS volumes and snapshots can be encrypted at rest, including both boot and data volumes of an Amazon EC2 instance.
 - Amazon DynamoDB. Server-side encryption at rest is enabled on all DynamoDB table data using encryption keys stored in AWS Key Management Service (AWS KMS).

## AWS data protection services

1. AWS Key Management Service (AWS KMS)
   You can use AWS KMS to create and manage cryptographic keys. These keys can then be used to encrypt and decrypt your data. You can also control the use of keys across a wide range of services and in your applications. For example, you can specify which IAM users and roles can manage keys. Your keys never leave AWS KMS, and you can temporarily disable them so they can no longer be used.

2. Amazon Macie
   With Amazon Macie, you can monitor your sensitive data at rest to make sure it's safe. Macie uses machine learning (ML) and automation to discover sensitive data stored in 
   Amazon S3. You can use Macie to assess your security posture, which is especially helpful for meeting compliance requirements.

3. AWS Certificate Manager (ACM)
   ACM centralizes the management of your SSL/TLS certificates that provide data encryption in transit. It can be used to protect various AWS services and your connected on-premises resources.

## Detecting and Responding to Security Incidents

AWS offers a variety of services you can use to detect and respond to security incidents.

1. Amazon Inspector
   Amazon Inspector helps improve the security and compliance of applications by running automated security assessments for Amazon EC2 instances, containers, and Lambda functions. It checks applications for security vulnerabilities and deviations from security best practices, such as open access to EC2 instances and installations of vulnerable software versions.

   You can view completed assessments in the Amazon Inspector console. These assessments include a list of security findings prioritized by severity level. Each identified security issue includes a detailed description and a recommendation for how to fix it. You can also retrieve these findings through an API.

2. Amazon GuardDuty
   Amazon GuardDuty provides intelligent threat detection across your infrastructure and resources. GuardDuty identifies threats by continuously monitoring streams of your account metadata and network activity in your environment. It uses known malicious IP addresses, anomaly detection, and machine learning to identify threats more accurately.

3. Amazon Detective
   After a threat has been detected, you can use Amazon Detective to further investigate the root cause. Detective helps you analyze threats with interactive visualizations contained in a unified AWS Management Console view. These visualizations include resource and user interactions over a configurable timeline with recommended steps for remediation.

4. AWS Security Hub
   Security Hub brings multiple security services together into a single place and format. With this service, you can quickly see your security and compliance state in one comprehensive view. Security Hub automatically aggregates security findings from AWS and partner services and organizes them into actionable, meaningful groupings called insights. It can accelerate time to resolution (TTR) with automated remediation.