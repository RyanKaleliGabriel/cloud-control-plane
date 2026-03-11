
## Introduction to Databases

AWS offers a wide range of database services to meet various data storage and management needs. These services are designed to be scalable, reliable, and easy to use for businesses of all sizes. AWS database services include options for relational databases, nonrelational databases, in-memory caches, and purpose-built services for use cases like document management.

## AWS shared responsibility model

The AWS services that you will be exploring in this module are primarily fully managed, with a few managed services, and no unmanaged services.

1. Fully managed AWS database services only require customers to be responsible for designing data structures and managing access controls. AWS handles nearly all operational tasks like provisioning, scaling, patching, backups, performance optimization, and security patches.
2. With managed database services, AWS handles routine tasks like backups, patching, and hardware provisioning while customers are responsible for database configuration, query optimization, and performance tuning decisions.
3. With unmanaged databases, customers are responsible for installation, configuration, patching, maintenance tasks, database security, backups, high availability setup, and performance optimization. An example of an unmanaged database in AWS would be a database management system like MySQL installed directly on an Amazon Elastic Compute Cloud (Amazon EC2) instance.

## Relational Database Services

Relational databases use a rigid schema that organizes collections of data into tables with rows and columns, where relationships exist between different tables.

Relational databases store data in a way that relates it to other pieces of data, and they use structured query language, or SQL, to manage and query data. This approach stores data in an easily understandable, consistent, and scalable way that works great for applications requiring structured data management.

AWS offers fully managed relational database solutions that remove the burden of database administration while maintaining high availability and security. AWS relational databases support popular database engines like MySQL, PostgreSQL, and Oracle, making it easier to migrate existing databases to AWS.

## Amazon Relational Database Service (Amazon RDS)

Amazon RDS is a managed relational database service that handles routine database tasks such as backups, patching, and hardware provisioning. Amazon RDS supports multiple database instance class types that optimize for memory, performance, or input/output (I/O).

To improve data resilience, Amazon RDS offers Multi-AZ deployment and automated backups, but you can also manually create backups using DB snapshots. These are full backups of your entire database instance, which can be useful for specific point-in-time recovery or long-term data archiving purposes. Amazon RDS offers security features including network isolation, encryption in transit, and encryption at rest. You can readily scale database resources vertically or horizontally as needed.

Supported database engines
 - Amazon Aurora
 - MySQL
 - PostgreSQL
 - Microsoft SQL Server
 - MariaDB
 - Oracle Database

Use cases
Some examples of practical use cases for Amazon RDS are web applications, enterprise workloads, and product inventories for e-commerce platforms.

Benefits

1. Cost optimization. Amazon RDS uses a pay-as-you-go model for compute and storage. It removes hardware procurement costs and reduces operational overhead by automating backups, patching, and monitoring.

2. Multi AZ deployment. RDS replicates data synchronously to a standby instance in a different Availability Zone. It performs automatic failover during instance or AZ failure to maintain availability.

3. Performance optimization. RDS supports read replicas to offload read traffic and provides Performance Insights for real-time workload analysis. Resource management and maintenance tasks are automated.

4. Security controls. RDS runs inside a VPC, supports encryption at rest and in transit, and integrates with IAM for access control. Backup and Multi-AZ features enhance resilience.


## Amazon Aurora 

Aurora is a managed relational database designed to help reduce unnecessary I/O operations.

It's compatible with MySQL and PostgreSQL, provides high performance and availability, and automatically scales alongside your workloads. 

Aurora replicates data across multiple Availability Zones for enhanced durability and fault tolerance, and features automated backups, encryption at rest, and continuous monitoring.

## Use cases

Some examples of practical use cases for Aurora are gaming applications, media and content management, and real-time analytics.

## Benefits

1. High performance and availability. Aurora delivers up to five times the throughput of standard MySQL and three times the throughput of PostgreSQL. It uses a distributed storage system across multiple nodes to provide high performance and availability.

2. Automated storage and backup management. Aurora automatically grows storage from 10 GB to 128 TB based on your actual data usage, which eliminates guesswork in capacity planning. It also continuously backs up your database to Amazon Simple Storage Service (Amazon S3) to provide point-in-time recovery.

3. Advanced replication and fault tolerance. Aurora replicates data across three Availability Zones with six copies of data, and provides 99.99% availability. It automatically detects database failures and redirects traffic to healthy replicas without data loss.

## NoSQL Database Services

Instead of row and column relationships, NoSQL databases build a structure for the data that they contain using key-value pairs instead. With key-value pairs, data is organized into items identified by unique keys.

### Amazon DynamoDB

DynamoDB is a fully managed NoSQL database service that provides fast and predictable performance for both document and key-value data structures. It's a powerful and incredibly fast database option for use cases that require a flexible schema, and is ideal for applications that require high performance and seamless scaling.

DynamoDB seamlessly scales alongside your data without impacting performance, which means that you only pay for the resources that you use. It also includes built-in security features for enhanced protection, and automatically spreads your data across multiple servers to handle your workload.

Use case
Some examples of practical use cases for DynamoDB are gaming platforms, financial service applications, and mobile applications with global user bases.

## Benefits

1. Scalability with provisioned capacity. DynamoDB auto-scales read and write capacity based on target utilization. It supports virtually unlimited table size and partitions data automatically to handle growth.

2. Consistent high performance.Provides single-digit millisecond latency at any scale. Data is distributed across multiple partitions backed by SSDs to maintain predictable performance.

3. High availability. Replicates data across three Availability Zones within a Region. Supports multi-Region replication for cross-Region resilience and durability.

4. Data encryption. Encrypts data at rest by default and supports TLS in transit. Integrates with AWS KMS for customer-managed or AWS-managed encryption keys.

[Demo](https://skillbuilder.aws/renderer/?module_id=B1DGAV8S16%3A001.000.000&product_id=8D79F3AVR7%3A002.000.000&registration_id=43c00644-2725-5f07-91a6-2056eca2e564&referrer=https%3A%2F%2Fskillbuilder.aws%2Flearn%2F94T2BEN85A%2Faws-cloud-practitioner-essentials%2F8D79F3AVR7&navigation=digital)

## In-Memory Caching Services

An in-memory cache is a high-speed storage layer that temporarily stores frequently accessed data in a computer's main memory, or RAM. Retrieving data from RAM provides extremely fast processing and retrieval speeds, often hundreds or thousands of times faster than traditional disk-based storage systems.

When applications need specific information, they first check the cache before requesting it from the original data source. This reduces the load on primary databases and speeds up response times for end users. In-memory caches are ideal for storing session data, API responses, database query results, and other information that applications require repeatedly.

## Amazon ElastiCache

ElastiCache is a fully managed in-memory caching service that was built to help reduce the complexity of administering in-memory caching systems. This means that you can continue to use the same Redis, Valkey, or Memcached tools and configurations to scale your workloads. It automatically detects and replaces failed nodes, which makes it ideal for applications that need consistent high performance.

ElastiCache is a cluster of multiple separate computers (nodes), not RAM management for a single computer. Every node is a separate EC2-like instance with its own CPU and RAM. The data is stored in RAM on each of these separate machines

Use cases
Some examples of practical use cases for ElastiCache are session data management, database query enhancement, and gaming leaderboards.

## Benefits

1. High performance, provides managed in-memory caching for Redis, Valkey, and Memcached with automatic provisioning, patching, and monitoring. It supports horizontal scaling by adding or removing nodes based on demand.

2. High availability. Continuously monitors primary nodes and automatically promotes a replica to primary upon failure. Failover is automatic and typically completes within minutes.

3. Replication across multiple availability zones.Supports primary and replica nodes across multiple Availability Zones. Replication protects against AZ-level failures and maintains cache availability.

4. Data encryption. Supports encryption at rest (including backups) and TLS encryption in transit. Integrates with AWS KMS for key management.

## Amazon DocumentDB

Amazon DocumentDB (with MongoDB compatibility) is fully managed service designed to handle semistructured data, which is information that doesn't conform to rigid relational schemas. Amazon DocumentDB is a MongoDB-compatible database, so it manages JSON-like documents with dynamic schemas.

Amazon DocumentDB can store, query, and index JSON data effortlessly, all while benefiting from automatic scaling, continuous backup, and enterprise-grade security features.

Use cases
Some examples of practical use cases for Amazon DocumentDB are content management systems, catalog and inventory management, and user profile and personalization systems.

## Benefits

1. MongoDB compatibility.  Amazon DocumentDB is fully compatible with MongoDB workloads and supports MongoDB APIs, drivers, and tools. This compatibility means that you can use existing MongoDB code and skills without modification. You can also migrate MongoDB applications to Amazon DocumentDB with minimal changes to their application code.

2. Performance and scalability. Amazon DocumentDB automatically scales storage up to 64 TB in 10 GB increments based on your application needs. It can handle millions of requests per second with consistent performance. It also provides the option to scale compute resources up or down as needed.

3. Increased read throughput. Amazon DocumentDB improves read throughput for high-volume applications by creating up to 15 replica instances that share underlying storage.

## AWS Backup

AWS Backup streamlines data protection across various AWS resources and on-premises deployments by providing a single dashboard for monitoring and managing backups. 

It eliminates the complexity of managing multiple backup strategies by supporting multiple storage types, including Amazon Elastic Block Store (Amazon EBS) volumes, Amazon Elastic File System (Amazon EFS) file systems, and various databases.

AWS Backup centralizes and automates data protection processes, improving consistency and reducing administrative overhead. It offers flexible scheduling options, encryption capabilities, and cross-Region backup support for enhanced disaster recovery.

Use cases
Some examples of practical use cases for AWS Backup are centralized disaster recovery, consistent backup policies for compliance requirements, and consolidating multiple backup processes through a single interface.

Benefits

1. Centralized backup management. AWS Backup provides a single dashboard to manage backups across multiple AWS services and accounts. You can monitor backup jobs, restore points, and verify compliance status from one central location to reduce operational complexity and potential configuration errors. You can create automated backup schedules that align with your business requirements and compliance needs. You can set up backup policies that automatically protect new resources as they're created.

2. Cross-region backup redundancy. AWS Backup enables automatic replication of backup data across different AWS Regions for disaster recovery purposes.

3. Streamlined regulatory compliance. AWS Backup maintains detailed audit logs and reports to demonstrate compliance with regulatory requirements. You can use it to enforce backup policies across your organization and track backup activities for security and compliance purposes.


## Amazon Neptune

Neptune is a fully managed, purpose-built graph database service that manages highly connected data sets, like those used in social networking applications.

It excels at understanding complex relationships that are difficult to identify in traditional relational databases like user connections, friend networks, and interaction patterns. Neptune can maintain high performance even as data complexity grows, and offers high availability with automatic failover and backups.

Use cases
Some examples of practical use cases for Amazon Neptune are social network user connection mapping, fraud detection systems, and search and recommendation systems.

## Benefits

1. Purpose-built for complex relationships. Neptune excels at storing and querying highly connected data using graph models. It supports both property graph and resource description framework, or RDF, models making it ideal for relationship mapping and pattern matching applications.

2. High performance and scalability. Neptune delivers consistent performance at scale, processing billions of relationships in milliseconds. Its purpose-built engine optimizes graph queries to enable fast traversal of connected data points at scale.