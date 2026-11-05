## Codecommit

1. Create a repo in code commit and upload index.html in the codefile in aws-cicd folder in the nodejs project folder. Naigate to setting and add a notification rule that will be publishing messages to sns. Check all rules when creating the notification rule. Create a trigger that will be sending events to amazon sns as well. Select one trigger

2. Clone your repo in cloushell by installing codecommit package first ```pip install git-remote-codecommit```.  Copy the https grc url and clone it using ```git clone codecommit::eu-north-1://my-nodejs-app```. Upload the remaining files and pull them in cloudshell using git pull 

### CodePipeline

1. Create a custom code pipeline config in codepipeline. Give it a name, set execution mode to queued, create a new service role and go to the next section. Select Github apps as the source provider. Connect to github by giving it a connection name or creating one, when creating the connection select all repos. Create a repo in github or use the one that exists with the nodejs app. Choose the repo as the repository name in code pipeline and select the default branch as main. Choose Output artifact format as CodePipeline default. Choose the webhook event type as push, Filter type as Branch and select branches as main. Go to nect and configure the build stage to only run ls command. Click next and leave the test section as is. In the deploy section, select the beanstalk dev environment and application then create the pipeline. Navigate to your pipeline settings and click the service role ARN. This should take you to the permissions for this role in IAM. Attach new policies and ass the AdministratorAccess-AWSElasticBeanstalk policiy so that it can deploy changes to beanstalk. After adding the permission. Got to github an change the background color in line 38 to another and observe the changes reflect in beanstalk

2. Edit the pipeline to add a stage called DeployToProd by adding an action group, give it a name and set the action provider to Elastic beanstalk. App name and environment give the prod beanstalk environment and app name you created earlier. Also add another action group in the same stage called ManualApproval. Select the ManualApproval as the action provider and click on next. Save the pipeline and make a change in github to make it run. Chane the background color to yellow. Observe the changes. Now manually approve the approval to push it to the main elastic beanstalk env

## CodeBuild

1. Create a codebuildproject with the following configs - Give it a name, Project type = Default, Source Github - connect throught Github Apps when asked, Select the repo as mynodejsapp, Select Rebuild everytime a code is pushed to this repo, Build type = Single build, Event type for webhooks = push. Environment image = Managed image, Running mode = Container, OS= Ubuntu, Runtime = standard, Image standard 8.0, Select New Service role. Timeout Minutes = 10, hours = 0. Select Use a build spec file in the Buildspec section Create project and start build. I expect it to fail because there is no yaml file in the repo.

2. Navigate the the nodejs repo in github. Add a file called buildspec.yml. Copy the contents of this file from the buildspec.yml in the code files under code build.Commit the changes and look at the build activity in codebuild. View the logs to see how the build worked.

3. Now we want to integrate the codebuild to codepipeline. Navigate to your codebuild project and edit it. Remove the 'Rebuild everytime a code change is pushed to this repo' option, unselect it. Now go to code pipeline and edit it. In the build stage, give it a name and set the following.Action Provider = aws codebuild, Project Name = MyFirstBuild which is te codebuild project name, Build type = SIngle build, Output artifacts give it a name and save. Now change the congratulations in the index.html in the github repo to horrible so that the test does not pass and commit the changes. Also add codebuild admin access permission policy to the codepipeline service role. Change the horrible to congratulations and let the piepline run

## Code Artifcat

1. Its not free tier so watch the hands on video in udemy

## Cloudformation

1. Create a stack in cloud formation. Upload the /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/0-just-ec2.yaml file in the configuration with default settings. Run the stack and look at the events and resources section

2. Update the stack using a new template which is this /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/1-ec2-with-sg-eip.yaml, observe the events and resources. Delet the stakc to also remove all resources

3. Trigger a failureand rollback by creating a new stack and use this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/0-just-ec2.yaml update the stack using this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/2-trigger-failure.yaml. In updating the stack make sure you select "Roll back all resources. Roll back the stack to the last known stable state." Now observe as it rollbacks automatically after failing.

4. Test the deletion Poluicy of cloudformation by creating a stack using this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-developer-course/4-deletionpolicy.yaml. One resource has a retain policy and the other has a snapshot. Delete the stack. Now check if a snapshot has been created and delete it. Also after the stack has been deleted, check the seurity groupif it has been retained

5. Test custom resources in cloudfront by creating a aws cloudfront stack using this /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/2-custom-resource-lambda-backed.yaml template. It will create a lambda function, s3 bucket and iam roles so you have to acknolwedge the capabilities in the creation process. The lambda function will be triggered to empty the bucket before cloudfront deleted the bucket in the evnt you want to delete the stack. So after the bucket has been created. Upload three files in it. After that delete the bucket and then check the lambda cloud watch logs to see how the bucket will be emptied first the check the cloudfront events

6. Create a cloudformation stack using this templat /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/0-user-data.yaml to verify how to create an ec2 instance using a user data script. Access the ec2 using its public ip to see if it worked. Delete the stack

7. Create a cfn init stack using this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/1-cfn-init.yaml to demonstrate the cfn init capability. Confirm it worked by accessing the ec2 using its public ip. Delete the stack

8. Create a cfn signal stack using this template /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/2-cfn-signal.yaml to demonstrate the cfn signal capability. Confirm it worked by accessing the ec2 using its public ip and by looking at the cf events to see if the simplewaitcondition received a 'Received SUCCESS signal with UniqueId ec2-instance-id'. Delete the stack

9. Trigger a cfn-signa failure using this template /home/sysadmin/Personal_Projects/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/3-cfn-signal-failure.yaml to demonstrate cloudformation rolling back all the changes and deleting the resources. Delete the stack

10. Create an stack using this template /home/sysadmin/Personal_Projects/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/from-sysops-course/5-dependson.yml to demonstrate depends on. The s3 bucket will only be created after the creation complete event for the ec2 instance is displayed in cloudformation. Delete the stack. Observe if the s3 bucket is deleted first

11. Create a stack using this template /home/sysadmin/Personal_Projects/cloud-control-plane/Devops_Professional/code_v2026-01-20/cloudformation/0-cfn-hup-demo.yml to demonstrate cfn hup that changes metadata on provisioned cloudformation resources. After the instance is running UPDATE the stack and add a paragraph in the metadata section and upload the updated yaml file to see the metadata change. Delete the stack

## Beanstalk

12. Create a beanstalk environment, application name = MyApplication, Enivornment = MyApplication-dev, platform = Nodejs, sample app, hello world Also set enironment type to single instance. Give the beanstalk environment a service role (aws-elasticbeanstalk-service-role) and instance role (aws-elasticbeanstalk-ec2-role) they are the first roles in each drop down. (Look at the policies attached to them at your own time). Launch your instances

13. Create a beanstalk environment, application name = MyApplication, Enivornment = MyApplication-prod, platform = Nodejs, sample app, hello world Also set enironment type to single instance. Give the beanstalk environment a service role (aws-elasticbeanstalk-service-role) and instance role (aws-elasticbeanstalk-ec2-role) they are the first roles in each drop down. (Look at the policies attached to them at your own time). Launch your environment. Explore the services and security groups


14. In the same prod environment, implment an immuable deployment. In the envoronment, navigate to configuration, monitoring and updates and edit the deployment mode to immutable. On the top navbar of the production environment click on upload and deploy and add this zip file /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/beanstalk/nodejs-v2-blue.zip it changes the background to blue. Deploy the changes and view the events to see how immutable deployment works

## AWS SAM 

15. Check the sam deployment here https://www.udemy.com/course/aws-certified-devops-engineer-professional-hands-on/learn/lecture/37869152#questions