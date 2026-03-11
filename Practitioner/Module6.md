## Introduction to Storage

AWS provides many solutions for storing, accessing, managing, and backing up your data in the cloud. These virtual storage systems eliminate the need for physical hardware in your data center while offering the flexibility to scale as your needs change. 

AWS offers three distinct types of cloud storage to meet diverse requirements and application needs: 
  - block storage - Databases (MySQL, PostgreSQL), Operating system disks, Virtual machine boot volumes, Transactional applications, ERP systems
  - object storage - Images, videos, and audio files (media libraries), Website static assets (HTML, CSS, JS), Data lake raw data and analytics datasets, Application backups and archives, Machine learning training datasets, Log files from distributed systems
  - file storage -  Shared application configuration files, Home directories for enterprise users, Content management system (CMS) assets, Development environments and code repositories, Media rendering workloads (shared project files) ,Lift-and-shift enterprise applications

What dictates where you store data is mainly how the application needs to access the data. Each storage type is built for a different access pattern and structure.

1. How the data is accessed

| Storage            | How data is accessed                       |
| ------------------ | ------------------------------------------ |
| **Block storage**  | The OS accesses raw disk blocks            |
| **File storage**   | Applications access files using file paths |
| **Object storage** | Applications access data through APIs/HTTP |

2. Data structure

| Storage | Data structure                        |
| ------- | ------------------------------------- |
| Block   | Raw blocks (filesystem created by OS) |
| File    | Files and folders                     |
| Object  | Objects with metadata                 |

3. Performance requirements - Some applications need very low latency.

| Storage | Performance                           |
| ------- | ------------------------------------- |
| Block   | Very low latency (good for databases) |
| File    | Moderate                              |
| Object  | Higher latency                        |

4. Sharing requirements - Do multiple servers need to access the same data at the same time?

| Storage | Multi-server sharing             |
| ------- | -------------------------------- |
| Block   | Usually attached to one server   |
| File    | Designed for sharing             |
| Object  | Accessible from anywhere via API |

5. Size and scalability

Object storage is designed for massive scale.
Example:  
 - Billions of images → Amazon S3
 - Block storage is usually smaller volumes attached to instances.


## Block storage

Block storage provides persistent, low-latency block-level storage volumes that attach to EC2 instances like physical hard drives. 

Stores data in fixed-size blocks. Each block has its own address. Acts like a raw disk attached to a server. The OS formats it with a filesystem (ext4, xfs, etc.). Best for databases and low-latency applications.

Block storage volumes can be encrypted, backed up via snapshots, and modified while in use without disrupting the instance. 

AWS offers two primary block storage services: 

 - Amazon EC2 instance store. An unmanaged non-persistent, high-performance block storage directly attached to EC2 instances for temporary data.
 - Amazon Elastic Block Store (EBS). A managed service that provides persistent block storage volumes for EC2 instances, offering various types for different workloads

## Object storage

Object storage is a data storage architecture that manages data as objects in a flat address space. 

Stores data as objects (file + metadata + unique ID). Accessed via API (HTTP/HTTPS), not mounted as a disk. Flat structure (no real folders). Highly scalable and durable. Best for backups, static files, media, logs.

It offers unlimited scalability so you can store vast amounts of unstructured data without worrying about capacity constraints. 

Object storage provides enhanced metadata capabilities to provide more efficient data management, search, and analytics across massive datasets.

The following is the primary AWS object storage service:
 - Amazon Simple Storage Service (S3). A fully managed scalable object storage service for storing and retrieving any amount of data from anywhere.

## File storage

AWS file storage services provide shared file systems accessible over networks, so multiple users and applications can access the same data simultaneously. 

Stores data in a hierarchical filesystem (folders/directories). Accessed via network protocols like NFS or SMB. Multiple servers can mount it simultaneously. Best for shared storage, legacy apps.

They offer scalability and flexibility so you can expand storage capacity as needs grow without managing physical infrastructure. 

AWS offers two primary file storage services:
 - Amazon Elastic File System (EFS). A fully managed, scalable NFS file system for use with AWS Cloud services and on-premises resources.
 - Amazon FSx. A fully managed file storage services for popular file systems like Windows, Lustre, and NetApp ONTAP.

## Additional storage services
 - AWS Storage Gateway. A fully managed, hybrid-cloud storage service that provides on-premises access to virtually unlimited cloud storage.
 - AWS Elastic Disaster Recovery. A fully managed service that streamlines the recovery of your physical, virtual, and cloud-based servers into AWS.

## AWS shared responsibility

AWS storage services

The AWS shared responsibility model groups services into three categories based on the ownership of administrative tasks. These categories are fully managed, managed, and unmanaged.

1. For fully managed storage services, AWS is responsible for everything from the hardware and infrastructure up through the entire storage stack. This includes data durability, availability, encryption at rest, and replication. Customers are only responsible for data management, access controls, and proper service configuration.

2. For managed storage services, AWS manages the underlying storage infrastructure, hardware redundancy, and volume replication. Customers are responsible for data backup strategies, encryption configuration, volume performance optimization, and capacity planning.

3. For unmanaged storage services, customers takes full responsibility for data management, backup/recovery, encryption, performance optimization, and durability. AWS only maintains the underlying physical hardware and network infrastructure.

## EC2 Instance Store and Amazon Elastic Block Store (Amazon EBS)

## Amazon EC2 instance store

Amazon EC2 instance store isn't a stand-alone AWS block storage service. Rather, it refers to the block-level storage that is physically attached to the EC2 instance host computer. 

Depending on the type of instance, EC2 instance store might come attached as the default storage. Since its data is lost when an instance is stopped or terminated, EC2 instance store is best for temporary memory-based storage needs like buffers, caches, and scratch data. It is not recommended for applications that require data retention.

Key takeaway: no data persistence

An Amazon EC2 instance store provides temporary block-level storage for an Amazon EC2 instance. This means that if you stop or terminate an Amazon EC2 instance, all the data written to the attached instance store is deleted.

Benefits

 - Automatically available storage. Instance store volumes come automatically attached to many EC2 instance types physically, providing temporary block-level storage at no additional cost. 

 - Cost Effective. Because EC2 instance store is included in the EC2 instance price, you don't have to pay any additional fees for storage. 

 - High performance. EC2 instance store offers extremely low-latency storage directly attached to the host server of your EC2 instance. This proximity means exceptionally high I/O performance, making it ideal for temporary storage of data requiring fast processing.

## Amazon Elastic Block Store (EBS)

Amazon EBS provides persistent block-level storage volumes for use with Amazon EC2 instances. EBS volumes act like external hard drives, offering consistent and low-latency performance for workloads like databases and file systems.

EBS volumes can be conveniently backed up, resized, and attached to different EC2 instances. 

To create an EBS volume, you define the configuration for things like volume size and type. After the volume has been created, it can be attached to an Amazon EC2 instance. Because EBS volumes are for data that needs to persist, it’s important to back up the data. It's recommended that you take incremental backups of EBS volumes by creating Amazon EBS snapshots.

Use cases
Some practical use cases of Amazon EBS include database hosting, backup storage for applications, and rapid deployment of development environments using volume snapshots.

Benefits
EBS volumes support data portability through their ability to detach and reattach to instances as needed. There are many practical reasons you might choose to do this.

 - Data migration. EBS volumes can be easily migrated between Availability Zones using snapshots. The snapshots provide a simple way to move data across regions or create copies.
 - Insance type changes. Since EBS volumes remain independent of EC2 instances, it's not complicated to attach them to different instance types. This flexibility lets you upgrade or downgrade instances without losing data.
 - Distater recovery. EBS snapshots provide reliable backup solutions that can be restored in different regions during emergencies. Regular automated snapshots ensure your data remains protected and quickly recoverable.
 - Cost optimization. EBS volumes can be modified to different types and sizes to match actual usage patterns. You can switch between storage types or adjust capacity without downtime.
 - Performance tuning. Amazon EBS offers various volume types to match different workload requirements and IOPS needs. You can adjust volume performance characteristics on the fly to meet changing application demands

## Amazon Elastic Block Store (Amazon EBS) Data Lifecycle

Amazon EBS data lifecycle management involves creating, backing up, and deleting volumes and snapshots. This process optimizes storage costs and helps to ensure data protection. 

## EBS Snapshots

EBS snapshots are point-in-time backups of EBS volume. They can be used for disaster recovery, data migration, volume resizing, and for creating consistent backups of production workloads. EBS snapshots are incremental, so they only save the blocks on the volume that have changed after your most recent snapshot.

EBS snapshots can be used to create multiple new volumes, and new volumes created from a snapshot are an exact copy of the original volume at the time the snapshot was taken. Snapshots of EBS volumes are stored redundantly in multiple Availability Zones using Amazon S3.  

## Working with EBS snapshots

In keeping with the AWS shared responsibility model, as the customer, you are responsible for scheduling and managing regular EBS snapshots as part of your backup strategy. This includes monitoring snapshot costs and deleting unnecessary snapshots to avoid excessive charges. You also need to make sure sensitive data within snapshots is encrypted, verify snapshot integrity, and test restoration procedures regularly.

The following illustration shows how EBS snapshots are created from an EBS volume over time.

 -  Initial snapshot. When you create the first snapshot of an EBS volume, a full copy of all the data on the volume at that point in time is included. This initial snapshot serves as the baseline and contains all the data blocks that were in use on the volume.

 - Subsequent incremental snapshots. For all snapshots after the initial one, only the blocks that have changed since the last snapshot are captured and stored. These are called incremental snapshots. They're much smaller and faster to create than full snapshots. Each incremental snapshot contains references to the previous snapshots, creating a chain that allows for point-in-time recovery.

 - Snapshot consolidation and management. Despite being incremental, each snapshot appears as a full point-in-time copy of your volume. The relationship between multiple snapshots of the same volume are managed automatically. When you delete a snapshot, only the data unique to that snapshot is removed. Data referenced by other snapshots is preserved.

## Benefits
-  Data protection and recovery. Snapshots enable fast data recovery from corruption, accidental deletion, or system failures using point-in-time backups.  
- Operational flexibility. Snapshots enable operations like cross-Region data migration, volume resizing, volume cloning, and sharing data across AWS accounts.
- Cost effective. Snapshots use incremental backup technology, storing only changed blocks after the initial backup, reducing storage costs and backup time.

## Amazon Data Lifecycle Manager

You can automate the creation, retention, and deletion of EBS snapshots using Amazon Data Lifecycle Manager. Amazon Data Lifecycle Manager can schedule snapshots during off-peak hours to minimize performance impact and automatically delete outdated backups to control storage costs. It's particularly valuable for large-scale deployments where manual snapshot management would be time-consuming and error-prone.

Workflow
 1.  Create an EBS snapshots policy. Create an EBS snapshots policy using the Amazon EC2 console, API calls, AWS Command Line Interface (AWS CLI), SDKs, or AWS CloudFormation.
 2. Select target resource type. Choose either an EBS volume or an EC2 instance as the target for the snapshot.
 3. Exclude volumes. Narrow down the data to be included in the snapshot by choosing options to exclude either the root volume or data volumes.
 4. Set custom schedules. Automate the creation, retention, and deletion of EBS snapshots by setting up custom schedules.
 5. Apply additional actions. Before finalizing the policy, you can apply additional actions. These include configuring elements of the snapshots like tags, snapshot archiving, Amazon EBS fast snapshot restore, cross-Region copying, and cross-account sharing.

 ## Amazon Simple Storage Service (Amazon S3)

Amazon S3 is a fully managed, highly-available object storage service for storing and retrieving any amount of data as objects. It offers 99.999999999 percent durability, meaning your data is highly protected against loss, and offers features like versioning, lifecycle management, and various storage classes to optimize costs.

Amazon S3 stores files as objects in containers known as buckets, and each object can range in size from a few bytes to several terabytes. It integrates seamlessly with other AWS services and supports a wide range of use cases, from basic backups to complex data lakes.

## Elements

- S3 objects
  An object in Amazon S3 is the fundamental unit of data storage. When you upload a file to Amazon S3, it becomes an object and is stored durably across multiple facilities within your chosen Region.

  Each object typically includes the data itself, metadata, and a unique identifier, or key. Objects can be of any file type, such as images, videos, documents, or application data, and can range in size from a few bytes to several terabytes.
  
  Each Amazon S3 object is uniquely identified within a bucket by its key, which is essentially its file name. Objects also have properties like version ID, access control information, and user-defined metadata.

- S3 buckets
  An S3 bucket is a container for storing objects in Amazon S3. Buckets have a globally unique name across all of AWS, which helps to identify and organize your stored data.
  
  Buckets serve as the basic unit for access control and can hold a virtually unlimited number of objects. They play a crucial role in data management by making it possible to group related objects and apply policies at the bucket level.
  
  When creating a bucket, you specify its name and the Region where it will reside. Buckets can be configured with various settings, including versioning, logging, and access permissions.

Benefits

1. Virtually unlimited storage. Amazon S3 has no fixed storage limit, scaling automatically to accommodate any amount of data you need to store. Since you only pay for the storage you use, it's a cost-effective solution for growing data needs.

2. Object lifecycle management. Amazon S3 lifecycle policies automatically move objects between storage classes based on your defined rules, optimizing costs over time. You can set up automatic transitions and expirations to manage data throughout its entire lifecycle.

3. Broad range of use cases. Amazon S3 supports a wide range of use cases for both cloud-based applications and traditional on-premises workloads. Amazon S3 is commonly used for content distribution, hosting static websites, and delivering media files. It's also a popular choice for things like application data storage, archiving, data lakes, and compliance-driven data retention.

## Security and privacy management

Everything you store in Amazon S3 is private by default. You must explicitly grant permissions to access these resources. If you want your Amazon S3 data to be available to everyone on the internet, you can choose to make your buckets and objects public. To more granularly define who can do what with your Amazon S3 resources, Amazon S3 provides several security management features.

 - Bucket policies. Amazon S3 bucket policies are resource-based policies that can only be attached to S3 buckets. An S3 bucket policy specifies which actions are allowed or denied on the bucket, in addition to every object in that bucket.

 - Identity based policies. Permissions that control what actions users, groups, or roles can perform on S3 resources are configured using identity-based policies. 

 - Amazon S3 provides encryption capabilities to protect data both at rest and in transit. These encryption features help maintain data confidentiality and comply with various security standards and regulations. These capabilities are as follows:
    - Encryption at rest secures data stored in S3 buckets, preventing unauthorized access to stored objects.
    - Encryption in transit safeguards data traveling to and from Amazon S3, maintaining secure communication between clients and the service.

 ## Amazon S3 Storage Classes and S3 Lifecycle

Amazon S3 offers various storage classes to suit a variety of workloads with specific performance, access, resiliency, and cost requirements.

They're also designed to address data residency requirements, unpredictable access patterns, archival storage needs, and offer the most cost-effective options for different access patterns.

1. S3 standard - S3 Standard is considered general-purpose storage for cloud applications, dynamic websites, content distribution, mobile and gaming applications, and big data analytics. When you upload an object to Amazon S3 without specifying a storage class, the object is added to S3 Standard by default.

2. S3 Intelligent-Tiering. This tier is useful if your data has unknown or changing access patterns. S3 Intelligent-Tiering stores objects in three tiers: a frequent access tier, an infrequent access tier, and an archive instant access tier. Amazon S3 monitors access patterns of your data and automatically moves your data to the most cost-effective storage tier based on frequency of access.

3. S3 Standard Infrequent Access (Standard-IA). S3 Standard-Infrequent Access (S3 Standard-IA) is for data that is accessed less frequently but requires rapid access when needed. S3 Standard-IA offers the high durability, high throughput, and low latency of S3 Standard, with a low per-GiB storage price and per-GiB retrieval fee. This storage tier is ideal if you want to store long-term backups, disaster recovery files, and so on.

4. S3 One Zone Infrequent Access (One Zone-IA). S3 One Zone-Infrequent Access (S3 One Zone-IA) stores data in a single Availability Zone, reducing costs compared to S3 Standard-IA, which uses three zones. This storage class suits customers seeking affordable storage for infrequently accessed data without high availability needs. It's perfect for storing secondary backups or easily recreatable data.

5. S3 Express One Zone. S3 Express One Zone stores data in a single Availability Zone. It was purpose-built to deliver consistent single-digit millisecond data access for your most frequently accessed data and latency-sensitive applications. S3 Express One Zone delivers data access speed up to 10x faster and request costs up to 80% lower than S3 Standard.

6. S3 Glacier Instant Retrieval. Use S3 Glacier Instant Retrieval for archiving data that is rarely accessed and requires millisecond retrieval. Data stored in this storage class offers a cost savings of up to 68 percent compared to the S3 Standard-IA storage class, with the same latency and throughput performance.

7. S3 Glacier Flexible Retrieval. S3 Glacier Flexible Retrieval offers low-cost storage for archived data that is accessed 1–2 times per year. With S3 Glacier Flexible Retrieval, your data can be accessed in as little as 1–5 minutes using an expedited retrieval. You can also request bulk retrievals in up to 5–12 hours at no additional cost. It's an ideal solution for backup, disaster recovery, offsite data storage needs, and for when some data occasionally must be retrieved in minutes.

8. S3 Glacier Deep Archive. S3 Glacier Deep Archive is the lowest-cost Amazon S3 storage class. It supports long-term retention and digital preservation for data that might be accessed once or twice per year. Data stored in the S3 Glacier Deep Archive storage class has a default retrieval time of 12 hours. It is designed for customers that retain data sets for 7–10 years or longer, to meet regulatory compliance requirements. Examples include those in highly regulated industries, such as financial services, healthcare, and public sectors.

9. S3 Outposts - Amazon S3 Outposts delivers object storage to your on-premises AWS Outposts environment using Amazon S3 APIs and features, and serves workloads with local data residency requirements. It also helps maintain optimal performance when data must remain in close proximity to on-premises applications. 

## S3 Lifecycle

To avoid manually managing your object storage tier configurations, you can use S3 Lifecycle configurations to automate the process. When you define a lifecycle configuration for an object or group of objects, you can choose to automate between two types of actions, as follows:

 - Transition actions: define when objects should transition to another storage class.
 - Expiration actions: define when objects expire and should be permanently deleted.

For example, you might transition objects to S3 Standard-IA storage class 30 days after you create them. Or you might archive objects to the S3 Glacier Deep Archive storage class 1 year after creating them.

1. After 30 days without being accessed, the object is moved from the Amazon S3 Standard storage class to the Amazon S3 Standard-IA storage class.
2. After the object has been in the S3 Standard-IA storage class for 60 days without being accessed, it's moved to the Amazon S3 Glacier Instant Retrieval storage class.
3. Finally, after 365 days in the Amazon S3 Glacier Instant Retrieval storage class without being accessed, the object is deleted.

## Use cases

The following situations are candidates for the use of S3 lifecycle configuration rules:
 - Periodic logs: If you upload periodic logs to a bucket, your application might need them for a week or a month. After that, you might want to delete them.
 - Data that changes in access frequency: Some documents are frequently accessed for a limited period of time. After that, they are infrequently accessed. At some point, you might not need real-time access to them. However, your organization or regulations might require you to archive them for a specific period. After that, you can delete them.

 ## Amazon Elastic File System (EFS)

Amazon EFS is a fully managed, scalable file storage service for use with AWS cloud services and on-premises resources. It operates using the Linux Network File System (NFS) protocol, and automatically scales to petabytes as you add or remove files without disrupting applications. EFS is designed to support a wide variety of workloads and can be accessed by multiple EC2 instances simultaneously.

## Benefits 

1. Multi AZ redundancy. Amazon EFS automatically replicates data across multiple Availability Zones in a region for high availability. This built-in redundancy protects against AZ failures and provides continuous access to your file systems.

2. Shared access. Amazon EFS supports thousands of concurrent NFS connections, so multiple EC2 instances can access the same file system simultaneously. This shared access model makes EFS ideal for collaborative workloads and distributed applications.

3. Elastic storage. Amazon EFS automatically grows and shrinks as you add and remove files, with no need to provision or manage storage capacity. And since you only pay for the storage you use, it's cost-effective for varying workload demands.

Amazon EFS storage classes

With Amazon EFS, you can create and configure file systems quickly without any minimum fee or setup cost. You pay only for the storage used and you can choose from a range of storage classes designed to fit your use case.

1. The EFS Standard and EFS Standard-Infrequent Access (Standard-IA) storage classes offer Multi-AZ resilience and the highest levels of durability and availability. They have a higher cost associated with them due to higher availability and durability.

2. The EFS One Zone and EFS One Zone-Infrequent Access (EFS One Zone-IA) provide additional savings by saving your data in a single Availability Zone. By using just one Availability Zone, you can reduce your storage costs when compared to the Standard EFS storage classes.

3. The EFS Archive storage class is cost-optimized for data that is accessed only a few times a year or less and that does not need the sub-millisecond latencies of EFS Standard. EFS Archive offers a storage price up to 50% lower compared to EFS Infrequent Access, providing a more cost-optimized experience for cold, rarely-accessed data.

## Amazon EFS data lifecycle

You can further optimize Amazon EFS storage costs by automatically moving data between storage classes based on usage patterns.

1. Transition to IA. This policy instructs lifecycle management when to move files into the Infrequent Access storage, which is cost-optimized for data that is accessed only a few times each quarter. By default, files that are not accessed in Standard storage for 30 days are transitioned into IA.

2. Transition to Archive. This policy instructs lifecycle management when to move files into the Archive storage class, which is cost-optimized for data that is accessed only a few times each year or less. By default, files that are not accessed in Standard storage for 90 days are transitioned into Archive.

3. Transition to Standard. This policy instructs lifecycle management whether to transition files out of IA or Archive and back into Standard storage when the files are accessed in the IA or Archive storage. By default, files are not moved back to Standard storage, and they remain in the IA or Archive storage class when they are accessed.

## Amazon FSx

Amazon FSx makes it convenient and cost effective to launch, run, and scale feature-rich, high-performance file systems in the cloud. 

It supports a wide range of workloads with its reliability, security, scalability, and broad set of capabilities. 

Compared to Amazon EFS, which focuses on the Network File System (NFS) compatibility, Amazon FSx supports multiple filesystem protocols, including Windows File Server, Lustre, OpenZFS, and NetAPP ONTAP.

Amazon FSx is built on the latest AWS compute, networking, and disk technologies to provide high performance and lower total cost of ownership (TCO). As a fully managed service, it handles hardware provisioning, patching, and backups.

## Amazon FSx benefits


1. Fie system integration. Amazon FSx supports industry-standard file system protocols, allowing convenient integration with your existing applications, workflows, and development tools.
2. Managed inrastructure.  Amazon FSx reduces the complexity of managing infrastructure while delivering the features and capabilities of traditional file systems.
3. Scalable storage. Amazon FSx adjusts resources dynamically, eliminating the need for complex capacity planning and manual infrastructure management.
4. Cost effective. Amazon FSx has a pricing model and automated tiering options that optimize costs by charging only for used storage and moving infrequently accessed data to lower-cost tiers.


## Amazon FSx file systems

## Amazon FSx for Windows File Server

Amazon FSx for Windows File Server provides fully managed shared storage built on Windows Server. It delivers a wide range of data access, data management, and administrative capabilities.
Use cases include the following:
 - Migrate Windows file servers to AWS.
 - Accelerate hybrid workloads.
 - Reduce SQL Server deployment cost.
 - Streamline virtual desktops and streaming.

## Amazon FSx for NetApp ONTAP

Amazon FSx for NetApp ONTAP provides fully managed shared storage in the AWS Cloud with the popular data access and management capabilities of ONTAP.
Use cases include the following:
 - Migrate workloads to AWS seamlessly.
 - Build modern applications.
 - Modernize your data management.
 - Streamline business continuity.

## Amazon FSx for OpenZFS

Amazon FSx for OpenZFS provides fully managed shared file storage built on the OpenZFS file system and accessible through the NFS protocol (v3, v4, v4.1, and v4.2).
Use cases include the following:
 - Migrate workloads to AWS seamlessly.
 - Deliver insights faster for data analytics workloads.
 - Accelerate content management.
 - Increase dev/test velocity.

## Amazon FSx for Lustre

Amazon FSx for Lustre provides fully managed shared storage with the scalability and performance of the popular Lustre file system.

Use cases include the following:
 - Accelerate machine learning (ML).
 - Enable high performance computing (HPC).
 - Unlock big data analytics.
 - Increase media workload agility.

## AWS Storage Gateway

Storage Gateway is a hybrid cloud storage service that makes it possible to seamlessly integrate on-premises environments with AWS Cloud storage. 

You can use it to extend your local storage to the cloud while maintaining low-latency access to frequently used data.

You can use Storage Gateway to streamline storage management and reduce costs for practical hybrid cloud storage use cases. 
These include moving backups to the cloud, using on-premises file shares backed by cloud storage, and providing low-latency access to data in AWS for on-premises applications.

Benefits

 - Seamless integration. Storage Gateway enables smooth connectivity between on-premises applications and AWS Cloud storage, preserving existing workflows and minimizing disruption.
 - Improved data management. Storage Gateway provides centralized management of hybrid storage environments, enhancing accessibility, security, and compliance.
 - Local caching. Storage Gateway locally keeps frequently accessed data for quick access while managing less-used data in the cloud.
 - Cost optimization. Storage Gateway reduces on-premises storage costs by using cloud storage for data archiving, backup, and disaster recovery purposes.

## Gateway types

Storage Gateway offers three distinct types of gateways to meet different hybrid storage needs.

 - Amazon S3 File Gateway
   Amazon S3 File Gateway bridges your local environment with Amazon S3. It provides on-premises applications with access to virtually unlimited cloud storage through familiar file protocols. S3 File Gateway makes it possible to store and retrieve cloud objects using familiar file operations.
   
   When you deploy an S3 File Gateway, it appears to your local systems as a standard file server. Files written to this server are automatically uploaded to Amazon S3 while maintaining local access to recently used data through intelligent caching. This means your applications can continue working with files as they always have while the actual data is securely stored in the AWS Cloud.

 - Volume Gateway
   With Volume Gateway, you create virtual storage volumes while maintaining local access to your data. It essentially functions as a bridge between your on-premises infrastructure and AWS Cloud storage by presenting your cloud data as iSCSI volumes that can be mounted by your existing applications.
   
   Volume Gateway operates in two main configurations:
    - Cached volume mode stores primary data in the cloud while frequently accessed data is cached locally for low-latency access.
    - Stored volume mode locally keeps your complete dataset while asynchronously backing it up to the cloud as EBS snapshots.

 - Tape Gateway
   Tape Gateway makes it possible to replace physical tape infrastructure with virtual tape capabilities while benefitting from the durability and scalability of AWS Cloud storage. Tape Gateway provides an interface that works with existing tape backup software, making the transition from physical tapes to cloud storage seamless.
   
   When you deploy a Tape Gateway, it presents itself to your backup applications as standard tape hardware. Your backup software writes data to these virtual tapes just as it would to physical tapes and stored in Amazon S3. You can also configure Tape Gateway to automatically transition less frequently accessed data to a more cost-effective storage class for long-term retention.

## AWS Elastic Disaster Recovery

Elastic Disaster Recovery replicates critical workloads to AWS with minimal downtime. Your servers' block-level data is continuously replicated to AWS, making it ideal for uses that require robust disaster recovery solutions. 

What actually happens. Your on-prem server disks are continuously replicated to AWS storage. The data is stored in a staging area in AWS.If a disaster happens, AWS launches an EC2 instance from that replicated data.

It supports both physical and virtual servers to enable rapid recovery during disruptions, which is particularly valuable for industries like healthcare where system availability is crucial.

You can use Elastic Disaster Recovery to reduce downtimes and data loss while eliminating the costs associated with maintaining secondary data centers. 

It also offers non-disruptive disaster recovery testing, meaning it's capable of quickly launching recovery instances when needed.

Benefits

1. Business Reliance - Maintain business operations with continuous block-level data replication and the ability to recover workloads within minutes during disruptions.
2. Streamlined disaster recovery. Automate disaster recovery processes through an intuitive console, reducing complex manual configurations and minimizing the risk of human error.
3. Cost optimization. Eliminate expensive secondary data centers and pay only for what you use, with minimal upfront investment and no standby infrastructure costs.


Use cases

1. Healthcare data protection. Hospital systems could use Elastic Disaster Recovery to maintain compliance while protecting patient records by replicating on-premises servers to AWS. This ensures that critical medical data remains accessible during system outages. Regular disaster recovery testing helps validate their recovery procedures and meet strict healthcare regulations.

2. Financial services continuity. A regional bank could implement Elastic Disaster Recovery to protect their core banking applications by continuously replicating their transaction processing systems. This facilitates quick recovery if their primary data center fails and helps maintain customer trust and regulatory compliance.

3. Manufacturing operations recovery. A global manufacturer could employ Elastic Disaster Recovery to protect their production planning systems. By replicating factory management servers to AWS, they can ensure minimal disruption to supply chain operations during disasters. Regular failover testing validates the recovery strategy. 

