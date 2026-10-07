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
      - non-alphanumeric characters
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


5. Creating roles for aws services. Create an IAM role for an EC2 instance, attach a policy that gives the role read-only access to an S3 bucket, then attach the role to an EC2 instance and verify that the instance can list and read objects from the S3 bucket using the role. Delete the role and the ec2 instance


6. Check status of account credntials in IAM credentials report by downloading it and viewing it in google sheets. Check the status of:
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


7. Audit permissions in iam access advisor. Navigate to groups select the group you want to analyze and navigate to access advisor. Filter by service not accessed. Do not remove the unused ones yet.

## 02 EC2

8. Setting a billing budget. Nvaigate to  Billing and cost managemen, then budgets then create budget. Select Use a template, Monthly cost budget. Give it a name and set email recipients then create budget.

9. Create an EC2 instance using a:
   - User Data script that installs Apache and configures a simple “Hello” page displaying the EC2 instance’s IP address. Changes the ssh port to 4326
   
   - A security group that allows the following inbound rules SSH on port 4326, HTTP traffic on port 80 and ICMP ipv4 from your network. Try sshing using port 22. Change the ssh port to 4326 and try again. Try accessing the web server from your phone and laptop. Then again using your phone connected with bundles.
   
   - Assign the EC2 instance an IAM role with read-only access to all S3 buckets and verify access by listing the buckets.
   
   - By default all traffic is allow outbound. Test internet connectivity by pinging and curling `google.com`. 
   
   - Create an Elastic IP, associate it with the EC2 instance. In a terminal ping the ip, then stop and start the instance to verify whether its public IP changes and confirm that the Elastic IP remains associated. 

   Terminate the ec2 instance and the release the elastic ip
   
10. Design placement groups for different types of applications. Create and launch ec2 instances there. (Optional)


# Tuesday 

11. Create two EC2 instances and create a separate ENI in the same Availability Zone. Attach the ENI to the first instance and verify its private IP, then detach it and attach it to the second instance. Verify that the second instance now has the ENI and its private IP, demonstrating that the ENI can be moved between instances.
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

12. Create an ebs volume. Volume type gp2, size 3GIB same az as your ec2 instance, encrypt using default aws key. Attach the ebs volumes to the amazon ec2 instance, format it and make it available in the ec2 vm. After attaching it to the ec2 instance
    - ssh into the ec2
    - Check the device files ```lsblk``` and identify the new attached volume by size
    - Format it to ext4 filesystem type ```sudo mkfs.ext4 /dev/nvme1n1```
    - Create a directory where you will mount it ```sudo mkdir /data```
    - Mount it ```sudo mount /dev/nvme1n1 /data```
    - Confirm ```df -h```

13. Create an ebs volume in a different region/availability zone that your current ec2 instance is created. Take a snapshot of the ebs volume. Create a volume with the snapshot the volume should be in the same az as your current ec2. Attach the volume  to the ec2 instance and make it work (formatting etc). Create a 1 day retention rule for snapshots (recycle bin section) . Delete the snapshot(s), then recover them from the recycle bin.

14. Encrypt an unencrypted EBS volume. I.e  Create an unencrypted volume, create its snapshot, copy snapshot but also encrypt snapshot. Create a volume from the encrypted snapshot

15. Remove the recycle bin retention rule. Delete all created ebs volumes and snapshos 

16. Look at ## AMI process (from an ec2 instance) in (02_ec2_instance_storage.md). Using the same ec2 instrance, which was created with a user data script that updated and installed a web server like apache or nginx, enable the web server in systemctl. Test using its public ip and see if the instance works( if you see the welcome page of the web server). Create an ami from that image at that point. Launch another ec2 instance with that ami image and see if its the welcome page show. Do not terminate the instances you will use them in no. 20. Delet the ami


17. Create an efs file system. Create two ec2 instances, while creating the two instances, configure the file system with the instances. Connect to one of the instances. Create a file where the file system is mounted, write something in that file like hello world. Login to the other instance. Confirm if the file exists by printing it out. Look at the secuirty of the file system you created if it has sgroups from the ec2 instances too. Terinate the instances and file systems

18. Using the two ec2 instances you currently have from no.18 . Create an application load balancer and create for it a new security group allowing it to accept HTTP traffic (inbound). When creating the load Balancer create targets and include the two launched ec2 instances. After the alb has been provisioned access test using its DNS address.

19. You can still access the contents of each launched vm in (20) by their ip. To remove that edit the security group tied to the vms and attach the security group of the load balancer to be able to access the contents only through the load balancer. Hint under http rule choose cidr as the security group of the load balancer. 

20. Add a rule in the load balancer that if the path is /error it returns a custom message.

# Wednesday 

21. Set a sticky session for your load balancer and make the sticky session be generated by the load balancer. Navigate to target groups, select the target group and navigate to attributes. Edit them to add stickiness Test and refresh the load balancer to see if it goes to the same ec2. Inspect the web page and check the request and response cookies. Delete one the ec2 instances  and stop the other.

22. With a demo app try adding a ssl cert using acm of importing it. Add it to the alb y adding a new listener in the alb



23. Create and auto scaling group. First create a launch template. Manualy edit the desired and maximum caoacities and observe the changes in the monitoring and actions tab

24. Create a Dynamic policy (target tracking). Target cpu spikes. Use stress linux os package to increase cpu load. Observe after 15 minutes in the monitoring tab of the auto scaling group. Delete the target tracking policy

Delete evrything apart from the load balancer security group


## RDS


 25. Create a mysql rds db, fully configured with:
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
     - Public access = ?
     - Add mysql access (3306) To launch-wizard-1 and use launch-wizard-1 as the sg
     - Choose an AZ(any)
     - Log exports = Error and General
     - Backup retention period = 1 day

      administer a security group, connect it through sqlelectron (local tool) or just use your teriminal.

    Connect to your rds instance in sqlelectron
    - name = demodb
    - DB Type = MySQL
    - Server address = Available in the Connectivity and security
    - User = admin
    - Password = password 

    Test first. Then connect.

    Create a DB
    ```
    CREATE DATABASE sample_db;
    ```

    Select it
    ```
    USE sample_db;
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

26. Create a dev environment (web service). with beanstalk. While creating the service, navigate to iam, roles and create an iam role:
   - Choose Aws service
   - Choose EC2 as the use case
   - Add permissions
     - AWSElasticBeanstalkWebTier - permissions for Beanstalk apps serving web requests.
     - AWSElasticBeanstalkWorkerTier - permissions for apps processing background jobs/tasks.
     - AWSElasticBeanstalkMulticontainerDocker - permissions needed to run/manage multiple Docker containers in Beanstalk.

   Link the role to the envivornment in the EC2 instace profile. Launch the environment an acceess it through the domain provided by aws





## S3 Intro

27. Create a regional s3 bucket and add coffee.ipg in the code folder of this directory. Try accessing it through the open button in the object dashboard in the console. Try accessing it using the domain url. It should not display in the domain access ecause it has no public access granted. The open button has a signature that it is you who is accessing it

28. Create a folder and add the beach.jpg. Delete the folder

29. Remove block public access for the bucket. Create a bucket policy using aws policy generator. Make sure all objects are publicly accessible by using the GetObject policy in the policy generator and using a (/*) postfix after copying the bucket arn.

30. Upload the beach.jpg in the same level as the coffee.jpg. Enable the s3 to host static sites. and upload the index.html. Access the domain url and observe the static site deployed. Also OPEN THE image displayed in a new tab to see it s3 url of the same image

# Thursday
 
31. Add versioning to your bucket. Edit index.html in vscode and reupload it. Go to the objects dashboard and enable versioning to see the version ID. Reload the site to see the changes. Add a delete marker to coffee.jpg by tuggling of the show version and deleting the coffe.jpg. It does not delete the image but when you refresh the webise the image is not displayed. It has not been deleted from the bucket but a delete marker has been added. elete the delete marker to see the image 

32. Create two buckets in different regions origin bucket and replica bucket respectively. Enable versioning in both of them while selecting create new iam role and save them. In the first origin bucket upload the beach image. Then in the management tab add a replication rule pointing to the other bucket in a different region.Do not replicate existing data. Upload another image like coffee.jpg and refresh the objects in the replica bucket. Edit the replication rule in the origin bucket to enable replication of delete markers. Add a delete marker in obe of the objects in the origin bucket. Observer if the delete marker has been replicated in the replica bucket. Permanently delete an object in the origin bucket and observe if it is deleted in the replica bucket (should not work)

33. Create a new bucket with default settings in any region. Add coffee.jpg. Edit the storage class to one zone IA and save. Edit the bucket rules and enable transition current versions of object to storage classes. Add different storage classes transitioning with different days and save


## S3 advanced

34. Review current and noncurrent version transition and expiration actions, including storage-class transitions from Day 0 through Day 365, object expiration at Day 700, noncurrent version transitions to Glacier Flexible Retrieval at Day 90, and permanent deletion of noncurrent versions at Day 700.

35. Event notification. CReate a new bucket, default settings( regional). Create an sqs queue to send messages to whenever a file is uloaded in the bucket. You will have to change the access policy of the sqs queue to allow messages to be sent to it by the sqs queue. Hint use access policy generator. You will have to link the s3 to sqs communication in the s3 section

## S3 security

36. Create a bucket, enable versioning and server side encryption should be set to the default sse-s3. Upload an image to the bucket and view its properties to see the encryption enebaled. Change the encryption method to sse-kms. Check the versions of the objects in the bucket to see two versions of your image.

37. Test cors in your first markdown. Create upload the index.html in your first bucket that had static website enabled and make sure in the cors section (javascript) include on to fetch extra-page.html not the an aws domain name. Upload the extra-page.html. And access the page to see the extra page. Delete the extra-page.html.ate another origin bucket in another region, lets say canada and enable static webiste to it, set the main faile to index.html, remove all blocks when creating the bucket and add a policy that allows public access. Upload the extra-page.html there and go back to vscoe and change the index.html to fetch the extra-page.html from the new bucket by including the bucket domain name and /extra-page.html. Upload the index.html in your first bucket again and try accessing the page. Observer the cosole tab and see the cors error. Edit the permissions in the new bucket where the extra page is and include the cors config in vscode, make sure the allowed origins does not end with a slash. And add the url of the first bucket to the allowed origins. Save and hard reload the page to see the extra page appear



## Cloudfront

38. Create an s3 bucket with default settings nothing changed, upload index.html, coffee and beach .jpg. CrEATE A CLOUD FRONT DISTRIBUTION AND LINK IT TO THE S3 BUCKET, it will automatically copy a the policy to allow cloud front to access s3 and the policy will be copied to the s3 bucket. After creating it make sure the root object is set to index.html. After it has deployed open the cloudfront dns settings to access the site. Add /coffee.jpg to the dns name reload, then do the same for beach.jpg and reload. This is just to see both images. Reload the site without both /images.jpg just the original dns so that inde.html is fetched from cloud front not s3 and do the same for the images

## Storage extras 

39. Create another bucket that will be collecting logs for your first s3 bucket. In the permissions of the first bucket enable logging and link to the new bucket and check if the bucket policy is changed to allow logging

40. Create a pre signed url from an object in a bucket that is private like th event notification one. Copy it somewhere and open with another device. Set the presigned url to expire after 5 minutes

# Friday

## SQS

41. Create a sqs queue with default settings and 30 second message resend if the message is not deleted. Try sending a message from the queue tab and poll for messages to see if a message has been receiived. Wait for 30 seconds and see the message count, it should be 2 for the same message. Delete the message.

42. Create a fifo queue and the name should end with '.fifo'. Send 4 different messages with the same groupd id but different messages and deduplication ids. Research what is deduplication in sqs

## SNS

43. Create a sns topic, standard one. With default settings. Create a subscription to send messages to your email. Confirm the subscription from your gmail. Send a messages to the email to confirm and it is working. Delete the subscription and topic

# ECS

44. Create an ecs cluster with both fargate and self managed instances option. Set the desired ASG to 0 desired and 5 Maximum and leave the default options. After the cluster has been created go to the autoscaling group tab and changed the desired instances to 1 and save. Check if an ec2 instance has been launched (it should be) and go back to the cluster and check the containers status. The ec2 instance should be launched from there.

45. Check the video for creating an ecs service in the aws not free tutorials and write the steps down and implement it

## Lambda

46. Create a demo function with python hello-world template and run it in lambda. Check the metrics in the monitoring tab

## Dynamo DB 

47. Navigate to the dynaodb service in the console and create a table name with a partition key which will be the primary id. Choose customize seting and dynamodb standard. Read and write capacity both set with OFF autoscaling and 1 rovisioned capcity each. Create the table. Create an two iems and each item should have a user_id and add 3 different attributes to each item. So that you see the schema flexibiliy it has to offer 


## API gateway

48. Create an api gateway in  the api gateway service. Choose rest api and the api detail should be new API. Give it a name and set the endpoint type to regional and create it. Navigate to the api and create a method. Should be a GET type and lambda function integration. Enale lambda proxy integration , leave it as buffered. And from here we have to create the lambda function. Gie your lambda function a name and choose python 3.14 as the runtime, leave other setting. Copy the lambda code in the api-gateway folder and test it. Go back to the api gateway and select the new lambda function and create method. Go to the lambda unction and in under configuration and permissions check the resource based policy to see if the api gateway is authorized to access your lambda function. Test to see the response. Create a resource and name it houses. Reapeat the same steps for creaing a method and linking the method to a new lambda function that instead says "HELLO from my pretty houses" in the print statement. Test the endpoint from the api gateway. Deploy the api and choose a new stage and name it dev. Test the invoke URL with bothe endpoints i.e "/" and "/houses"

## Athena

49. Navigate to the athena service page and create and select "Query your data in Athena console". It should show you this pop up "Before you run your first query, you need to set up a query result location in Amazon S3.". Select "Edit setting and manage to create a s3 bucket which will store your query results. Navigate to the s3 servie page in another tab and create a regional s3 bucket. Go back to athena and choose the created bucket. There is a s3 bucket that was created from previous tasks that had access logs. We will use this bucket as our db. Navigate to editor tab in athena and run the first line of code in "/home/ryankaleligabriel/cloud-control-plane/Solutions_architect/code_v2025-10-27/s3-advanced/athena-s3-access-logs.sql" to create a database first. Select the database created in the right hand side navigation tab. Next is to copy the create table query and switch the location with the location of your logs. The previous example location was 's3://ryankaleli-s3-access-logs/'. Got the uri by clicking an object and copying its uri. In the table click the navbar link and click preview table and it should return some results from your table. Run the other queries in the code file listed above

##  Polly

50. Navigate to polly and try it out with the default sentence. Use the SSML feature to add a break in your sentences by using this input text "'<speak>Hi, I’m Danielle. <break time="1s" /> I Love AWS</speak>'". Upload a lexicon to change AWS to Amazon web services

# Saturday 

## Cloudwatch

51. Check the cloud watch logs tutorial in the not free tutorials folder (its free)

52. Create an ec2 instance t3micro with default settings. Create a classic cloudwatch alarm and select a metric, choose ec2 then choose per instance metri. Paste the instance id of the ec2 instance and select it in the search bar and select cpu utilization %. Afte that choose a 5 minute period so the metric can be populated evry 5minutes. Leave the statisticat average, Choose the cndition as static and greater than 95%. In the additional conifiguration. Choose the datapoints of the alarm to be 3 out of 3 wich means for 15 minutes if it stays at 95% and above the metric goes to alarm state. Click on next and choose the action point, we will go for ec2 action and terminate this instance. Click next and give the alarm a name. Verify and click the alarm. Because waiting for 15 minutes will be long we can set the alarm state from the ec2 instance (cloudshell) by running the command 

```
aws cloudwatch set-alarm-state \
    --alarm-name "YOUR_ALARM_NAME" \
    --state-value "ALARM" \
    --state-reason "Testing notification triggers"
```

after that run checkthe history of the alarm and its state and check to see the ec2 instance state. Should be terminated

53. Create an eventr bridge bus. Give it a name and enable archiving and schema discovery. Create a rule and give it a name and select the created bus as the default bus and click next. Now we want to create an event pattern. Select 'AWS events or EventBridge partner events' ans the event source. In the sample event type (this is for testing purposes) select AWS events and the sample evetnt choose "EC2 instance State-change Notification" and Sample event 4 who's state is stopped. Event pattern creation, pick "Use pattern form" and Event source as AWS services, Aws service as EC2 Event type as ' EC2 Instance State-change Notification. Choose Event Type specification 1 as 'Specific state(s) and choose 'stopped' and 'terminated'. Test the pattern and click next. In the targets choose aws service as the target type and sns topic as the target The topic choose demo-topic or create one with default settings. You can now create a subsription in sns that sends emails to your email. AFter that create and terminate a default t3.micro ec2 instance


## Cloud trail

54. Create a bareminimum ec2 instance and make sure its running, terminateit and observer the event history after five to ten minutes in the cloudtrail events history to see if its generated.


## VPC

55. Creata a vpc. Give it a name tag DemoVPC, IPv4 Cidr manual input, IPv4 CIDR is 10.0.0.0/16 and No IPv6 CIDR block. Tenancy set to Default and create the vpc.

56. Here in this exercise we will create 4 subnets for our new vps. Two subnets will be private and 2 will be public. The first public subnet will have a 10.0.0.0/24 CIDR and it will be in availabiliy zone us-east-1a (256 available ip addresses with the first ip address starting from 10.0.0.0 and the last having 10.0.0.25 ). The second public subnet will have a cidr of 10.0.1.0/24 in us-east-1b and will have  256 ip addresses (first ip address will be 10.0.1.0 and the last one will be 10.0.1.255). So the first and second subnets have different ips. The private subnets are assumed to have more hosts. So we will give both a /20 cidr. The first private subnet will hae a cidr block of 10.0.16.0/20 (4096 available ips, 10.0.16.0 is the first ip address, 10.0.31.255 is the last one) and the other one which will be in us-east-1b will have a cidr block of 10.0.32.0/20 (4096 available ips, with 10.0.32.0 as the first IP and 10.0.47.255 ad the last ip)

57. Edit both public subnets and enable ip address auto assigning. Create an ec2 instance with default settings and make sure the ec2 instance is in the vpc you just created and in publicsubnetA and has not key pair. Try connecting using ec2 instance connect and it should fail because there is no internet gateway. Create an internet gateway and attach to the vpc. Try connecting to the ec2 instance again using ecn instance connect, it should fail. Because there is no route table. Create two route tables the private route table and the public route table, explicitly associate theprivate subnets to the private route table and vice versa. Now we will edit the routes in the public route table to send traffic to the internet gateway. So we will add a route Destination 0.0.0.0/0 and target internet gateway and we pick the internet gateway we created. The first rule means that any instance within our vpc (10.0.0.0/16) goes to local which means from within our vpc. The new rule means that anthying else (0.0.0.0/0) which includes public ips (that your ec2 instance was given) can go to the internet gateway. Now connect to the ec2 using ec2 instance connect and ping google.com

58. Rename the ec2 instance as bation host. It will be used toas a bastion to log into ec2 instances that are in the private subnet. Users will ssh into the bastion and jump into the private ec2 instances. Create another ec2 instance and the key pair select the one you created earlier in the course or create a new.pem one with rsa. Choose the vpc we created and private subnet A. Create new security group and name it privatesg. n the inbound security group rules select source type of ssh as custom and the source choose the security group of the bastion host, decsription write allow ssh for bastion host. Launch the instance. Connect the bastion ec2 from ec2 instance connect, create a file named DemoKeypair.pem and copy the contents of the key pair in this file. Now ssh into the new ec2 instance ```ssh ec2-user@privateip -i DemoKeypair.pem```

59. Create a NAT gateway. Give it a name, availabilitymode = zonal Subnet = PublicSubnetA, Connectivity type = public and allocate an elastic IP. Edit your private route table and allow all ips (0.0.0.0/0) destionation to access the target NAT gateway you created. Login to the private ec2 via the bastion and ping google.com (It should work)

## NACLs

60. In the bastion host install apache and echo hello world in this file ```echo "<h1>Hello World from $(hostname -f)</h1>" > /usr/share/httpd/noindex/index.html```. Access the server using its public ip make sure is not https. Now we want to demonstrate the rule numbering. Add a new rule in the nacl inbound rules and number it 80 it should deny http from port 80. Try rereshing the ec2 instance to see if it works. It should not because rule 80 will be evaluated after 100. Edit rule 80 and give it number 140. It should now work. The ec2 instance should load. We want to demonstrate nacls statelessness. Remove the outbound rule from the Default nacl and save then refresh the ec2 instance it should be in a never ending loop loading. Add it back. We want to demonstrate security groups statefulness. Navigate to the security group of the bastion host and remove the outbound rule and save then refresh the ec2 instance. It should work because security groups are stateful

# Sunday

## VPC Peering. L

61. Luanch an ec2 in the default vpc and leave it with the default settings AND ALLOW ALL TCP FROM ANYWARE. Connect to it and run curl ```bastion_ip_address:80/```. It should fail because they are not connected. Now navigate to peering connections and create a peering connection by giving it a name and select the requester as the DemoVPC and the accepter as the defaultvpc with my account and this region selected. aFTER that try curling again and it should fail because we need to modify the route tables. In the default route table add a route with destination as the cidr of the defaultroutetablevpc and target should be peering connection and select the peering connection you created. Try curling again and it should not work because all route tables have to be editted. Do the same for the publicroute table. Try curling and it should work now

## VPC Endpoints

62. Connect to your privateinstance. We want it to be able to access our s3 buckets. Give your instance a role in the security and settings. Modify the IAM role for the instance by creating a new role. Go to iam create a role for aws service ec2 and the role should be AmazonS3ReadOnlyAccess. Give the role a name and assign it to your instance. Since the private route table which is for the private subnet has internet access through the nat gateway and the private instance is in the private subnet, this private instance can access the internet. Test it by running ```aws s3 ls``` and curl ```google.com```. Create an endpoint and give it a name. Type = aws services and  type should be gateway named "com.amazonaws.us-east-1.s3" and the vpc should be demovpc also select the route table as the privateroutetable and policy is full access. After it has been created check the private route table has added a new route for the endpoint. Test curl it should not work but testing ```aws s3 ls```. It should work, the ec2 in the private subnet cannot access the internet but it can access the aws services


## VPC Flow logs

63. We will create 2 flow logs one going to s3 and one sending logs to cloudwatch. Create a vpc flow log. By clicking on demovpc and actions. Give it a name and caputre all traffic in the filter. Maximum aggregation interval of 1 minute destination to s3. Create an s3 bucket with defaultsettings and a name and copy the arn to the s3 bucket arn then create the flow log. Do the same for cloudwatch but when creating it. Create a default log group in cloudwatch logs and create an IAM role. The IAM role will be custom trust policy and this should be the policy

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

64. For analysis with amazon athena, we can create a new s3 bucket for our query result location. Create a new bucket with default settings and manage the query settings in athena to add the new bucket. Copy the bucket arn but confuring it to athena will be different. For example this is the arn    ```arn:aws:s3:::demo-athena-ryan-v2-737429582017-us-east-1-an``` but we will configure it as ```s3://demo-athena-ryan-v2-737429582017-us-east-1-an/athena/```. After that is done we can create a table in athena. I created this table and did the following actions from a [tutorial](https://docs.aws.amazon.com/athena/latest/ug/vpc-flow-logs.html).

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

65. Navigate to demovpc, actions and edit cidrs. Create add ipv6 CIDR and choose Amazon-provided IPV6 CIDR. We will create an ipv6 cidr for the publicsubnetA, select bastion host and actions. Under networking you will see manage ip addresses, click on the eni interface and assign a new ipv6 address and leave it at auto-assign. cHECK THE IPV6 In the bastion host,it has been assigned. IN the security group of the bastion host use edit to add an inbound rule to allow ssh traffic from anywhere ipv6. You can now ssh using ipv6 if your local computer allows ipv6. A ipv6 route will be added to the route table

## eGRESS ONLY IPV6. 

67. Navigate to the egress only internet gateway. Create the gateway and link it to the demovpc. Add a route in the privateroutetable and the destination should be ::0/ andy ipv6 and target is the gateway you created. So your private instances can access the internet but connection cannot be initiated from the internet (EGRESS ONLY)

## aws BACKUP

Check in the not free directory.

## Cloudformation

68. Deploy an ec2 instance using cloudformation. Navigate to cloud formation and create a stack . Templte = existing, and select upload. Upload the first .yaml in the code folder in the cloudformation folder , you can view it in infrastructure composer and click next. Give your stack a name. Tag it and click on next. Create the stack and check if an ec2 instance has been created.

69. We will update the current template with another one. Navigate to events and Click on update stack and make direct update. Replace existin template. Upload the second file in the cloudformation code folder. View in infrastructure composer. Gie your security group a description. Check the change set to see the changes cloudformation will do. Submit and leave cloud formation to cook. After 1 minute check the ec2 page to see the ec2 instance being created. Delet the stack and cloudformation will delete everything it provisioned in the right order

## SSM

70. Launch an ec2 instance with the default settings and no key pair and in advanced section we will create an IAM profile. Navigate to IAM and roles and create a role for ec2. Choose this for permissions "AmazonSSMManagedInstanceCore". Give it a name and create the role. Select the role in the ec2 iam profile and launch the instance. Navigate to the fleet manager uunder the ssm service to see all instances managed by ssm there. Navigate to session manager and start session. Select the ec2 insatnce and start the session
