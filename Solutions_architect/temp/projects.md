## NACLs

1. In the bastion host install apache and echo hello world in this file ```echo "<h1>Hello World from $(hostname -f)</h1>" > /usr/share/httpd/noindex/index.html```. Access the server using its public ip make sure is not https. Now we want to demonstrate the rule numbering. Add a new rule in the nacl inbound rules and number it 80 it should deny http from port 80. Try rereshing the ec2 instance to see if it works. It should not because rule 80 will be evaluated after 100. Edit rule 80 and give it number 140. It should now work. The ec2 instance should load. We want to demonstrate nacls statelessness. Remove the outbound rule from the Default nacl and save then refresh the ec2 instance it should be in a never ending loop loading. Add it back. We want to demonstrate security groups statefulness. Navigate to the security group of the bastion host and remove the outbound rule and save then refresh the ec2 instance. It should work because security groups are stateful

## VPC Peering. L

1. Luanch an ec2 in the default vpc and leave it with the default settings AND ALLOW ALL TCP FROM ANYWARE. Connect to it and run curl ```bastion_ip_address:80/```. It should fail because they are not connected. Now navigate to peering connections and create a peering connection by giving it a name and select the requester as the DemoVPC and the accepter as the defaultvpc with my account and this region selected. aFTER that try curling again and it should fail because we need to modify the route tables. In the default route table add a route with destination as the cidr of the defaultroutetablevpc and target should be peering connection and select the peering connection you created. Try curling again and it should not work because all route tables have to be editted. Do the same for the publicroute table. Try curling and it should work now

## VPC Endpoints

Connect to your privateinstance. We want it to be able to access our s3 buckets. Give your instance a role in the security and settings. Modify the IAM role for the instance by creating a new role. Go to iam create a role for aws service ec2 and the role should be AmazonS3ReadOnlyAccess. Give the role a name and assign it to your instance. Since the private route table which is for the private subnet has internet access through the nat gateway and the private instance is in the private subnet, this private instance can access the internet. Test it by running ```aws s3 ls``` and curl ```google.com```. Create an endpoint and give it a name. Type = aws services and  type should be gateway named "com.amazonaws.us-east-1.s3" and the vpc should be demovpc also select the route table as the privateroutetable and policy is full access. After it has been created check the private route table has added a new route for the endpoint. Test curl it should not work but testing ```aws s3 ls```. It should work, the ec2 in the private subnet cannot access the internet but it can access the aws services


## VPC Flow logs

We will create 2 flow logs one going to s3 and one sending logs to cloudwatch. Create a vpc flow log. By clicking on demovpc and actions. Give it a name and caputre all traffic in the filter. Maximum aggregation interval of 1 minute destination to s3. Create an s3 bucket with defaultsettings and a name and copy the arn to the s3 bucket arn then create the flow log. Do the same for cloudwatch but when creating it. Create a default log group in cloudwatch logs and create an IAM role. The IAM role will be custom trust policy and this should be the policy

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

For analysis with amazon athena, we can create a new s3 bucket for our query result location. Create a new bucket with default settings and manage the query settings in athena to add the new bucket. Copy the bucket arn but confuring it to athena will be different. For example this is the arn    ```arn:aws:s3:::demo-athena-ryan-v2-737429582017-us-east-1-an``` but we will configure it as ```s3://demo-athena-ryan-v2-737429582017-us-east-1-an/athena/```. After that is done we can create a table in athena. I created this table and did the following actions from a [tutorial](https://docs.aws.amazon.com/athena/latest/ug/vpc-flow-logs.html).

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


<<<<<<< HEAD
## IPV6

Navigate to demovpc, actions and edit cidrs. Create add ipv6 CIDR and choose Amazon-provided IPV6 CIDR. We will create an ipv6 cidr for the publicsubnetA, select bastion host and actions. Under networking you will see manage ip addresses, click on the eni interface and assign a new ipv6 address and leave it at auto-assign
=======
## VPC

1. Creata a vpc. Give it a name tag DemoVPC, IPv4 Cidr manual input, IPv4 CIDR is 10.0.0.0/16 and No IPv6 CIDR block. Tenancy set to Default and create the vpc.

1. Here in this exercise we will create 4 subnets for our new vps. Two subnets will be private and 2 will be public. The first public subnet will have a 10.0.0.0/24 CIDR and it will be in availabiliy zone us-east-1a (256 available ip addresses with the first ip address starting from 10.0.0.0 and the last having 10.0.0.25 ). The second public subnet will have a cidr of 10.0.1.0/24 in us-east-1b and will have  256 ip addresses (first ip address will be 10.0.1.0 and the last one will be 10.0.1.255). So the first and second subnets have different ips. The private subnets are assumed to have more hosts. So we will give both a /20 cidr. The first private subnet will hae a cidr block of 10.0.16.0/20 (4096 available ips, 10.0.16.0 is the first ip address, 10.0.31.255 is the last one) and the other one which will be in us-east-1b will have a cidr block of 10.0.32.0/20 (4096 available ips, with 10.0.32.0 as the first IP and 10.0.47.255 ad the last ip)

3. Edit both public subnets and enable ip address auto assigning. Create an ec2 instance with default settings and make sure the ec2 instance is in the vpc you just created and in publicsubnetA and has not key pair. Try connecting using ec2 instance connect and it should fail because there is no internet gateway. Create an internet gateway and attach to the vpc. Try connecting to the ec2 instance again using ecn instance connect, it should fail. Because there is no route table. Create two route tables the private route table and the public route table, explicitly associate theprivate subnets to the private route table and vice versa. Now we will edit the routes in the public route table to send traffic to the internet gateway. So we will add a route Destination 0.0.0.0/0 and target internet gateway and we pick the internet gateway we created. The first rule means that any instance within our vpc (10.0.0.0/16) goes to local which means from within our vpc. The new rule means that anthying else (0.0.0.0/0) which includes public ips (that your ec2 instance was given) can go to the internet gateway. Now connect to the ec2 using ec2 instance connect and ping google.com

4. Rename the ec2 instance as bation host. It will be used toas a bastion to log into ec2 instances that are in the private subnet. Users will ssh into the bastion and jump into the private ec2 instances. Create another ec2 instance and the key pair select the one you created earlier in the course or create a new.pem one with rsa. Choose the vpc we created and private subnet A. Create new security group and name it privatesg. n the inbound security group rules select source type of ssh as custom and the source choose the security group of the bastion host, decsription write allow ssh for bastion host. Launch the instance. Connect the bastion ec2 from ec2 instance connect, create a file named DemoKeypair.pem and copy the contents of the key pair in this file. Now ssh into the new ec2 instance ```ssh ec2-user@privateip -i DemoKeypair.pem```

5. Create a NAT gateway. Give it a name, availabilitymode = zonal Subnet = PublicSubnetA, Connectivity type = public and allocate an elastic IP. Edit your private route table and allow all ips (0.0.0.0/0) destionation to access the target NAT gateway you created. Login to the private ec2 via the bastion and ping google.com (It should work)
>>>>>>> 57e7ce2 (changes)
