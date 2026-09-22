## Disaster Recovery & Migrations

## Disaster Recovery Overview

Any event that has a negative impact on a company’s business continuity or finances is a disaster

Disaster recovery (DR) is about preparing for and recovering from a disaster

What kind of disaster recovery?
 - On-premise => On-premise: traditional DR, and very expensive
 - On-premise => AWS Cloud: hybrid recovery
 - AWS Cloud Region A => AWS Cloud Region B

Need to define two terms:
 - RPO: Recovery Point Objective
 - RTO: Recovery Time Objective

## RPO and RTO

![Image](../saa/rtorpo.png)

## Disaster Recovery Strategies

• Backup and Restore

• Pilot Light

• Warm Standby

• Hot Site / Multi Site Approach

![Image](../saa/dr_strategies.png)

## Backup and Restore (High RPO)
![Imahge](../saa/backuprestore.png)

## Disaster Recovery – Pilot Light

• A small version of the app is always running in the cloud

• Useful for the critical core (pilot light)

• Very similar to Backup and Restore

• Faster than Backup and Restore as critical systems are already up

![Image](../saa/dr_pilot_light.png)

## Warm Standby

• Full system is up and running, but at minimum size

• Upon disaster, we can scale to production load

![Image](../saa/warm_standby.png)

## Multi Site / Hot Site Approach

• Very low RTO (minutes or seconds) – very expensive
• Full Production Scale is running AWS and On Premise

![Image](../saa/mutli_site_hot_site.png)

## All AWS Multi Region

![Image](../saa/aws_multi_region.png)

## Disaster Recovery Tips

Backup
 - EBS Snapshots, RDS automated backups / Snapshots, etc…
 - Regular pushes to S3 / S3 IA / Glacier, Lifecycle Policy, Cross Region Replication
 - From On-Premise: Snowball or Storage Gateway

High Availability
 - Use Route53 to migrate DNS over from Region to Region
 - RDS Multi-AZ, ElastiCache Multi-AZ, EFS, S3
 - Site to Site VPN as a recovery from Direct Connect

Replication
 - RDS Replication (Cross Region), AWS Aurora + Global Databases
 - Database replication from on-premises to RDS
 - Storage Gateway

Automation
 - CloudFormation / Elastic Beanstalk to re-create a whole new environment
 - Recover / Reboot EC2 instances with CloudWatch if alarms fail
 - AWS Lambda functions for customized automations

Chaos
 - Netflix has a “simian-army” randomly terminating EC2

 
## AWS Elastic Disaster Recovery (DRS)

• Used to be named “CloudEndure Disaster Recovery”

• Quickly and easily recover your physical, virtual, and cloud-based servers into AWS

• Example: protect your most critical databases (including Oracle, MySQL, and SQL Server), enterprise apps (SAP), protect your data from ransomware attacks, …

• Continuous block-level replication for your servers

![Image](../saa/elastic_drs.png)

## DMS – Database Migration Service

Quickly and securely migrate databases to AWS, resilient, self healing

The source database remains available during the migration

Supports:
 - Homogeneous migrations: ex Oracle to Oracle
 - Heterogeneous migrations: ex Microsoft SQL Server to Aurora

Continuous Data Replication using CDC

You must create an EC2 instance to perform the replication tasks

![Image](../saa/dms.png)

## DMS Sources and Targets

| **AWS DMS Sources**                                                                               | **AWS DMS Targets**                                                                 |
| ------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| On-Premises & EC2 databases: Oracle, MS SQL Server, MySQL, MariaDB, PostgreSQL, MongoDB, SAP, DB2 | On-Premises & EC2 databases: Oracle, MS SQL Server, MySQL, MariaDB, PostgreSQL, SAP |
| Azure SQL Database                                                                                | Amazon RDS                                                                          |
| Amazon RDS (all, including Aurora)                                                                | Redshift                                                                            |
| Amazon S3                                                                                         | DynamoDB                                                                            |
| DocumentDB                                                                                        | S3                                                                                  |
|                                                                                                   | OpenSearch Service                                                                  |
|                                                                                                   | Kinesis Data Streams                                                                |
|                                                                                                   | Apache Kafka                                                                        |
|                                                                                                   | DocumentDB & Amazon Neptune                                                         |
|                                                                                                   | Redis & Babelfish                                                                   |


## AWS Schema Conversion Tool (SCT)

Convert your Database’s Schema from one engine to another

Example OLTP: (SQL Server or Oracle) to MySQL, PostgreSQL, Aurora

Example OLAP: (Teradata or Oracle) to Amazon Redshift

Prefer compute-intensive instances to optimize data conversions

![Image](../saa/aws_sct.png)

You do not need to use SCT if you are migrating the same DB engine
 - Ex: On-Premise PostgreSQL => RDS PostgreSQL
 - The DB engine is still PostgreSQL (RDS is the platform)

## DMS - Continuous Replication

![Image](../saa/dms_continuous_replication.png)

## AWS DMS – Multi-AZ Deployment

• When Multi-AZ Enabled, DMS provisions and maintains a synchronously stand replica in a different AZ

Advantages:
 - Provides Data Redundancy
 - Eliminates I/O freezes
 - Minimizes latency spikes

![Image](../saa/aws_dmz_multi_az.png)

## RDS & Aurora MySQL Migrations

RDS MySQL to Aurora MySQL
 - Option 1: DB Snapshots from RDS MySQL restored as MySQL Aurora DB
 - Option 2: Create an Aurora Read Replica from your RDS MySQL, and when the replication lag is 0, promote it as its own DB cluster (can take time and cost $)

External MySQL to Aurora MySQL
 - Option 1:
   - Use Percona XtraBackup to create a file backup in Amazon S3
   - Create an Aurora MySQL DB from Amazon S3

 - Option 2:
   - Create an Aurora MySQL DB
   - Use the mysqldump utility to migrate MySQL into Aurora
   (slower than S3 method)

Use DMS if both databases are up and running

![Image](../saa/rds_aurora_migrations.png)

## RDS & Aurora PostgreSQL Migrations

RDS PostgreSQL to Aurora PostgreSQL
 - Option 1: DB Snapshots from RDS PostgreSQL restored as PostgreSQL Aurora DB
 - Option 2: Create an Aurora Read Replica from your RDS PostgreSQL, and when the replication lag is 0, promote it as its own DB cluster (can take time and cost $)

External PostgreSQL to Aurora PostgreSQL
 - Create a backup and put it in Amazon S3
 - Import it using the aws_s3 Aurora extension

Use DMS if both databases are up and running

![Image](../saa/rds_aurora_postgres_migrations.png)

## On-Premise strategy with AWS

Ability to download Amazon Linux 2 AMI as a VM (.iso format)
 - VMWare, KVM, VirtualBox (Oracle VM), Microsoft Hyper-V

VM Import / Export
 - Migrate existing applications into EC2
 - Create a DR repository strategy for your on-premises VMs
 - Can export back the VMs from EC2 to on-premises

AWS Application Discovery Service
 - Gather information about your on-premises servers to plan a migration
 - Server utilization and dependency mappings
 - Track with AWS Migration Hub

AWS Database Migration Service (DMS)
 - replicate On-premise => AWS , AWS => AWS, AWS => On-premise
 - Works with various database technologies (Oracle, MySQL, DynamoDB, etc..)

AWS Application Migration Service (MGN)
 - Incremental replication of on-premises live servers to AWS