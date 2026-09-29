
## EBS

Create an ebs volume in a different region/availability zone from your current ec2 instance is. Take a snapshot of the ebs volume, copy it to the region and availability zone of your ec2 instance. Create a volume fron that snapshot. Attach the snapshot to the ec2 instance. Jump into the ec2 instance format the volume and mount it to /data1

Navigate to the recycle bin and create a 1 day retention rule for snapshots (recycle bin section) . Create a new snapshot (wait till its complete), delete it, then recover it from the recycle bin. After recovering, delete the retention rule. Then delete the snapshot. 

How to encrypt an unencrypted EBS volume. Create an unencrypted volume, create its snapshot, copy snapshot but also encrypt snapshot. Create a volume from the encrypted snapshot

## Clean up 

Delete the snapshot and volume you created earlier in the other region 

In your ec2 instance Unmount both /data and /data1 folder. In the console detach both volumes and delete them

## AMI
Create a usable AMI that will be used as a starting point of our ec2 instances. Cretae the AMI by:
 - Start an EC2 instance and customize it use it a user data script to update and install a web server like apache or nginx, enable the web server using systemctl. Test and see if the instance works( if you see the welcome page of the web server).
 - Stop the instance (for data integrity)
 - Build an AMI – this will also create EBS snapshots
 - Launch another instance using the AMI


## EFS

We will use the two instances to create an efs file system. Create an efs file system, configure the file system with the instances. Connect to one of the instances. Create a file where the file system is mounted, write something in that file like hello world. Login to the other instance. Confirm if the file exists by printing it out. Look at the secuirty of the file system you created if it has sgroups from the ec2 instances too. Terinate the instances and file systems


## EC2

Create and auto scaling group. First create a launch template with the ALB we created. Set thr capacities to 1 for minimum, 1 for maximum and 1 for desired. Do not create a dynamic scaling policy yet.  After the ASG has been created, manualy edit the desired capacity to 2 and maximum capacity to 3 in the autoscaling tab and observe the changes in the activity tab. After 5 minutes check if another ec2 instance has been launched.


Change the maximum capacity to 2 and the desired capacity to 1 and observe after 5 minutes one ec2 instance being terminated. Create a Dynamic policy (target tracking) in the Automatic scaling tab to target cpu spikes. Set the cpu utilization to 50%. Use stress linux os package to increase cpu load to 70%. To stress the cpu, you wll ssh to one of the instances and:

Install

```
sudo dnf install stress
```

Spike the CPU to a precise percentage (Requires stress-ng)

```
stress --cpu $(nproc)
```

Observe after 15 minutes in the monitoring tab of the auto scaling group. Delete the target tracking policy