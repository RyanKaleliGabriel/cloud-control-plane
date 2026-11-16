## AWS Firewall Manager

• Manage rules in all accounts of an AWS Organization

Security policy: common set of security rules
 - WAF rules (Application Load Balancer, API Gateways, CloudFront)
 - AWS Shield Advanced (ALB, CLB, NLB, Elastic IP, CloudFront)
 - Security Groups for EC2, Application Load BAlancer and ENI resources in VPC
 - AWS Network Firewall (VPC Level)
 - Amazon Route 53 Resolver DNS Firewall
 - Policies are created at the region level

• Rules are applied to new resources as they are created (good for compliance) across all and future accounts in your Organization

## WAF vs. Firewall Manager vs. Shield

![Image](../DPI/wvfvs.png)

• WAF, Shield and Firewall Manager are used together for comprehensive protection

• Define your Web ACL rules in WAF

• For granular protection of your resources, WAF alone is the correct choice

• If you want to use AWS WAF across accounts, accelerate WAF configuration, automate the protection of new resources, use Firewall Manager with AWS WAF

• Shield Advanced adds additional features on top of AWS WAF, such as dedicated support from the Shield Response Team (SRT) and advanced reporting.

• If you’re prone to frequent DDoS attacks, consider purchasing Shield Advanced

## AWS Firewall Manager – Security Policies

Policy Type: AWS WAF
 - Enforce applying WebACLs to all ALBs in all accounts in AWS Organization
 - Identify resources that don’t comply, but don’t auto remediate: create the WebACL in each account without applying the WebACL to any resources
 - Auto remediate any noncompliant resources – automatically apply the WebACLs to existing resources

Policy Type: Shield Advanced
 - Enforce Shield Advanced protections in all accounts in AWS Organization
 - Option to view only compliance (to assess impact) or auto remediate

## AWS Firewall Manager – Security Policies

Security Group Policy Type: Common Security Groups
 - Enforce applying SGs to all EC2 instances in all accounts in AWS Organization

Security Group Policy Type: Auditing of Security Group Policy
 - Check and manage SGs Rules in all accounts in AWS Organization

Security Group Policy Type: Usage Audit Security Group Policy
 - Monitor unused and redundant SGs and optionally perform cleanup

## AWS Firewall Manager – Security Policies

Policy Type: Network Firewall
 - Centrally manage Network Firewall firewalls in all accounts in AWS Organization
 - Distributed – creates and maintains firewall endpoint in each VPC
 - Centralized – creates and maintains firewall endpoint in a centralized VPC
 - Import Existing Firewalls – import existing firewalls using Resource Sets

Policy Type: Route 53 Resolver DNS Firewall
 - Manage associations between Resolver DNS Firewall Rule Groups and VPCs in all accounts in AWS Organization