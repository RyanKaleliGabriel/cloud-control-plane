## AWS CodeArtifact

• Software packages depend on each other to be built (also called code dependencies), and new ones are created

• Storing and retrieving these dependencies is called artifact management

• Traditionally you need to setup your own artifact management system

• CodeArtifact is a secure, scalable, and cost-effective artifact management for software development

• Works with common dependency management tools such as Maven, Gradle, npm, yarn, twine, pip, and NuGet

• Developers and CodeBuild can then retrieve dependencies straight from CodeArtifact

![Image](../DPI/codeartifact.png)

## CodeArtifact – EventBridge Integration

![Image](../DPI/codeartifact_eventbridge.png)

## CodeArtifact – Resource Policy

• Can be used to authorize another account to access CodeArtifact
 
• A given principal can either read all the packages in a repository or none of them

![Image](../DPI/ca_resurce_policy.png)

![Image](../DPI/ca_resource_policy2.png)

## CodeArtifact – Upstream Repositories

• A CodeArtifact repository can have other CodeArtifact repositories as Upstream Repositories

• Allows a package manager client to access the packages that are contained in more than one repository using a single repository endpoint

• Up to 10 Upstream Repositories

• Only one external connection

![Image](../DPI/ca_updtream_repo.png)

## CodeArtifact – External Connection

• An External Connection is a connection between a CodeArtifact Repository and an external/public repository (e.g., Maven, npm, PyPI, NuGet…)

• Allows you to fetch packages that are not already present in your CodeArtifact Repository

• A repository has a maximum of 1 external connection

• Create many repositories for many external connections

Example – Connect to npmjs.com
 - Configure one CodeArtifact Repository in your domain with an external connection to npmjs.com
 - Configure all the other repositories with an upstream to it
 - Packages fetched from npmjs.com are cached in the Upstream Repository, rather than fetching and storing them in each Repository

![Image](../DPI/ca_external_comm.png)

## CodeArtifact – Retention

• If a requested package version is found in an Upstream Repository, a reference to it is retained and is always available from the Downstream Repository

• The retained package version is not affected by changes to the Upstream Repository (deleting it, updating the package...)

• Intermediate repositories do not keep the package

Example – Fetching Package from npmjs.com

 - Package Manager connected to Repository A requests the package Lodash v4.17.20
 - The package version is not present in any of the three repositories
 - The package version will be fetched from npmjs.com
 - When Lodash 4.17.20 is fetched, it will be retained in:
   - Repository A – the most-downstream repository
   - Repository C – has the external connection to npmjs.com
   - The Package version will not be retained in Repository B as that is an intermediate Repository

![Image](../DPI/ca_retention.png)

## CodeArtifact – Domains

Deduplicated Storage – asset only needs to be stored once in a domain, even if it's available in many repositories (only pay once for storage)

Fast Copying – only metadata record are updated when you pull packages from an Upstream CodeArtifact Repository into a Downstream

Easy Sharing Across Repositories and Teams – all the assets and metadata in a domain are encrypted with a single AWS KMS Key

Apply Policy Across Multiple Repositories – domain administrator can apply policy across the domain such as:
 - Restricting which accounts have access to repositories in the domain
 - Who can configure connections to public repositories to use as sources of packages

![Image](../DPI/ca_domains.png)

## EC2 Image Builder

• Used to automate the creation of Virtual Machines or container images

• => Automate the creation, maintain, validate and test EC2 AMIs

• Can be run on a schedule (weekly, whenever packages are updated, etc…)

• Free service (only pay for the underlying resources)

• Can publish AMI to multiple regions and multiple accounts

![Image](../DPI/ec2_image_builder.png)

## EC2 Image Builder – CICD Architecture

![Image](../DPI/ec2_image_builder_cicd.png)

## EC2 Image Builder – Sharing using RAM

• Use AWS RAM to share Images, Recipes, and Components across AWS accounts or through AWS Organization

![Image](../DPI/ec2_image_builder_sharing_ram.png)

## EC2 Image Builder – Tracking Latest AMIs

![Image](../DPI/ec2_ib_tracking.png)