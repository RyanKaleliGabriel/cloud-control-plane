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

## AWS step functions

16. Create a step function sampled hello world, take a look at the flow chart and study the code as well. Execute it and look at the events,inputs and outputs, variables. Change the variable IsHelloWorldExample to false so that the step function is fails

17. Create a new state machine, create from blank and give it a name. Navigae to code and add the contents of this file /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/step-functions/0-hello-world/state-machine.json. Go through the file to see how it works. It prints wohoo if sthe name stephane is in the payload. Create a lambda function from scratch, the lambda function will be nodejs based and will have these contents /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/step-functions/0-hello-world/function.js. Test the function. and copy the functions arn to the API parameters of the step functions. The API parameter is found when you navigate to the design tab a new window will open on your right. Create the state machine and execute. When executing fill in the parameters as 

    ```
    {
        "who": "Stephane Mareek"
    }
    ```

    for it to work. Change the name to John doe for it to fail

## System Manager


18. Navigate to the Systems Manager service and navigate to fleet manager. There are no instances to manage so we will navigate to the ec2 instance to create them. Do not proceed with a key pair and create a new security group removing the accessfrom port 22. Create and IAM instace profile with this role only AmazonSSMManagedInstanceCore and give it a name. After the instances state have changed to runnign refresh the fleet manager

19. Tag those three instaces,
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

20. Add a security groupof your ec2 instances and add http access inbound rule from anywhere. Navigate to documents in ssm and create document. Select Command or Session. And give it a name, target = EC2 instance, Doc type Command. Edit the content by deleting the current yaml code and add the contents of this yaml file /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/ssm/document-install-apache.yml. Navigate to the run command and create a run command. Select the document your created and write a message. Target selection = Choose instances manually and you can select all three. Concurrency control = 1. Error threshold = 0. Enable cloudwatch logs and run the command. Check the cloudwatch logs and try accessing the ec2 instances with their public ips to see the message after all instances have been updated

21. Create a ssm automation by navigating to the automation section in ssm. Search fro AWS-Restart and select awsrestartec2 and select the latest version before clicking next. Click Next. In the configuration select Rate Control, Parameter = InstanceID, Targets=Resource Group, Resource Group = DevGroup, Concurrency= 1, Error Threshold = 1

22. Create a parameter in systemsmanager under parameter store:
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

23. Start a session manager for your prod instance and run commands. Terminate the fleet instances under fleet manager.

24. Under fleet management. Click on 'Configure Default Host Management Configuration'. Then Enable Default Host Management Configuration and configure. Launch an ec2 instance with no keypair and watch it appear in the fleet manager.Under security in the ec2 instance check that there are no iam roles attached.This shows system manager can control and manage your instance. Disable the DHMC in account management in the fleet manager tab and terminate the instance

25. Create an activation, Instance limit = 1, Iam role = create a system default... . Create the actvation, copy the activation code somewhere. Under ec2 launch an instancename = OnPremises, OS= Ubuntu, proceed withut key pair and launch the instance. Connect the ec2 instance with ec2 connect and run the following commands to activate the hybrid connection /home/ryankaleligabriel/cloud-control-plane/Devops_Professional/code_v2026-01-20/ssm/managed-instance-setup.sh.Wait for 5 minutes and refresh the fleet manager to see the ec2 instance displayed. Terminate the instance and delete the activation

## Lambda

1. Create a lambda function from scratch with python and modiy the code to be this
   ```
    import json

    def lambda_handler(event, context):
    return "this is version 1
   ```

   Deploy and test.
   Go to the top section in actions, publis new version, click on pubish. Now you can test the lambda version but you cannot update(edit) it (because you are under lambda version 1), you go back to the lambda function. When you go back to the lambda function update(edit), test and publish and you will see version 2 being created

   Now navigate the lambda function section and create an alias named dev and it should be linked to the latest version. Create a test alias and let it point to version 2. Test the alias to confirm the output. Create the prod alias and point it to version 1. Test the alias.

   Go to the list of all aliases and edit the prod alias to receive weighted traffic for version 20, add the percentage to 50% and test the alias. You should get traffic from both versions

2. Create a lambda function modify its code to return a env name
   ```
    import json
    import os

    def lambda_handler(event, context):
        return os.getenv("ENVIRONMENT_NAME")
   ```

   Navigate to configuration and add a environment variable name ENVIRONMENT_VARIABLE with a value of dev. Test the function to see the env variable.
<<<<<<< HEAD
## CDK

16. For this we want to create a cdk script that will Deploy an s3 bucket which will trigger a lambda function that will analyze the image send it to rekognition to analyse the image and send the result to lambda. The result will be stored in dynamodb. Tutorial was abit complicated with the dependencies but check it out here https://www.udemy.com/course/aws-certified-devops-engineer-professional-hands-on/learn/lecture/37869428#overview
=======

## API GATEWAY

1. Create an api gateway in  the api gateway service. Choose rest api and the api detail should be new API. Give it a name and set the endpoint type to regional and create it. Navigate to the api and create a method. Should be a GET type and lambda function integration. Enable lambda proxy integration , leave it as buffered. And from here we have to create the lambda function. Give your lambda function a name and choose python 3.14 as the runtime, leave other setting. Copy the lambda code in the api-gateway folder (/home/ryankaleligabriel/cloud-control-plane/Solutions_architect/code_v2025-10-27/api-gateway/lambda-code.py) and test it. Go back to the api gateway and select the new lambda function and create method. Go to the lambda function and in under configuration and permissions check the resource based policy to see if the api gateway is authorized to access your lambda function. Test to see the response. In the api gateway, Create a resource and name it houses. Repeat the same steps for creaing a method and linking the method to a new lambda function that instead says "HELLO from my pretty houses" in the print statement. Test the endpoint from the api gateway. Deploy the api and choose a new stage and name it dev. Test the invoke URL with both endpoints i.e "/" and "/houses".

2. Create a  new resource and name it /stage-variables. Create a lambda function and name it api-gateway-stage-variable-get. Copy the same code from the file in the first task but it should say hello from lambda v1. Test it, Deploy it, then test it again. Still in lambda go to actions and publish it as v1. Go back to the function change it to say HEllo from lambda v2 and repeat the steps up until publishing. Go back to the function, update the code to say hello from dev. Do not publish the function as it is going to be the latest one. Now create aliases for the function named DEV, TEST and PROD. Pointing to LATEST, V2 AND V1 respectively. Now head back to api gateway and create a method which will be a get method under stage-variables. Choose the lambda arn from the lambda funcion you created and after the arn add ':${stageVariables.lambdaAlias}'. A warning willpop up that will ask if you have the right permissions and you have to add it to cloud shell. Copy the permissions command and modify this part named stageVariables.lambdaAlias and add the aliases you created as shown in the commnda below

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

2. OpenAPI implementation. Under api gateway, create a new api and select rest api and import.You can import api or use example api and create the api. You can also go to the api we created from the previous tasks and navigate to a stage for example prod in stage actions you can export api to generate an api definition file or generate a sdk for your api that can be used for different platforms and this is generated by api gateway

3. You can cache the api-gateway in the stages by editing the stage details

4. Canary deployment. Create a new resource under the api we created in the eariler tasks and name it /canary-demo. Use a lambda function in the resource ad use the arn that we used for stage-variables tasks because it has two versions 1 and 2. In the arn add ':1' to reference version 1. e.g arn:aws:lambda:us-east-1:737429582017:function:ApiGatewayFunc-stage-variable-get:1. Test and deploy in a new stage called canary. Test the url ending with /canary-demo so that it takes you to v1. In th canary stage. Go to canary section below and edit the canary to 50%. Go back to resources and under /canary-dem and GET, edit the integration request and in the arn. Switch the arn to :2 and save. Deploy the api again and choose the stage as canary and now you can test the inoke url to see the requests going from v1 to v2.
>>>>>>> 2b375e5 (Changes)
