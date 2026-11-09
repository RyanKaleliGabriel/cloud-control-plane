## Secure Architectures

**Core question:** *"Who can access this, what can they do, and how would I know if they misused it?"*

**Mental model: five layers of defense**

| Layer | Goal | Key services |
|---|---|---|
| Identity | Least privilege, no long-lived keys | IAM roles, Identity Center, STS, MFA |
| Network | Isolate and filter traffic | VPC, security groups, NACLs, private subnets, VPC endpoints |
| Data | Encrypt at rest and in transit | KMS, ACM, S3 encryption, Secrets Manager |
| Edge | Stop attacks before the app | WAF, Shield, CloudFront |
| Detection | Log, alert, audit | CloudTrail, GuardDuty, Config, Security Hub |

**Principles:**

- Least privilege by default.
- Roles over users, users over root, never embedded keys.
- Treat anything public as a bug until proven otherwise.
- Encrypt everything; control who can use the keys.
- Log everything; alert on the unusual.

**Exam keywords:** "least privilege", "encrypt", "restrict access", "audit", "compliance", "private connectivity".

---

