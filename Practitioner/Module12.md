## Introduction to Migration

Cloud migration refers to the process of moving your organization's digital assets, IT resources, applications, and databases from on-premises infrastructure to the AWS Cloud

Three phases of the migration process

1. Assess
   In this phase, you build the business case for the migration and assess your readiness. One of the services used in this phase is the Migration Evaluator.   

2. Mobilize
   In this phase, you prepare the organization and mobilize the resources needed for the migration. Two services you might use in this phase are AWS Application Discovery Service and the AWS Migration Hub.

3. Migrate and modernize
   In this phase, you use your strategy, plan, and the best practices to migrate and modernize. Tools to support you include AWS Application Migration Service and AWS Database Migration Service (AWS DMS). If you are transferring data, you might use AWS DataSync, AWS Transfer Family, and the AWS Snow Family.

## AWS Cloud Adoption Framework


The AWS CAF is a framework that brings AWS experience and best practices to companies preparing to migrate to the AWS Cloud. The framework provides tools to help accelerate the migration journey, organize resources, and align management during the transition.

Benefits

1. AWS CAF provides benefits for migrations to reduce business risk and improve sustainability and corporate transparency. 
2. Companies can grow revenue by creating new products and services in their cloud transformation. 
3. They can also reduce operational costs
4. increase productivity
5. improve customer experience in their new cloud environment.

## Functional and business-related stakeholders

When moving to the cloud, different people in the business must be involved. AWS Cloud Adoption Framework (CAF) has six perspectives.

Six perspectives of AWS CAF

1. Business. Focuses on the business value of using the cloud. Roles: Business managers, finance managers, budget owners, strategy stakeholders.

2. People. Focuses on helping employees adapt to cloud changes. Roles: HR, staffing teams, people managers.

3. Governance
   Focuses on aligning IT with business goals and managing risk. Roles: CIO, program managers, enterprise architects, business analysts, portfolio managers.

4. Platform
   Focuses on building and moving systems to the cloud. Roles: CTO, IT managers, solutions architects.

5. Security
   Focuses on protecting systems and data in the cloud. Roles: CISO, security managers, security analysts.

6. Operations
   Focuses on running and supporting cloud systems. Roles: IT operations managers, IT support managers.

Memory Trick
“Big People Govern Platforms Securely Operate.”

## Seven Migration Strategies

1. Relocate
   Move applications (VMs or containers) from on-premises to the cloud without changing them.

2. Rehost
   Move an application to the cloud without making changes.

3. Replatform
   Move the application and make small improvements without changing its main design.

4. Refactor
   Redesign the application to fully use cloud features and improve performance or scalability.

4. Repurchase
   Replace the application with a SaaS cloud service.
   For example, a business might choose to implement the repurchasing strategy by migrating from a customer relationship management (CRM) system to a new sales force software.

5. Retain
   Retaining consists of keeping applications that are critical for the business in the source environment. This might include applications that require major refactoring before they can be migrated or work that can be postponed until a later time.

6. Retire
   Retiring is the process of removing applications that are no longer needed.

## Migration Services and Tools

In the Assess phase, it is important to have the right tools to build the business case for your migration. That's where Migration Evaluator can help.

## Migration evaluator

The Migration Evaluator is a migration assessment service that helps you create a business case for AWS Cloud planning and migration. It does this with a data driven approach, analyzing your current state, target state, and developing a migration readiness plan with projected cloud costs.

Benefits: The benefits include removing the guesswork when migrating. It provides visibility into multiple cost-effective cloud migration scenarios. It also gives insights on reusing existing software licensing, which can further reduce costs.

Let's look at two services that you might use in the Mobilize phase for discovery and planning.

## AWS Application Discovery Service

The Application Discovery Service discovers on-premises server inventory and connections. It gathers configuration, performance, and connection details for both servers and databases to create a detailed migration plan.

Benefits: With Application Discovery Service, you get a comprehensive snapshot of your on-premises inventory. You also can integrate discovery data with other services like Migration Hub and protect the data Application Discovery Service collects.
 
 ## Migration Hub

The Migration Hub is a centralized hub to take you from discovery, assessment, planning, and execution of your migration. It provides tools, guidance, and automated recommendations to collaborate with your team and track your migration.

Benefits: With the Migration Hub, you have one location to go for your migration and, expert guidance in the form of prescriptive journey templates. Another benefit is cost savings because there is no charge to use Migration Hub.

Use cases: You can use Migration Hub for migration assessment and planning and migration completion and collaboration with teams. You can also use it for modernization efforts like fast-tracking application refactoring.

## Application Migration Service

Application Migration Service is a tool to move and improve your on-premises and cloud-based applications. It helps customers streamline, expedite, and reduce the cost of migrating and modernizing applications.

Benefits: The benefits include support to migrate from any source infrastructure that runs a supported operating system (OS). It makes it possible to modernize your applications during migration. You can maintain normal business operations during the application replication process and also reduce costs by using one tool for a wide range of applications.

## AWS Migration and Modernization Competency Partners

When migrating to the AWS Cloud, if you need help and expertise, you don't have to go it alone. You can work with the AWS Competency Partner Program. You can search for AWS Migration and Modernization Service Partners who specialize in specific phases of the migration or the type of help you need.

## Database Migrations

Migrating your database to the cloud can provide an opportunity to redesign and improve your database architecture.

Because legacy systems and requirements change over time, you might also consider whether to migrate to an AWS managed database service or an open source database to reduce licensing costs.

It is fairly simple to migrate data from one server to another when both are using the same database engine, known as homogeneous migration. Going to a different engine, or heterogeneous migration, is more complex and might require changes in your application.

The good news is, whether your migration is homogenous (from same type of database to same type) or heterogenous (from one type of database to a different type), there are AWS services to support you.

## AWS DMS

Migrates and replicates databases to AWS with low downtime.

Supports both homogeneous (same engine) and heterogeneous (different engine) migrations.

Handles large (terabyte-sized) databases at low cost and keeps databases highly available.

Used to move to managed databases, remove licensing costs, replicate live changes, and integrate with data lakes.


## AWS SCT

Converts database schemas and code objects (tables, views, stored procedures, functions) between different database engines.

Provides effort estimates for planning.

Automates schema analysis and conversion, saving weeks/months of manual work.

Used when switching from commercial to open-source databases or modernizing schemas.

## Transferring Data Online

When you migrate data to the AWS Cloud, there are a few considerations to keep in mind. You need to ensure security (will it get there safely), data validation (will it get there in one piece), scheduling (when is the best time). You would also confirm bandwidth requirements. For the majority of data migration workloads, AWS DataSync will do the job.

## AWS DataSync

Automates and accelerates large-scale data transfer between on-premises storage and AWS (e.g., S3).

Handles encryption, scheduling, bandwidth control, filtering, reporting, and replication.

Used for migrations, archiving cold data, and hybrid workflows.

## AWS Transfer Family
Fully managed FTP, SFTP, and FTPS service for secure file transfers into/out of AWS (S3, EFS).

Provides encryption, authentication, scalability, and simplified infrastructure management.

Used to modernize file transfers and share data with partners/workforce.

## AWS Direct connect
You might remember Direct Connect from the networking module. With the bandwidth of a dedicated connection, it is also a great solution for moving your data online to the AWS Cloud when migrating.


Provides a dedicated private connection from your network to AWS VPC.

Offers fast, reliable, secure transfers with higher bandwidth and reduced network costs.

Useful for large data migrations requiring consistent performance.

## Transferring Data Offline

Many customers prefer online migrations, but there are some customers who need to transfer data offline. An example would be if bandwidth is limited, or in remote locations with no internet and Direct Connect is not an option. Or, in cases with large data volumes, sending petabytes of data over the internet would take longer than simply sending a physical device.

## Snowball Edge Storage Optimized devices

AWS Snowball Edge Storage Optimized devices are a great solution for offline data migration where connecting to the internet might not be an option. These devices deliver high performance NVMe storage, making it possible to simplify multi-petabyte data migrations from on-premises locations to AWS.

Benefits: The benefits include delivering better compute performance and larger storage capacity with gigabytes of data per second for data migration workloads with offline requirements.

Use cases: You can use Snowball Edge devices for data migration when offline migration is required. They can also be used for edge computing when a secure, rugged device is needed