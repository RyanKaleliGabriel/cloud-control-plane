## Route 53

For a task that requires many records created, they wiil have the same subdomain name.

Create a domain name in a public hosted zone before anything

28. WIth a paid account create 3 ec2 instances in different regions, each with apache and they should be displaying their ip addresses In  a text file write their public ips along side their az and also note down the dns name of the alb you will create. Create an alb such that the target groupof the alb points to the three ec2 instances. Create a domain record in route53 and create a subdomain record that points to the alb. Set a time to live of 120 seconds and access the web service using the created subdomain. Use nslookup to check if the mapping of the subdomain is correct. Use dig to check how the TTL cache time reduces by running dig in intervals of 5 secons. After the TTL is donefor the dns subdomain refresh the subdomain in the web browser and it should point to a different ec2

29. From the route53, create an alias and a cname record from the alb created

30. Create a subdomain record, mapit to one of the ec2 instances and set routing policy to simple. Test in the web browser. Then edit the record and add the rest of the ec2 instances ips. Check the TTL in using dig(commandline tool). Refresh the subdomain in the browser to see if the ip changes. (It should change)

31. Create a subdomain record ans assign it a weighted routing policy. The first record assign it to the first instance with a weight of 70, then the second record assign to the next ec2 instance with a weight of 20, then the third record to the third ec2 instance with a weight of 10. Each record give it a 3 second TTL. Access the record in your browser. You should notice that most requests go to the first instance

32. Create another subdomain to test latency based routing policy. Since our ec2 instances are in different regions after creating another subdmomain configure it with latency routing policy and create 3 for the 3 ec2 instances records, each record should have latency routing policy and the region should be set to the region where each ec2 instance is from. Test with a vpn to full see how the ip changes in the browser

33. Create health checks for each ec2 instance. Create one calculated health check for the health checks created. After the health check of the ec2 instances has been created, in one of the ec2 instances remove the http rule in the security group and observer if the health check will fail

34. Create a failover health check. Create a subdomain record and point it to one of the ec2 instances in region A, add a health check type of failover and a TTL of 60 . The add record 2 with the value (A record type) set the ip of another instance in region B. Access the subdomain in the browser. Edit the security group of the first instance to remove access from port 80 and wait for the health check to fail. Refrehs your browser to see if it has failed over to the other ec2 instance in region B

35. Create a geo location ruting policy. Create a subdomain name geo.yourdomain.com. Create three records and link them to the regions where your ec2 instances are from. Access the subdomain in your browser to check where it send you to. Use a vpn to jump to the regions your other ec2 instances are and refresh the subdomain. Make sure the security groups are intact, i.e port 80 is exposed

36. Delete the load balancers and ec2 instances, the domain name is optional if you are using it. Delete the hosted zone

## Beanstalk

1. Create a dev environment (web service). with beanstalk. While creating the service, navigate to iam, roles and create an iam role:
   - Choose Aws service
   - Choose EC2 as the use case
   - Add permissions
     - AWSElasticBeanstalkWebTier - permissions for Beanstalk apps serving web requests.
     - AWSElasticBeanstalkWorkerTier - permissions for apps processing background jobs/tasks.
     - AWSElasticBeanstalkMulticontainerDocker - permissions needed to run/manage multiple Docker containers in Beanstalk.

   Link the role to the envivornment in the EC2 instace profile. Launch the environment an acceess it through the domain provided by aws


## S3 Intro

1. Create a regional s3 bucket and add coffee.ipg in the code folder of this directory. Try accessing it through the open button in the object dashboard in the console. Try accessing it using the domain url. It should not display in the domain access ecause it has no public access granted. The open button has a signature that it is you who is accessing it

2. Create a folder and add the beach.jpg. Delete the folder

3. Remove block public access for the bucket. Create a bucket policy using aws policy generator. Make sure all objects are publicly accessible by using the GetObject policy in the policy generator and using a (/*) postfix after copying the bucket arn.

4. Upload the beach.jpg in the same level as the coffee.jpg. Enable the s3 to host static sites. and upload the index.html. Access the domain url and observe the static site deployed. Also OPEN THE image displayed in a new tab to see it s3 url of the same image
 
5. Add versioning to your bucket. Edit index.html in vscode and reupload it. Go to the objects dashboard and enable versioning to see the version ID. Reload the site to see the changes. Add a delete marker to coffee.jpg by tuggling of the show version and deleting the coffe.jpg. It does not delete the image but when you refresh the webise the image is not displayed. It has not been deleted from the bucket but a delete marker has been added. elete the delete marker to see the image 

6. Create two buckets in different regions origin bucket and replica bucket respectively. Enable versioning in both of them while selecting create new iam role and save them. In the first origin bucket upload the beach image. Then in the management tab add a replication rule pointing to the other bucket in a different region.Do not replicate existing data. Upload another image like coffee.jpg and refresh the objects in the replica bucket. Edit the replication rule in the origin bucket to enable replication of delete markers. Add a delete marker in obe of the objects in the origin bucket. Observer if the delete marker has been replicated in the replica bucket. Permanently delete an object in the origin bucket and observe if it is deleted in the replica bucket (should not work)

7. Create a new bucket with default settings in any region. Add coffee.jpg. Edit the storage class to one zone IA and save. Edit the bucket rules and enable transition current versions of object to storage classes. Add different storage classes transitioning with different days and save


## S3 advanced

1. Review current and noncurrent version transition and expiration actions, including storage-class transitions from Day 0 through Day 365, object expiration at Day 700, noncurrent version transitions to Glacier Flexible Retrieval at Day 90, and permanent deletion of noncurrent versions at Day 700.

2. Event notification. CReate a new bucket, default settings( regional). Create an sqs queue to send messages to whenever a file is uloaded in the bucket. You will have to change the access policy of the sqs queue to allow messages to be sent to it by the sqs queue. Hint use access policy generator. You will have to link the s3 to sqs communication in the s3 section

## S3 security

1. Create a bucket, enable versioning and server side encryption should be set to the default sse-s3. Upload an image to the bucket and view its properties to see the encryption enebaled. Change the encryption method to sse-kms. Check the versions of the objects in the bucket to see two versions of your image.

2. Test cors in your first markdown. Create upload the index.html in your first bucket that had static website enabled and make sure in the cors section (javascript) include on to fetch extra-page.html not the an aws domain name. Upload the extra-page.html. And access the page to see the extra page. Delete the extra-page.html.ate another origin bucket in another region, lets say canada and enable static webiste to it, set the main faile to index.html, remove all blocks when creating the bucket and add a policy that allows public access. Upload the extra-page.html there and go back to vscoe and change the index.html to fetch the extra-page.html from the new bucket by including the bucket domain name and /extra-page.html. Upload the index.html in your first bucket again and try accessing the page. Observer the cosole tab and see the cors error. Edit the permissions in the new bucket where the extra page is and include the cors config in vscode, make sure the allowed origins does not end with a slash. And add the url of the first bucket to the allowed origins. Save and hard reload the page to see the extra page appear