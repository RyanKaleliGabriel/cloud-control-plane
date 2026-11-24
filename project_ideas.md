## Project ideas for practise

## PART ONE Getting started, IAM, EC2 INTRO, EC2 SAA LEVEL

# Monday

## 01 IAM


1. Set a IAM password policy for new users
    - Set a minimum password length
    - Require specific character types:
      - including uppercase letters
      - lowercase letters
      - numbers
      - an alphanumeric character
    -  Turn on password expiration
    -  Allow users to change their own password
    - Prevent password reuse
   Create a user and a user_group and the iam_group should have administrator access. Add the user to that group. Set up MFA for that user using google authenticator


2. Create and configure access key for aws cli with  ```aws configure```. Run a couple of commands in cloud shell
    - List iam users ```aws iam list-users```
    - List EC2 instances ```aws ec2 describe-instances```
    - List EC2 instances in a specifc region ```aws ec2 describe-instances --region us-west-2```
    - Identify my current identity ```aws sts get-caller-identity```
    - List my IAM policies ```aws iam list-user-policies --user-name gabriel```
    - List my attached policies ``` aws iam list-attached-user-policies --user-name gabriel```
    - List the iam group i am in ```aws iam list-groups-for-user --user-name gabriel```
    - List the attached iam policies of the group ```aws iam list-attached-group-policies --group-name your-group-name```
    - List default region ```aws configure get region```
    - List all s3 buckets ```aws s3 ls```
    - List Objects in a Human-Readable Format ```aws s3 ls s3://your-bucket-name/```
    - View Current Monthly Billing (Month-to-Date)
      ```
      aws ce get-cost-and-usage \
      --time-period Start=2026-09-01,End=2026-10-01 \
      --granularity MONTHLY \
      --metrics "UnblendedCost" \
      --query "ResultsByTime[*].Total.UnblendedCost.Amount" \
      --output text
      ```


3. Creating roles for aws services. Create an IAM role for an EC2 instance, attach a policy that gives the role read-only access to an S3 bucket, then attach the role to an EC2 instance and verify that the instance can list and read objects from the S3 bucket using the role. Delete the role and the ec2 instance


4. Check status of account credntials in IAM credentials report by downloading it and viewing it in google sheets. Check the status of:
    - Password enabled/disabled
    - Password last used
    - Password last changed
    - Password next rotation
    - MFA active/inactive
    - Access key 1 active/inactive
    - Access key 1 last used
    - Access key 2 active/inactive
    - Access key 2 last used
    - Access key age
    - Overall credential status


5. Audit permissions in iam access advisor. Navigate to groups select the group you want to analyze and navigate to access advisor. Filter by service not accessed. Do not remove the unused ones yet.

## 02 EC2

6. Setting a billing budget. Nvaigate to  Billing and cost managemen, then budgets then create budget. Select Use a template, Monthly cost budget. Give it a name and set email recipients then create budget.

7. Create an EC2 instance using a:
   - User Data script that installs Apache and configures a simple “Hello” page displaying the EC2 instance’s IP address. Changes the ssh port to 4326
   
   - A security group that allows the following inbound rules SSH on port 4326, HTTP traffic on port 80 and ICMP ipv4 from your network. Try sshing using port 22. Change the ssh port to 4326 and try again. Try accessing the web server from your phone and laptop. Then again using your phone connected with bundles.
   
   - Assign the EC2 instance an IAM role with read-only access to all S3 buckets and verify access by listing the buckets.
   
   - By default all traffic is allow outbound. Test internet connectivity by pinging and curling `google.com`. 
   
   - Create an Elastic IP, associate it with the EC2 instance. In a terminal ping the ip, then stop and start the instance to verify whether its public IP changes and confirm that the Elastic IP remains associated. 

   Terminate the ec2 instance and the release the elastic ip
   
8. Design placement groups for different types of applications. Create and launch ec2 instances there. (Optional)


# Tuesday 

9. Create two EC2 instances and create a separate ENI in the same Availability Zone. Attach the ENI to the first instance and verify its private IP, then detach it and attach it to the second instance. Verify that the second instance now has the ENI and its private IP, demonstrating that the ENI can be moved between instances.
    | Setting                      | Value                                |
    | ---------------------------- | ------------------------------------ |
    | **VPC**                      | Same VPC as your EC2 instances       |
    | **Subnet**                   | Same subnet/AZ as both EC2 instances |
    | **Private IPv4 address**     | Auto-assign                          |
    | **Security groups**          | Use the same SG as your EC2 instance |
    | **Description**              | `Test-ENI`                           |
    | **Source/Destination check** | Leave enabled                        |

  Terminate one of the ec2 instances


## EBS

10. Create an ebs volume. Volume type gp2, size 3GIB same az as your ec2 instance, encrypt using default aws key. Attach the ebs volumes to the amazon ec2 instance, format it and make it available in the ec2 vm. After attaching it to the ec2 instance
    - ssh into the ec2
    - Check the device files ```lsblk``` and identify the new attached volume by size
    - Format it to ext4 filesystem type ```sudo mkfs.ext4 /dev/nvme1n1```
    - Create a directory where you will mount it ```sudo mkdir /data```
    - Mount it ```sudo mount /dev/nvme1n1 /data```
    - Confirm ```df -h```

11. Create an ebs volume in a different region/availability zone that your current ec2 instance is created. Take a snapshot of the ebs volume. Create a volume with the snapshot the volume should be in the same az as your current ec2. Attach the volume  to the ec2 instance and make it work (formatting etc). Create a 1 day retention rule for snapshots (recycle bin section) . Delete the snapshot(s), then recover them from the recycle bin.

12. Encrypt an unencrypted EBS volume. I.e  Create an unencrypted volume, create its snapshot, copy snapshot but also encrypt snapshot. Create a volume from the encrypted snapshot

13. Remove the recycle bin retention rule. Delete all created ebs volumes and snapshos 

14. Look at ## AMI process (from an ec2 instance) in (02_ec2_instance_storage.md). Using the same ec2 instrance, which was created with a user data script that updated and installed a web server like apache or nginx, enable the web server in systemctl. Test using its public ip and see if the instance works( if you see the welcome page of the web server). Create an ami from that image at that point. Launch another ec2 instance with that ami image and see if its the welcome page show. Do not terminate the instances you will use them in no. 20. Delet the ami


15. Create an efs file system. Create two ec2 instances, while creating the two instances, configure the file system with the instances. Connect to one of the instances. Create a file where the file system is mounted, write something in that file like hello world. Login to the other instance. Confirm if the file exists by printing it out. Look at the secuirty of the file system you created if it has sgroups from the ec2 instances too. Terinate the instances and file systems

16. Using the two ec2 instances you currently have from no.18 . Create an application load balancer and create for it a new security group allowing it to accept HTTP traffic (inbound). When creating the load Balancer create targets and include the two launched ec2 instances. After the alb has been provisioned access test using its DNS address.

17. You can still access the contents of each launched vm in (20) by their ip. To remove that edit the security group tied to the vms and attach the security group of the load balancer to be able to access the contents only through the load balancer. Hint under http rule choose cidr as the security group of the load balancer. 

18. Add a rule in the load balancer that if the path is /error it returns a custom message.

# Wednesday 

19. Set a sticky session for your load balancer and make the sticky session be generated by the load balancer. Navigate to target groups, select the target group and navigate to attributes. Edit them to add stickiness Test and refresh the load balancer to see if it goes to the same ec2. Inspect the web page and check the request and response cookies. Delete one the ec2 instances  and stop the other.

20. With a demo app try adding a ssl cert using acm of importing it. Add it to the alb y adding a new listener in the alb
Create an ebs volume in a different region/availability zone from your current ec2 instance is. Take a snapshot of the ebs volume, copy it to the region and availability zone of your ec2 instance. Create a volume fron that snapshot. Attach the snapshot to the ec2 instance. Jump into the ec2 instance format the volume and mount it to /data1

Navigate to the recycle bin and create a 1 day retention rule for snapshots (recycle bin section) . Create a new snapshot (wait till its complete), delete it, then recover it from the recycle bin. After recovering, delete the retention rule. Then delete the snapshot. 

How to encrypt an unencrypted EBS volume. Create an unencrypted volume, create its snapshot, copy snapshot but also encrypt snapshot. Create a volume from the encrypted snapshot

## Clean up 

Delete the snapshot and volume you created earlier in the other region 

In your ec2 instance Unmount both /data and /data1 folder. In the console detach both volumes and delete them

## AMI
21. Create a usable AMI that will be used as a starting point of our ec2 instances. Cretae the AMI by:
 - Start an EC2 instance and customize it use it a user data script to update and install a web server like apache or nginx, enable the web server using systemctl. Test and see if the instance works( if you see the welcome page of the web server).
 - Stop the instance (for data integrity)
 - Build an AMI – this will also create EBS snapshots
 - Launch another instance using the AMI


## EFS

22. We will use the two instances to create an efs file system. Create an efs file system, configure the file system with the instances. Connect to one of the instances. Create a file where the file system is mounted, write something in that file like hello world. Login to the other instance. Confirm if the file exists by printing it out. Look at the secuirty of the file system you created if it has sgroups from the ec2 instances too. Detach and remove the file systems


## ALB

23. Using the two ec2 instances Install apache and display their host names. Create an application load balancer and create for it a new security group allowing it to accept http traffic (inbound). When creating the load balancer create targets and include the two  ec2 instances and make sure you add the ec2 instances as pending before creating the target group otherwise you will get a 503 . After the alb has been provisioned access test using its dns address. Use http not https when accessing the alb dns name

24. You can still access the contents of each launched vm in (20) by their ip. To remove that edit the security group tied to the vms and attach the security group of the load balancer to be able to access the contents only through the load balancer. Hint remove the current inbound http rule  and create another one that the source is the sg of the load balancer

25. Add a rule in the load balancer that if the path is /error it returns a custom message

26. Set a sticky session for your load balancer and make the sticky session be generated by the load balancer. Navigate to target groups, select the target group and navigate to attributes. Edit them to add stickiness Test and refresh the load balancer to see if it goes to the same ec2. Inspect the web page and check the request and response cookies. 

27. With a demo app try adding a ssl cert using acm of importing it. Add it to the alb y adding a new listener in the alb

28. Delete the Target group, security group of the ALB and the Load balancer.

29. Create an auto scaling group. First create a launch template. Manualy edit the desired and maximum capacities and observe the changes in the monitoring and actions tab

30. Create a Dynamic policy (target tracking). Target cpu spikes. Use stress linux os package to increase cpu load. Observe after 15 minutes in the monitoring tab of the auto scaling group. Delete the target tracking policy

## r



31. Create and auto scaling group. First create a launch template. Manualy edit the desired and maximum caoacities and observe the changes in the monitoring and actions tab

32. Create a Dynamic policy (target tracking). Target cpu spikes. Use stress linux os package to increase cpu load. Observe after 15 minutes in the monitoring tab of the auto scaling group. Delete the target tracking policy
    ```
    dnf install stress
    stress --cpu $(nproc)
    ```

Delete evrything apart from the load balancer security group


## RDS


 33. Create a mysql rds db, fully configured with:
     - Engine option = Mysql
     - DB Creation method = Full configuration
     - DB Instance Identifier = demodb
     - Master username = demodb
     - Credentials Management = Self Managed
     - Give master password
     - DB Auth options = Password auth
     - Allocated storage = 20
     - Max Storage =  25
     - Do not connect to Ec2 
     - Public access = yes
     - Add mysql access (3306) To launch-wizard-1 and use launch-wizard-1 as the sg
     - Choose an AZ(any)
     - Log exports = Error and General
     - Backup retention period = 1 day
     - Initial database name = demodb

      administer a security group, connect it through sqlelectron (local tool) or just use your teriminal.

    This demo uses the terminal

    ```
    mysql -h database-1.cdcq6awacl6l.eu-north-1.rds.amazonaws.com -P 3306 -u admin -p 
    ```

    Select the db
    ```
    USE demodb;
    ```

    Create a table
    ```
    CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2)
    );
    ```

    Add some data

    ```
    INSERT INTO employees (id, name, department, salary)
    VALUES
      (1, 'Alice', 'IT', 75000),
      (2, 'Bob', 'Finance', 68000),
      (3, 'Charlie', 'HR', 62000),
      (4, 'Diana', 'IT', 80000);
    ```

    Test it

    ```
    SELECT * FROM employees;
    ```
    
    Delete the instance from the console 



## Beanstalk

34. Create a dev environment (web service). with beanstalk. While creating the service, navigate to iam, roles and create an iam role:
   - Choose Aws service
   - Choose EC2 as the use case
   - Add permissions
     - AWSElasticBeanstalkWebTier - permissions for Beanstalk apps serving web requests.
     - AWSElasticBeanstalkWorkerTier - permissions for apps processing background jobs/tasks.
     - AWSElasticBeanstalkMulticontainerDocker - permissions needed to run/manage multiple Docker containers in Beanstalk.

   Link the role to the envivornment in the EC2 instace profile under Service access. Launch the environment an acceess it through the domain provided by aws





## S3 Intro

35. Create a regional s3 bucket and add coffee.ipg in the code folder of this directory. Try accessing it through the open button in the object dashboard in the console. Try accessing it using the domain url. It should not display in the domain access ecause it has no public access granted. The open button has a signature that it is you who is accessing it

36. Create a folder and add the beach.jpg. Delete the folder

37. Remove block public access for the bucket. Create a bucket policy using aws policy generator. Principal = * .Make sure all objects are publicly accessible by using the GetObject policy in the policy generator and using a (/*) postfix after copying the bucket arn.

38. Upload the beach.jpg in the same level as the coffee.jpg. Enable the s3 to host static sites. and upload the index.html. Access the domain url and observe the static site deployed. Also OPEN THE image displayed in a new tab to see it s3 url of the same image. Use the website endpoint to access s3 not the rest endpoint

# Thursday
 
39. Add versioning to your bucket. Edit index.html in vscode and reupload it. Go to the objects dashboard and enable versioning to see the version ID. Reload the site to see the changes. Add a delete marker to coffee.jpg by tuggling OFF the show version and deleting the coffe.jpg. It does not delete the image but when you refresh the webise the image is not displayed. It has not been deleted from the bucket but a delete marker has been added. Delete the delete marker to see the image 

40. Create two buckets in different regions origin bucket and replica bucket respectively. Enable versioning in both of them and save them. In the first origin bucket upload the beach image. Then in the management tab add a replication rule pointing to the other bucket in a different region while selecting create new iam role. Do not replicate existing data. Upload another image like coffee.jpg and refresh the objects in the replica bucket. Edit the replication rule in the origin bucket to enable replication of delete markers. Add a delete marker in obe of the objects in the origin bucket. Observe if the delete marker has been replicated in the replica bucket. Permanently delete an object in the origin bucket and observe if it is deleted in the replica bucket (should not work)

41. Create a new bucket with default settings in any region. Add coffee.jpg and while adding it select the storage class to one zone IA in the properties section and save. Under management Add different storage classes transitioning with different days and save


## S3 advanced

42. Edit the bucket rules and enable transition of current versions of object to  other storage classes by creating a lifecycle rule. Review current and noncurrent version transition and expiration actions, including storage-class transitions from Day 0 through Day 365. For storage-class transitions, set Intelligent-Tiering at day 60, Glacier Instant Retrival at day 120, Glacier Flexible Retrival at day 240, Glacier Deep archive at day 365. Expire current versions of objects at day 700. Permanently delete noncurrent version of objects at day 700 

43. Event Notification Setup: Create a regional Amazon S3 bucket and an Amazon SQS queue to receive messages whenever a file is uploaded. You must update the SQS access policy to allow Amazon S3 (not the SQS queue itself) to send messages to it. Hint use policy generator and this as the principal ("Service": "s3.amazonaws.com").
    Policy was
    ```
		    {
		  "Version": "2012-10-17",
		  "Statement": [
		    {
		      "Sid": "Statement1",
		      "Effect": "Allow",
		      "Principal": {
		        "Service": "s3.amazonaws.com"
		      },
		      "Action": [
		        "sqs:SendMessage"
		      ],
		      "Resource": "queue-arn",
		      "Condition": {
		        "ArnEquals": {
		          "aws:SourceArn": "bucket-arn"
		        }
		      }
		    }
		  ]
		}
    ```
    Link the event notification inside the S3 bucket settings. Head to the Properties tab and scroll down to the Event notifications section. Click Create event notification. Give it a name and check the box for All object create events (under Object creation). Scroll down to Destination, choose SQS queue, select your queue from the dropdown, and hit Save changes
	

## S3 security

44. Create a bucket, enable versioning and server side encryption should be set to the default sse-s3. Upload an image to the bucket and view its properties to see the encryption enebaled. Change the encryption method to sse-kms. Check the versions of the objects in the bucket to see two versions of your image.

45. Test cors in your first markdown. Create upload the index.html in your first bucket that had static website enabled and make sure in the cors section (javascript) include on to fetch extra-page.html not the an aws domain name. Upload the extra-page.html. And access the page to see the extra page. Delete the extra-page.html. Create another origin bucket in another region, lets say canada and enable static webiste to it, set the main file to index.html, remove all blocks when creating the bucket and add a policy that allows public access. Upload the extra-page.html there and go back to vscode and change the index.html to fetch the extra-page.html from the new bucket by including the bucket domain name and /extra-page.html. Upload the index.html in your first bucket again and try accessing the page. Observer the cosole tab and see the cors error. Edit the permissions in the new bucket where the extra page is and include the cors config in vscode, make sure the allowed origins does not end with a slash. And add the url of the first bucket to the allowed origins. Save and hard reload the page to see the extra page appear



## Cloudfront

46. Create an s3 bucket with default settings nothing changed, upload index.html, coffee and beach .jpg. CrEATE A CLOUD FRONT DISTRIBUTION AND LINK IT TO THE S3 BUCKET, it will automatically copy a the policy to allow cloud front to access s3 and the policy will be copied to the s3 bucket. After creating it make sure the root object is set to index.html. After it has deployed open the cloudfront dns settings to access the site. Add /coffee.jpg to the dns name reload, then do the same for beach.jpg and reload. This is just to see both images. Reload the site without both /images.jpg just the original dns so that inde.html is fetched from cloud front not s3 and do the same for the images

## Storage extras 

47. Create another bucket that will be collecting logs for your first s3 bucket. In the permissions of the first bucket enable logging and link to the new bucket and check if the bucket policy is changed to allow logging

48. Create a pre signed url from an object in a bucket that is private like th event notification one. Copy it somewhere and open with another device. Set the presigned url to expire after 5 minutes

# Friday

## SQS

49. Create a sqs queue with default settings and 30 second message resend if the message is not deleted. Try sending a message from the queue tab and poll for messages to see if a message has been receiived. Wait for 30 seconds and see the message count, it should be 2 for the same message. Delete the message.

50. Create a fifo queue and the name should end with '.fifo'. Send 4 different messages with the same groupd id but different messages and deduplication ids. Research what is deduplication in sqs

## SNS

51. Create a sns topic, standard one. With default settings. Create a subscription to send messages to your email. Confirm the subscription from your gmail. Send a messages to the email to confirm and it is working. Delete the subscription and topic

# ECS

52. Create an ecs cluster with both fargate and self managed instances option. Set the desired ASG to 0 desired and 5 Maximum and leave the default options. After the cluster has been created go to the autoscaling group tab and changed the desired instances to 1 and save. Check if an ec2 instance has been launched (it should be) and go back to the cluster and check the containers status. The ec2 instance should be launched from there.

53. Check the video for creating an ecs service in the aws not free tutorials and write the steps down and implement it

## Lambda

54. Create a demo function with python hello-world template and run it in lambda. Check the metrics in the monitoring tab

## Dynamo DB 

55. Navigate to the dynaodb service in the console and create a table name with a partition key which will be the primary id. Choose customize seting and dynamodb standard. Read and write capacity both set with OFF autoscaling and 1 rovisioned capcity each. Create the table. Create an two iems and each item should have a user_id and add 3 different attributes to each item. So that you see the schema flexibiliy it has to offer 


## API gateway

56. Create an api gateway in  the api gateway service. Choose rest api and the api detail should be new API. Give it a name and set the endpoint type to regional and create it. Navigate to the api and create a method. Should be a GET type and lambda function integration. Enale lambda proxy integration , leave it as buffered. And from here we have to create the lambda function. Gie your lambda function a name and choose python 3.14 as the runtime, leave other setting. Copy the lambda code in the api-gateway folder and test it. Go back to the api gateway and select the new lambda function and create method. Go to the lambda unction and in under configuration and permissions check the resource based policy to see if the api gateway is authorized to access your lambda function. Test to see the response. Create a resource and name it houses. Reapeat the same steps for creaing a method and linking the method to a new lambda function that instead says "HELLO from my pretty houses" in the print statement. Test the endpoint from the api gateway. Deploy the api and choose a new stage and name it dev. Test the invoke URL with bothe endpoints i.e "/" and "/houses"

## Athena

57. Navigate to the athena service page and create and select "Query your data in Athena console". It should show you this pop up "Before you run your first query, you need to set up a query result location in Amazon S3.". Select "Edit setting and manage to create a s3 bucket which will store your query results. Navigate to the s3 servie page in another tab and create a regional s3 bucket. Go back to athena and choose the created bucket. There is a s3 bucket that was created from previous tasks that had access logs. We will use this bucket as our db. Navigate to editor tab in athena and run the first line of code in "/home/ryankaleligabriel/cloud-control-plane/Solutions_architect/code_v2025-10-27/s3-advanced/athena-s3-access-logs.sql" to create a database first. Select the database created in the right hand side navigation tab. Next is to copy the create table query and switch the location with the location of your logs. The previous example location was 's3://ryankaleli-s3-access-logs/'. Got the uri by clicking an object and copying its uri. In the table click the navbar link and click preview table and it should return some results from your table. Run the other queries in the code file listed above

##  Polly

58. Navigate to polly and try it out with the default sentence. Use the SSML feature to add a break in your sentences by using this input text "'<speak>Hi, I’m Danielle. <break time="1s" /> I Love AWS</speak>'". Upload a lexicon to change AWS to Amazon web services

# Saturday 

## Cloudwatch

59. Check the cloud watch logs tutorial in the not free tutorials folder (its free)

60. Create an ec2 instance t3micro with default settings. Create a classic cloudwatch alarm and select a metric, choose ec2 then choose per instance metri. Paste the instance id of the ec2 instance and select it in the search bar and select cpu utilization %. Afte that choose a 5 minute period so the metric can be populated evry 5minutes. Leave the statisticat average, Choose the cndition as static and greater than 95%. In the additional conifiguration. Choose the datapoints of the alarm to be 3 out of 3 wich means for 15 minutes if it stays at 95% and above the metric goes to alarm state. Click on next and choose the action point, we will go for ec2 action and terminate this instance. Click next and give the alarm a name. Verify and click the alarm. Because waiting for 15 minutes will be long we can set the alarm state from the ec2 instance (cloudshell) by running the command 

```
aws cloudwatch set-alarm-state \
    --alarm-name "YOUR_ALARM_NAME" \
    --state-value "ALARM" \
    --state-reason "Testing notification triggers"
```

after that run checkthe history of the alarm and its state and check to see the ec2 instance state. Should be terminated

61. Create an eventr bridge bus. Give it a name and enable archiving and schema discovery. Create a rule and give it a name and select the created bus as the default bus and click next. Now we want to create an event pattern. Select 'AWS events or EventBridge partner events' ans the event source. In the sample event type (this is for testing purposes) select AWS events and the sample evetnt choose "EC2 instance State-change Notification" and Sample event 4 who's state is stopped. Event pattern creation, pick "Use pattern form" and Event source as AWS services, Aws service as EC2 Event type as ' EC2 Instance State-change Notification. Choose Event Type specification 1 as 'Specific state(s) and choose 'stopped' and 'terminated'. Test the pattern and click next. In the targets choose aws service as the target type and sns topic as the target The topic choose demo-topic or create one with default settings. You can now create a subsription in sns that sends emails to your email. AFter that create and terminate a default t3.micro ec2 instance


## Cloud trail

62. Create a bareminimum ec2 instance and make sure its running, terminateit and observer the event history after five to ten minutes in the cloudtrail events history to see if its generated.


## VPC

63. Creata a vpc. Give it a name tag DemoVPC, IPv4 Cidr manual input, IPv4 CIDR is 10.0.0.0/16 and No IPv6 CIDR block. Tenancy set to Default and create the vpc.

64. Here in this exercise we will create 4 subnets for our new vps. Two subnets will be private and 2 will be public. The first public subnet will have a 10.0.0.0/24 CIDR and it will be in availabiliy zone us-east-1a (256 available ip addresses with the first ip address starting from 10.0.0.0 and the last having 10.0.0.25 ). The second public subnet will have a cidr of 10.0.1.0/24 in us-east-1b and will have  256 ip addresses (first ip address will be 10.0.1.0 and the last one will be 10.0.1.255). So the first and second subnets have different ips. The private subnets are assumed to have more hosts. So we will give both a /20 cidr. The first private subnet will hae a cidr block of 10.0.16.0/20 (4096 available ips, 10.0.16.0 is the first ip address, 10.0.31.255 is the last one) and the other one which will be in us-east-1b will have a cidr block of 10.0.32.0/20 (4096 available ips, with 10.0.32.0 as the first IP and 10.0.47.255 ad the last ip)

65. Edit both public subnets and enable ip address auto assigning. Create an ec2 instance with default settings and make sure the ec2 instance is in the vpc you just created and in publicsubnetA and has not key pair. Try connecting using ec2 instance connect and it should fail because there is no internet gateway. Create an internet gateway and attach to the vpc. Try connecting to the ec2 instance again using ecn instance connect, it should fail. Because there is no route table. Create two route tables the private route table and the public route table, explicitly associate theprivate subnets to the private route table and vice versa. Now we will edit the routes in the public route table to send traffic to the internet gateway. So we will add a route Destination 0.0.0.0/0 and target internet gateway and we pick the internet gateway we created. The first rule means that any instance within our vpc (10.0.0.0/16) goes to local which means from within our vpc. The new rule means that anthying else (0.0.0.0/0) which includes public ips (that your ec2 instance was given) can go to the internet gateway. Now connect to the ec2 using ec2 instance connect and ping google.com

66. Rename the ec2 instance as bation host. It will be used toas a bastion to log into ec2 instances that are in the private subnet. Users will ssh into the bastion and jump into the private ec2 instances. Create another ec2 instance and the key pair select the one you created earlier in the course or create a new.pem one with rsa. Choose the vpc we created and private subnet A. Create new security group and name it privatesg. n the inbound security group rules select source type of ssh as custom and the source choose the security group of the bastion host, decsription write allow ssh for bastion host. Launch the instance. Connect the bastion ec2 from ec2 instance connect, create a file named DemoKeypair.pem and copy the contents of the key pair in this file. Now ssh into the new ec2 instance ```ssh ec2-user@privateip -i DemoKeypair.pem```

67. Create a NAT gateway. Give it a name, availabilitymode = zonal Subnet = PublicSubnetA, Connectivity type = public and allocate an elastic IP. Edit your private route table and allow all ips (0.0.0.0/0) destionation to access the target NAT gateway you created. Login to the private ec2 via the bastion and ping google.com (It should work)

## NACLs

68. In the bastion host install apache and echo hello world in this file ```echo "<h1>Hello World from $(hostname -f)</h1>" > /usr/share/httpd/noindex/index.html```. Access the server using its public ip make sure is not https. Now we want to demonstrate the rule numbering. Add a new rule in the nacl inbound rules and number it 80 it should deny http from port 80. Try rereshing the ec2 instance to see if it works. It should not because rule 80 will be evaluated after 100. Edit rule 80 and give it number 140. It should now work. The ec2 instance should load. We want to demonstrate nacls statelessness. Remove the outbound rule from the Default nacl and save then refresh the ec2 instance it should be in a never ending loop loading. Add it back. We want to demonstrate security groups statefulness. Navigate to the security group of the bastion host and remove the outbound rule and save then refresh the ec2 instance. It should work because security groups are stateful

# Sunday

## VPC Peering. L

69. Luanch an ec2 in the default vpc and leave it with the default settings AND ALLOW ALL TCP FROM ANYWARE. Connect to it and run curl ```bastion_ip_address:80/```. It should fail because they are not connected. Now navigate to peering connections and create a peering connection by giving it a name and select the requester as the DemoVPC and the accepter as the defaultvpc with my account and this region selected. aFTER that try curling again and it should fail because we need to modify the route tables. In the default route table add a route with destination as the cidr of the defaultroutetablevpc and target should be peering connection and select the peering connection you created. Try curling again and it should not work because all route tables have to be editted. Do the same for the publicroute table. Try curling and it should work now

## VPC Endpoints

70. Connect to your privateinstance. We want it to be able to access our s3 buckets. Give your instance a role in the security and settings. Modify the IAM role for the instance by creating a new role. Go to iam create a role for aws service ec2 and the role should be AmazonS3ReadOnlyAccess. Give the role a name and assign it to your instance. Since the private route table which is for the private subnet has internet access through the nat gateway and the private instance is in the private subnet, this private instance can access the internet. Test it by running ```aws s3 ls``` and curl ```google.com```. Create an endpoint and give it a name. Type = aws services and  type should be gateway named "com.amazonaws.us-east-1.s3" and the vpc should be demovpc also select the route table as the privateroutetable and policy is full access. After it has been created check the private route table has added a new route for the endpoint. Test curl it should not work but testing ```aws s3 ls```. It should work, the ec2 in the private subnet cannot access the internet but it can access the aws services


## VPC Flow logs

71. We will create 2 flow logs one going to s3 and one sending logs to cloudwatch. Create a vpc flow log. By clicking on demovpc and actions. Give it a name and caputre all traffic in the filter. Maximum aggregation interval of 1 minute destination to s3. Create an s3 bucket with defaultsettings and a name and copy the arn to the s3 bucket arn then create the flow log. Do the same for cloudwatch but when creating it. Create a default log group in cloudwatch logs and create an IAM role. The IAM role will be custom trust policy and this should be the policy

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "Statement1",
			"Effect": "Allow",
			"Principal": {
				"Service": "vpc-flow-logs.amazonaws.com"
			},
			"Action": "sts:AssumeRole"
		}
	]
}
```
and permissions policies should be CloudWatchLogsFullAccess, give it a name and create. Use the iam policy in the flow log creation and create flow log. Now that you are done with that confirm the logs are going to the bucket and cloudwatch. For cloud watch you can see the enis of diffferent services and watch the logs based of enis. Check the accepted and rejected requests. and from which ips these requests are coming. For s3 you can analyze the logs on athena

72. For analysis with amazon athena, we can create a new s3 bucket for our query result location. Create a new bucket with default settings and manage the query settings in athena to add the new bucket. Copy the bucket arn but confuring it to athena will be different. For example this is the arn    ```arn:aws:s3:::demo-athena-ryan-v2-737429582017-us-east-1-an``` but we will configure it as ```s3://demo-athena-ryan-v2-737429582017-us-east-1-an/athena/```. After that is done we can create a table in athena. I created this table and did the following actions from a [tutorial](https://docs.aws.amazon.com/athena/latest/ug/vpc-flow-logs.html).

First i created the table and the location field i switched it to ```s3://demo-ryan-vpc-flow-logs-v2-737429582017-us-east-1-an/AWSLogs/737429582017/vpcflowlogs/us-east-1/``` this is the s3 bucket uri of where the vpc flow logs are going up until the region

```
CREATE EXTERNAL TABLE IF NOT EXISTS `vpc_flow_logs` (
  version int,
  account_id string,
  interface_id string,
  srcaddr string,
  dstaddr string,
  srcport int,
  dstport int,
  protocol bigint,
  packets bigint,
  bytes bigint,
  start bigint,
  `end` bigint,
  action string,
  log_status string,
  vpc_id string,
  subnet_id string,
  instance_id string,
  tcp_flags int,
  type string,
  pkt_srcaddr string,
  pkt_dstaddr string,
  region string,
  az_id string,
  sublocation_type string,
  sublocation_id string,
  pkt_src_aws_service string,
  pkt_dst_aws_service string,
  flow_direction string,
  traffic_path int
)
PARTITIONED BY (`date` date)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ' '
LOCATION 's3://amzn-s3-demo-bucket/prefix/AWSLogs/{account_id}/vpcflowlogs/{region_code}/'
TBLPROPERTIES ("skip.header.line.count"="1");

```


Created a partition and switched the location to ```s3://demo-ryan-vpc-flow-logs-v2-737429582017-us-east-1-an/AWSLogs/737429582017/vpcflowlogs/us-east-1/2026/09/22/``` this is the s3 bucket uri of the vpc flowg untill the date and the date swicthed to the date in the s3 bucket uri.

```
ALTER TABLE vpc_flow_logs
ADD PARTITION (`date`='YYYY-MM-dd')
LOCATION 's3://amzn-s3-demo-bucket/prefix/AWSLogs/{account_id}/vpcflowlogs/{region_code}/YYYY/MM/dd';
```

Then ran example queries to see the traffic 

```
SELECT day_of_week(date) AS
  day,
  date,
  interface_id,
  srcaddr,
  action,
  protocol
FROM vpc_flow_logs
WHERE action = 'REJECT' AND protocol = 6
LIMIT 100;
```

From here i can see the results and filter based on which ip is trying to access me the most. 

DELETE THE TWO FLOW LOGS.


## IPV6

73. Navigate to demovpc, actions and edit cidrs. Create add ipv6 CIDR and choose Amazon-provided IPV6 CIDR. We will create an ipv6 cidr for the publicsubnetA, select bastion host and actions. Under networking you will see manage ip addresses, click on the eni interface and assign a new ipv6 address and leave it at auto-assign. cHECK THE IPV6 In the bastion host,it has been assigned. IN the security group of the bastion host use edit to add an inbound rule to allow ssh traffic from anywhere ipv6. You can now ssh using ipv6 if your local computer allows ipv6. A ipv6 route will be added to the route table

## eGRESS ONLY IPV6. 

74. Navigate to the egress only internet gateway. Create the gateway and link it to the demovpc. Add a route in the privateroutetable and the destination should be ::0/ andy ipv6 and target is the gateway you created. So your private instances can access the internet but connection cannot be initiated from the internet (EGRESS ONLY)

## aws BACKUP

Check in the not free directory.

## Cloudformation

75. Deploy an ec2 instance using cloudformation. Navigate to cloud formation and create a stack . Templte = existing, and select upload. Upload the first .yaml in the code folder in the cloudformation folder , you can view it in infrastructure composer and click next. Give your stack a name. Tag it and click on next. Create the stack and check if an ec2 instance has been created.

76. We will update the current template with another one. Navigate to events and Click on update stack and make direct update. Replace existin template. Upload the second file in the cloudformation code folder. View in infrastructure composer. Gie your security group a description. Check the change set to see the changes cloudformation will do. Submit and leave cloud formation to cook. After 1 minute check the ec2 page to see the ec2 instance being created. Delet the stack and cloudformation will delete everything it provisioned in the right order

## SSM

78. Launch an ec2 instance with the default settings and no key pair and in advanced section we will create an IAM profile. Navigate to IAM and roles and create a role for ec2. Choose this for permissions "AmazonSSMManagedInstanceCore". Give it a name and create the role. Select the role in the ec2 iam profile and launch the instance. Navigate to the fleet manager uunder the ssm service to see all instances managed by ssm there. Navigate to session manager and start session. Select the ec2 insatnce and start the session


## Devops

## Codecommit

79. Create a repo in code commit and upload index.html in the codefile in aws-cicd folder in the nodejs project folder. Naigate to setting and add a notification rule that will be publishing messages to sns. Check all rules when creating the notification rule. Create a trigger that will be sending events to amazon sns as well. Select one trigger

80. Clone your repo in cloushell by installing codecommit package first ```pip install git-remote-codecommit```.  Copy the https grc url and clone it using ```git clone codecommit::eu-north-1://my-nodejs-app```. Upload the remaining files and pull them in cloudshell using git pull 

### CodePipeline

81. Create a custom code pipeline config in codepipeline. Give it a name, set execution mode to queued, create a new service role and go to the next section. Select Github apps as the source provider. Connect to github by giving it a connection name or creating one, when creating the connection select all repos. Create a repo in github or use the one that exists with the nodejs app. Choose the repo as the repository name in code pipeline and select the default branch as main. Choose Output artifact format as CodePipeline default. Choose the webhook event type as push, Filter type as Branch and select branches as main. Go to nect and configure the build stage to only run ls command. Click next and leave the test section as is. In the deploy section, select the beanstalk dev environment and application then create the pipeline. Navigate to your pipeline settings and click the service role ARN. This should take you to the permissions for this role in IAM. Attach new policies and ass the AdministratorAccess-AWSElasticBeanstalk policiy so that it can deploy changes to beanstalk. After adding the permission. Got to github an change the background color in line 38 to another and observe the changes reflect in beanstalk

82. Edit the pipeline to add a stage called DeployToProd by adding an action group, give it a name and set the action provider to Elastic beanstalk. App name and environment give the prod beanstalk environment and app name you created earlier. Also add another action group in the same stage called ManualApproval. Select the ManualApproval as the action provider and click on next. Save the pipeline and make a change in github to make it run. Chane the background color to yellow. Observe the changes. Now manually approve the approval to push it to the main elastic beanstalk env

## CodeBuild

83. Create a codebuildproject with the following configs - Give it a name, Project type = Default, Source Github - connect throught Github Apps when asked, Select the repo as mynodejsapp, Select Rebuild everytime a code is pushed to this repo, Build type = Single build, Event type for webhooks = push. Environment image = Managed image, Running mode = Container, OS= Ubuntu, Runtime = standard, Image standard 8.0, Select New Service role. Timeout Minutes = 10, hours = 0. Select Use a build spec file in the Buildspec section Create project and start build. I expect it to fail because there is no yaml file in the repo.

84. Navigate the the nodejs repo in github. Add a file called buildspec.yml. Copy the contents of this file from the buildspec.yml in the code files under code build.Commit the changes and look at the build activity in codebuild. View the logs to see how the build worked.

85. Now we want to integrate the codebuild to codepipeline. Navigate to your codebuild project and edit it. Remove the 'Rebuild everytime a code change is pushed to this repo' option, unselect it. Now go to code pipeline and edit it. In the build stage, give it a name and set the following.Action Provider = aws codebuild, Project Name = MyFirstBuild which is te codebuild project name, Build type = SIngle build, Output artifacts give it a name and save. Now change the congratulations in the index.html in the github repo to horrible so that the test does not pass and commit the changes. Also add codebuild admin access permission policy to the codepipeline service role. Change the horrible to congratulations and let the piepline run

## Code Artifcat

86. Its not free tier so watch the hands on video in udemy

## Cloudformation
87. Create a stack in cloud formation. Upload the /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/0-just-ec2.yaml file in the configuration with default settings. Run the stack and look at the events and resources section

88. Update the stack using a new template which is this /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/1-ec2-with-sg-eip.yaml, observe the events and resources. Delet the stakc to also remove all resources

89. Trigger a failureand rollback by creating a new stack and use this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/0-just-ec2.yaml update the stack using this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/2-trigger-failure.yaml. In updating the stack make sure you select "Roll back all resources. Roll back the stack to the last known stable state." Now observe as it rollbacks automatically after failing.

90. Test the deletion Poluicy of cloudformation by creating a stack using this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/4-deletionpolicy.yaml. One resource has a retain policy and the other has a snapshot. Delete the stack. Now check if a snapshot has been created and delete it. Also after the stack has been deleted, check the seurity groupif it has been retained

91. Test custom resources in cloudfront by creating a aws cloudfront stack using this /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/2-custom-resource-lambda-backed.yaml template. It will create a lambda function, s3 bucket and iam roles so you have to acknolwedge the capabilities in the creation process. The lambda function will be triggered to empty the bucket before cloudfront deleted the bucket in the evnt you want to delete the stack. So after the bucket has been created. Upload three files in it. After that delete the bucket and then check the lambda cloud watch logs to see how the bucket will be emptied first the check the cloudfront events

92. Create a cloudformation stack using this templat /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/0-user-data.yaml to verify how to create an ec2 instance using a user data script. Access the ec2 using its public ip to see if it worked. Delete the stack

93. Create a cfn init stack using this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/1-cfn-init.yaml to demonstrate the cfn init capability. Confirm it worked by accessing the ec2 using its public ip. Delete the stack

94. Create a cfn signal stack using this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/2-cfn-signal.yaml to demonstrate the cfn signal capability. Confirm it worked by accessing the ec2 using its public ip and by looking at the cf events to see if the simplewaitcondition received a 'Received SUCCESS signal with UniqueId ec2-instance-id'. Delete the stack

95. Trigger a cfn-signa failure using this template /home/sysadmin/Personal_Projects/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/3-cfn-signal-failure.yaml to demonstrate cloudformation rolling back all the changes and deleting the resources. Delete the stack

96. Create an stack using this template /home/sysadmin/Personal_Projects/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/5-dependson.yml to demonstrate depends on. The s3 bucket will only be created after the creation complete event for the ec2 instance is displayed in cloudformation. Delete the stack. Observe if the s3 bucket is deleted first

97. Create a stack using this template /home/sysadmin/Personal_Projects/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/0-cfn-hup-demo.yml to demonstrate cfn hup that changes metadata on provisioned cloudformation resources. After the instance is running UPDATE the stack and add a paragraph in the metadata section and upload the updated yaml file to see the metadata change. Delete the stack

## Beanstalk

98. Create a beanstalk environment, application name = MyApplication, Enivornment = MyApplication-dev, platform = Nodejs, sample app, hello world Also set enironment type to single instance. Give the beanstalk environment a service role (aws-elasticbeanstalk-service-role) and instance role (aws-elasticbeanstalk-ec2-role) they are the first roles in each drop down. (Look at the policies attached to them at your own time). Launch your instances

99. Create a beanstalk environment, application name = MyApplication, Enivornment = MyApplication-prod, platform = Nodejs, sample app, hello world Also set enironment type to single instance. Give the beanstalk environment a service role (aws-elasticbeanstalk-service-role) and instance role (aws-elasticbeanstalk-ec2-role) they are the first roles in each drop down. (Look at the policies attached to them at your own time). Launch your environment. Explore the services and security groups


100. In the same prod environment, implment an immuable deployment. In the envoronment, navigate to configuration, monitoring and updates and edit the deployment mode to immutable. On the top navbar of the production environment click on upload and deploy and add this zip file /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/beanstalk/nodejs-v2-blue.zip it changes the background to blue. Deploy the changes and view the events to see how immutable deployment works

## AWS SAM 

111. Check the sam deployment here https://www.udemy.com/course/aws-certified-devops-engineer-professional-hands-on/learn/lecture/37869152#questions

## AWS step functions

112. Create a step function sampled hello world, take a look at the flow chart and study the code as well. Execute it and look at the events,inputs and outputs, variables. Change the variable IsHelloWorldExample to false so that the step function is fails

113. Create a new state machine, create from blank and give it a name. Navigae to code and add the contents of this file /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/step-functions/0-hello-world/state-machine.json. Go through the file to see how it works. It prints wohoo if sthe name stephane is in the payload. Create a lambda function from scratch, the lambda function will be nodejs based and will have these contents /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/step-functions/0-hello-world/function.js. Test the function. and copy the functions arn to the API parameters of the step functions. The API parameter is found when you navigate to the design tab a new window will open on your right. Create the state machine and execute. When executing fill in the parameters as 

    ```
    {
        "who": "Stephane Mareek"
    }
    ```

    for it to work. Change the name to John doe for it to fail

## System Manager


114. Navigate to the Systems Manager service and navigate to fleet manager. There are no instances to manage so we will navigate to the ec2 instance to create them. Do not proceed with a key pair and create a new security group removing the accessfrom port 22. Create and IAM instace profile with this role only AmazonSSMManagedInstanceCore and give it a name. After the instances state have changed to runnign refresh the fleet manager

115. Tag those three instaces,
    Instance 1 Tags
     - Name: MyDevInstance
     - Environment:Dev
     - Team: Finance
    
    Instance 2 Tags
     - Name: MyProdInstance
     - Environment: Prod
     - Team: Finance
    
    Instance 3 Tags:
     - Name: MyDevInstance
     - Environment: Dev
     - Team: Operations

    Navigate to the resource groups service and create three resource groups name DevGroup, ProdGroup and FinanceGroup and add the approriate instaces there

116. Add a security groupof your ec2 instances and add http access inbound rule from anywhere. Navigate to documents in ssm and create document. Select Command or Session. And give it a name, target = EC2 instance, Doc type Command. Edit the content by deleting the current yaml code and add the contents of this yaml file /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/ssm/document-install-apache.yml. Navigate to the run command and create a run command. Select the document your created and write a message. Target selection = Choose instances manually and you can select all three. Concurrency control = 1. Error threshold = 0. Enable cloudwatch logs and run the command. Check the cloudwatch logs and try accessing the ec2 instances with their public ips to see the message after all instances have been updated

117. Create a ssm automation by navigating to the automation section in ssm. Search fro AWS-Restart and select awsrestartec2 and select the latest version before clicking next. Click Next. In the configuration select Rate Control, Parameter = InstanceID, Targets=Resource Group, Resource Group = DevGroup, Concurrency= 1, Error Threshold = 1

118. Create a parameter in systemsmanager under parameter store:
    Name: /my-app/dev/db-url
    Description: DB URL for dev eniroment
    Tier: standard
    Type: string
    Data typ: text
    Value: dev.database.stephanetheteacher.com:3306

    Create another parameter for db password
    Name: /my-app/dev/db-password
    Description: DB password
    Tier standard
    Type: securestring
    KEy:any kms key
    Data type: text
    Value: devpassword 

    Create two other parameters but switch dev with prod in the same manner. In cloudshell write 
    ```
     aws ssm get-parameters --names /my-app/dev/db-url /my-app/dev/db-password
    ```
    to get the values

    To get vaues decrypted write 
    ```
     aws ssm get-parameters --names /my-app/dev/db-url /my-app/dev/db-password
    ```

    Other commands

    ```
     aws ssm get-parameters --names /my-app/dev/db-url /my-app/dev/db-password
    ```

    All parameter under my-app

    ```
    aws ssm get-parameters-by-path --path /my-app/ --recursive
    ```

119. Start a session manager for your prod instance and run commands. Terminate the fleet instances under fleet manager.

120. Under fleet management. Click on 'Configure Default Host Management Configuration'. Then Enable Default Host Management Configuration and configure. Launch an ec2 instance with no keypair and watch it appear in the fleet manager.Under security in the ec2 instance check that there are no iam roles attached.This shows system manager can control and manage your instance. Disable the DHMC in account management in the fleet manager tab and terminate the instance

121. Create an activation, Instance limit = 1, Iam role = create a system default... . Create the actvation, copy the activation code somewhere. Under ec2 launch an instancename = OnPremises, OS= Ubuntu, proceed withut key pair and launch the instance. Connect the ec2 instance with ec2 connect and run the following commands to activate the hybrid connection /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/ssm/managed-instance-setup.sh.Wait for 5 minutes and refresh the fleet manager to see the ec2 instance displayed. Terminate the instance and delete the activation

## Lambda

122. Create a lambda function from scratch with python and modiy the code to be this
   ```
    import json

    def lambda_handler(event, context):
    return "this is version 1
   ```

   Deploy and test.
   Go to the top section in actions, publis new version, click on pubish. Now you can test the lambda version but you cannot update(edit) it (because you are under lambda version 1), you go back to the lambda function. When you go back to the lambda function update(edit), test and publish and you will see version 2 being created

   Now navigate the lambda function section and create an alias named dev and it should be linked to the latest version. Create a test alias and let it point to version 2. Test the alias to confirm the output. Create the prod alias and point it to version 1. Test the alias.

   Go to the list of all aliases and edit the prod alias to receive weighted traffic for version 20, add the percentage to 50% and test the alias. You should get traffic from both versions

123. Create a lambda function modify its code to return a env name
   ```
    import json
    import os

    def lambda_handler(event, context):
        return os.getenv("ENVIRONMENT_NAME")
   ```

   Navigate to configuration and add a environment variable name ENVIRONMENT_VARIABLE with a value of dev. Test the function to see the env variable.

## API GATEWAY

124. Create an api gateway in  the api gateway service. Choose rest api and the api detail should be new API. Give it a name and set the endpoint type to regional and create it. Navigate to the api and create a method. Should be a GET type and lambda function integration. Enable lambda proxy integration , leave it as buffered. And from here we have to create the lambda function. Give your lambda function a name and choose python 3.14 as the runtime, leave other setting. Copy the lambda code in the api-gateway folder (/home/ryankaleligabriel/cloud-control-plane/Solutions_architect/code_v2025-10-27/api-gateway/lambda-code.py) and test it. Go back to the api gateway and select the new lambda function and create method. Go to the lambda function and in under configuration and permissions check the resource based policy to see if the api gateway is authorized to access your lambda function. Test to see the response. In the api gateway, Create a resource and name it houses. Repeat the same steps for creaing a method and linking the method to a new lambda function that instead says "HELLO from my pretty houses" in the print statement. Test the endpoint from the api gateway. Deploy the api and choose a new stage and name it dev. Test the invoke URL with both endpoints i.e "/" and "/houses".

125. Create a  new resource and name it /stage-variables. Create a lambda function and name it api-gateway-stage-variable-get. Copy the same code from the file in the first task but it should say hello from lambda v1. Test it, Deploy it, then test it again. Still in lambda go to actions and publish it as v1. Go back to the function change it to say HEllo from lambda v2 and repeat the steps up until publishing. Go back to the function, update the code to say hello from dev. Do not publish the function as it is going to be the latest one. Now create aliases for the function named DEV, TEST and PROD. Pointing to LATEST, V2 AND V1 respectively. Now head back to api gateway and create a method which will be a get method under stage-variables. Choose the lambda arn from the lambda funcion you created and after the arn add ':${stageVariables.lambdaAlias}'. A warning willpop up that will ask if you have the right permissions and you have to add it to cloud shell. Copy the permissions command and modify this part named stageVariables.lambdaAlias and add the aliases you created as shown in the commnda below

   ```
   aws lambda add-permission \
    --function-name "arn:aws:lambda:us-east-1:737429582017:function:ApiGatewayFunc-stage-variable-get:DEV" \
    --source-arn "arn:aws:execute-api:us-east-1:737429582017:rpwuod3yjg/*/GET/stage-variables" \
    --principal apigateway.amazonaws.com \
    --statement-id 33fdc68b-b863-44a0-a6a7-04a652604517 \
    --action lambda:InvokeFunction
   ```

   ```
    aws lambda add-permission \
    --function-name "arn:aws:lambda:us-east-1:737429582017:function:ApiGatewayFunc-stage-variable-get:TEST" \
    --source-arn "arn:aws:execute-api:us-east-1:737429582017:rpwuod3yjg/*/GET/stage-variables" \
    --principal apigateway.amazonaws.com \
    --statement-id 33fdc68b-b863-44a0-a6a7-04a652604517 \
    --action lambda:InvokeFunction
   ```

   ```
    aws lambda add-permission \
    --function-name "arn:aws:lambda:us-east-1:737429582017:function:ApiGatewayFunc-stage-variable-get:PROD" \
    --source-arn "arn:aws:execute-api:us-east-1:737429582017:rpwuod3yjg/*/GET/stage-variables" \
    --principal apigateway.amazonaws.com \
    --statement-id 33fdc68b-b863-44a0-a6a7-04a652604517 \
    --action lambda:InvokeFunction
   ```

   Create your method. Go back to your lambda function alias like the prod one and confirm under configuration and permissions if a new resource based policy of the api agteway has been added. Back to the api-gateway click on the get method in stage-variables and test it. You will notice lambdaAlias input field. Test with the respective lambda alises like PROD, TEST and DEV. Now deploy the api with a stage name called dev and after deploying scroll down and manage stage variables. Add a new one called lambdaAlias and give its value should be DEV. It means this deployment will trigger the PROD alias. Deploy the api two more times repeating the steps for the prod and test as stage names and add the stage variables for the respective lambda aliases. Test the api using the invoke url and add /stage-variables because it it the name of the resource.

126. OpenAPI implementation. Under api gateway, create a new api and select rest api and import.You can import api or use example api and create the api. You can also go to the api we created from the previous tasks and navigate to a stage for example prod in stage actions you can export api to generate an api definition file or generate a sdk for your api that can be used for different platforms and this is generated by api gateway

127. You can cache the api-gateway in the stages by editing the stage details

128. Canary deployment. Create a new resource under the api we created in the eariler tasks and name it /canary-demo. Use a lambda function in the resource ad use the arn that we used for stage-variables tasks because it has two versions 1 and 2. In the arn add ':1' to reference version 1. e.g arn:aws:lambda:us-east-1:737429582017:function:ApiGatewayFunc-stage-variable-get:1. Test and deploy in a new stage called canary. Test the url ending with /canary-demo so that it takes you to v1. In th canary stage. Go to canary section below and edit the canary to 50%. Go back to resources and under /canary-dem and GET, edit the integration request and in the arn. Switch the arn to :2 and save. Deploy the api again and choose the stage as canary and now you can test the inoke url to see the requests going from v1 to v2.
