## Introduction to AI and Machine Learning

From e-commerce to medical research, high-quality data is used to analyze past events and innovate for the future. AI/ML and data analytics are two fields heavily involved in these processes.

## AI
Artificial Intelligence is a broad field focused on the development of intelligent computer systems capable of performing humanlike tasks.

## ML
Machine learning is a type of AI for training machines to perform complex tasks without explicit instructions.

Machine learning training finds the patterns hidden in vast amounts of historical data to produce an ML model. This ML model can then be applied to new data to make predictions or decisions based on the patterns it's learned.

## AI/ML on AWS

AI/ML helps solve for many common business use cases. At AWS, solutions for these common use cases, and others, are offered through the AWS AI/ML stack.

## Common ML business use cases
ML models power the Amazon.com e-commerce recommendations engine. But, ML can solve for lots of other business use cases, such as the following:
 - Predict trends, such as future stock prices.
 - Make decisions, like routing callers to the right department.
 - Detect anomalies, such as bank fraud.

## AWS AI/ML solutions
The AWS AI/ML stack is composed of the following three tiers of solutions:
 - AI services - pre-built models that are already trained to perform specific functions
 - ML services - a more customized approach with Amazon SageMaker AI where you build, train, and deploy your own ML models with fully managed infrastructure
 - ML frameworks and infrastructure - a completely custom approach to building models using purpose-built chips that integrate with popular ML frameworks 

 ## AWS AI/ML Solutions
Let's examine the three tiers of the AWS AI/ML stack in more detail. 

## Tier 1: Pre-built AWS AI services

The AWS AI services tier is made up of pre-built models that are already trained to perform specific functions. These ready-to-use, managed services can help you quickly solve for a variety of business use cases. 

Groups of AWS AI services:
 - Language services
 - Computer vision and search services
 - Conversational AI and personalization services

## Language services

AWS AI language services are great for when you need to interpret text or speech and transform it into something meaningful.

1. Amazon Comprehend
   Amazon Comprehend uses natural language processing to extract key insights from documents. It develops these insights by recognizing key phrases, language, sentiment, and other common elements in documents.
   Use cases: Content classification, customer sentiment analysis, and compliance monitoring

2. Amazon Polly
   Amazon Polly converts text into lifelike speech. It supports multiple languages, different genders, and a variety of accents.
   Use cases: Virtual assistants, e-learning applications, and accessibility enhancements for visually impaired users

3. Amazon Transcribe
   Amazon Transcribe converts speech into text. It supports multiple languages and offers features such as speaker identification, custom vocabulary, and real-time transcription.
   Use Cases: Customer call transcription, automated subtitling, and metadata generation for media content.

4. Amazon Translate
   Amazon Translate is a text translation service. This service is ideal for global communication because it supports real-time and batch text translation across multiple languages.
   Use cases: Document translation and multi-language application integrations

Computer vision and search services

These services are ideal for answering questions and gathering insights from various types of content sources such as documents, images, videos, and more.

1. Amazon Kendra
   Amazon Kendra uses natural language processing to search for answers within large amounts of enterprise content. Because it understands the context of a query, it can return more precise and relevant answers than just a list of documents with matching keywords.
   Use cases: Intelligent search, chatbots, and application search integration

2. Amazon Rekognition
   Amazon Rekognition is a video analysis service. It can identify objects, people, text, scenes, and activities within images and videos stored in Amazon Simple Storage Service (Amazon S3).
   Use cases: Content moderation, identity verification, media analysis, and home automation experiences.

3. Amazon Textract
   Amazon Textract detects and extracts typed and handwritten text found in documents, forms, and even tables within documents.
   Use cases: Financial, healthcare, and government form text extraction for quick processing 

Conversational AI and personalization services

With these services, users can interact with your apps through text and voice conversations. You can also present your customers with product recommendations personalized just for them.

1. Amazon Lex
   With Amazon Lex, you can add voice and text conversational interfaces to your applications. This service uses both natural language understanding (NLU) and automatic speech recognition (ASR) to create lifelike conversations.
   Use cases: Virtual assistants, natural language search for FAQs, and automated application bots

2. Amazon Personalize
   With Amazon Personalize, you can use historical data to build intelligent applications with personalized recommendations for your customers.
   Use cases: Personalized streaming, product, and trending recommendations

## Tier 2: ML services

The ML services tier provides a more customized approach for customers who want a bit more control over their ML solutions without having to manage infrastructure. SageMaker AI is a key offering in this tier.

## Amazon SageMaker AI

With this fully managed service, you can build, train, and deploy your own ML models without worrying about infrastructure.

The SageMaker AI integrated development environment (IDE) provides simplified access control and transparency over your ML projects. You can track model training experiments, visualize data, and debug and monitor your workflows all within one environment. 

SageMaker AI even offers access to hundreds of pre-trained models that you can deploy in a few quick steps.

Key benefits of SageMaker AI:

1. Choice of ML tools. Increase innovation with different tool choices. Data scientists can use the IDE, and business analysts can use the no-code interface.
2. Fully managed infrastructure. Focus on ML model development while SageMaker AI provides you with high-performance, cost-effective infrastructure.
3. Repeatable ML workflows. Automate and standardize your MLOps practices and governance across your enterprise to support transparency and auditability.

## Tier 3: ML frameworks and infrastructure

Some organizations have highly specialized needs that require complete control over the ML training process. They can use in-house expertise, ML frameworks, and AWS infrastructure to develop their own ML solutions.

## Core components
 1. ML frameworks
    An ML framework is a software library or tool that provides experienced ML practitioners with pre-built, optimized components for building machine learning models. AWS supports ML frameworks like PyTorch, Apache M-X Net, and TensorFlow.

 2. AWS ML infrastructure
    AWS ML infrastructure, such as ML-optimized Amazon Elastic Compute Cloud (Amazon EC2) instances, Amazon EMR, and Amazon Elastic Container Service (Amazon ECS), can support these custom solutions. These services provide high performance and flexibility for advanced ML workloads.

## Introduction to Generative AI on AWS

## Deep learning
Deep learning (DL) is a subset of machine learning where models are trained using layers of artificial neurons that mimic the human brain. Each layer of these neural networks summarizes and feeds information to the next layer until a final model is produced.

## Generative AI
Generative AI is a type of deep learning powered by extremely large ML models known as foundation models (FMs). FMs are pre-trained on vast collections of data. While traditional ML models are trained to perform singular tasks, FMs can be adapted to perform multiple tasks.

Large language models (LLMs), are a popular type of FM trained to use human language. Foundation models can also be used to create videos, images, music, and more.

## Generative AI on AWS
AWS offers the following types of generative AI solutions:
 - Amazon SageMaker JumpStart—An ML hub with FMs and pre-built ML solutions deployable with a few clicks
 - Amazon Bedrock—A fully managed service for adapting and deploying FMs from Amazon and other leading AI companies
 - Amazon Q—An interactive AI assistant that can be integrated with a company's information repositories.

## AWS Generative AI Solutions

## Amazon SageMaker JumpStart

SageMaker JumpStart is a machine learning hub within SageMaker AI that accelerates the process of building, training, and deploying ML models.

SageMaker JumpStart offers a library of pre-built ML solutions across various domains such as computer vision, NLP, and tabular data. These pre-trained models can be fine-tuned to suit your specific needs and deployed with just a few clicks.

Use cases:
1. Rapid ML model deployments. Quickly deploy pre-trained models without extensive ML expertise.
2. Custom fine-tuned solutions.Fine-tune pre-trained FMs with your domain-specific data.
3. ML experiments and prototypes. Compare performance for different models before committing to a specific approach.

## Amazon Bedrock

Amazon Bedrock is a fully managed service that was specifically designed for working with large foundation models and building generative AI applications.

It provides access to FMs from Amazon and leading AI startups, such as Claude and Stable Diffusion, all through a single unified API. With Amazon Bedrock, you can quickly experiment with FMs, fine-tune them with your own data, and seamlessly integrate them into your AWS applications.

Use cases:

 - Enterprise-grade generative AI.Build production-ready generative AI applications with enterprise-level security, privacy, and scalability.
 - Multimodal content generation. Create applications that can generate multiple content types, such as text and images.
 - Advanced conversational AI. Develop advanced conversational agents that connect to your enterprise data to provide accurate responses.

## Amazon Q products

Amazon Q is a generative AI assistant that can help companies streamline processes, get to decisions faster, and improve employee productivity. It can help every employee gain insights into their data and accelerate their tasks.

1. Amazon Q Business
   Amazon Q Business can answer pressing questions, help solve problems, and take actions using the data and expertise found in your company's information repositories. Amazon Q Business provides this tailored assistance with a secure connection to commonly used systems.
   Use cases: Information requests, automated workflows, and insight extraction

2. Amazon Q Business
   Amazon Q Business can answer pressing questions, help solve problems, and take actions using the data and expertise found in your company's information repositories. Amazon Q Business provides this tailored assistance with a secure connection to commonly used systems.
   Use cases: Information requests, automated workflows, and insight extraction

## Introduction to Data Analytics
Both AI/ML and data analytics are supported by good data. Let's review ways in which data is prepared and used by analysts.

## Data pipelines for ETL processes
Both AI/ML and traditional data analytics need clean and accessible data in a format that's usable by analytics tools and AI algorithms. ETL processes are used for this purpose. With ETL, you perform the following steps:
 1. Extract the data from various sources and store it.
 2. Transform it into a consistent, usable format for downstream tools to consume.
 3. Load it into a destination system, like a data warehouse or analytics platform.

Data pipelines are automated assembly lines used to make the ETL process efficient and repeatable. AWS has a suite of integrated services so you can build your own data pipelines.

## Data analytics

Data analytics is when analysts transform raw historical data to uncover valuable insights and trends. This traditional data analysis can apply to important use cases, such as the following:
 - Loan companies explaining lending decisions to customers.
 - Medical researchers analyzing clinical trial data through hypothesis testing.
 - Insurance companies making their risk assessment models transparent for regulators.

## AWS data pipeline services
Let's dive a bit deeper into the AWS services used in a typical AWS data pipeline.

## Data ingestion services

Data ingestion involves moving data from source systems into your chosen storage solution. Use real-time ingestion when the data is needed immediately. Use batch ingestion when some latency is tolerable.

1. Amazon Kinesis Data Streams
   You can use Kinesis Data Streams for real-time ingestion of terabytes of data from applications, streams, and sensors. This serverless service even provides automatic provisioning and scaling in on-demand mode.

2. Amazon Data Firehose
   Firehose is an option for data ingestion in near real-time. This fully managed service provides automatic provisioning and scaling. It also delivers data within seconds to data lakes, warehouses, and analytics services.

## Data storage services

Data can come from many different sources. To gain insights, data is commonly consolidated into a single location. There are two storage options for this. Flexible data lakes store vast amounts of raw data. Alternatively, the more structured data warehouses are optimized for business intelligence.
 1. Amazon S3
    Amazon S3 is a popular choice for data lakes. This object storage service can securely house virtually any amount of structured or unstructured data. Amazon S3 is also fully elastic, automatically scaling as you add and remove data.

 2. Amazon Redshift
    Amazon Redshift is a fully managed data warehouse service that can store petabytes of structured or semistructured data. With the scalability and pay-as-you-go pricing model, organizations can cost-effectively analyze large datasets.

## Data cataloging services

Cataloging your data with metadata provides an inventory of your organization's data.

Data cataloging is the process of creating a centralized, organized inventory of an organization's data assets—including databases, tables, and files—using metadata to enable, search, discovery, and governance


1. AWS Glue Data Catalog
   AWS Glue Data Catalog provides a centralized, scalable, and managed metadata repository that enhances data discovery. It improves the overall efficiency of data pipelines by delivering metadata to various data stores and analytics services.

## Data processing services


Data processing services clean and transform your data so it's ready to be analyzed.

 1. AWS Glue
    AWS Glue is a fully managed ETL service that makes data preparation simpler, faster, and cost effective. AWS Glue ETL jobs can use the AWS Glue Data Catalog to access metadata about data sources, which can help inform transformations defined in the ETL script.

 2. Amazon EMR
    Amazon EMR is ideal for large-scale data processing and organizations with existing big data expertise. It automatically handles infrastructure provisioning, cluster management, and scaling. Amazon EMR supports popular big data frameworks like Apache Spark, Apache Hadoop, and Apache Hive.

## Data analysis and visualization services

Queries and visualization tools help you to develop important insights about your data.

1. Amazon Athena
   With Athena, you can run SQL queries to analyze data in relational, nonrelational, object, and custom data sources. This fully managed serverless service can access data hosted on Amazon S3, on premises, or even in multi-cloud environments. It offers a cost-effective solution for data analysis because you only pay for the queries you run.

2. Amazon Redshift
   Amazon Redshift is a fully managed data warehouse solution. Its columnar storage and massively parallel processing architecture make it ideal for analyzing large datasets. You can use it to perform complex SQL queries on large datasets for frequent, high-performance analytical workloads.

3. Amazon QuickSight
   With QuickSight, both technical and non-technical users can quickly create modern interactive dashboards and reports from various data sources without managing infrastructure. Amazon Q in QuickSight provides natural language queries so business analysts and users can build, discover, and share meaningful insights in seconds.

4. Amazon OpenSearch Service
   With OpenSearch Service, you can search for relevant content through precise keyword matching or natural language queries. Unified dashboards provide real-time data visualization as you analyze and monitor logs, traces, and metrics for various applications.

## Data Analytics and AI/ML

Data analytics and AI/ML architecture diagram

Delivering customer data for analysis and ML model training

Let's review the solution discussed in the video. An e-commerce company uses an automated data pipeline to ingest, process, and deliver data to multiple stakeholders. As a result, data scientists and ML engineers can use the same data set for analysis and ML model training.

1. Make recommendationS. An e-commerce company uses an ML model to make product recommendations.
2. Store app data. An Amazon DynamoDB database stores the historical customer data gathered through the app. This makes sense for low-latency reads and writes but isn't ideal for ML model training.
3. Ingest data. Kinesis Data Streams ingests the data from DynamoDB. Amazon Data Firehose then aggregates the data.
4. Process datA. The data is in JSON format, so Firehose invokes an AWS Lambda function that transforms the data into .csv format.
5. Deliver data Firehose then delivers the data to the company's Amazon S3 data lake, where it is available for multiple consumers.
6. Catalog data. AWS Glue Data Catalog serves as a metadata repository with tables that describe the schema and location of the Amazon S3 data.
7. Perform data analytics. Data scientists use Athena to gather insights through queries.
8. Train model. SageMaker AI reads the same dataset directly from Amazon S3. ML engineers can then train new versions of the recommendation model using the latest information.