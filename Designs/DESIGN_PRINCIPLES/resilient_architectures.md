
## Resilient Architectures

**Core question:** *"What fails, and what recovers it automatically?"*

**Mental model: remove, decouple, automate, recover**

1. **Remove single points of failure:** at least 2 of everything, across 2+ AZs.
2. **Decouple components:** queues and event buses (SQS, SNS, EventBridge) absorb spikes and failures.
3. **Automate recovery:** health checks, Auto Scaling, managed failover (Multi-AZ, Route 53 failover).
4. **Scale horizontally:** add instances or replicas, not bigger boxes.
5. **Protect the data:** backups, versioning, replication, deletion protection.
6. **Match DR to RTO/RPO:** Backup & Restore → Pilot Light → Warm Standby → Active-Active.

**Layers to walk through:**

| Layer | Resilient pattern |
|---|---|
| Edge/DNS | Route 53 health checks + failover, CloudFront origin groups |
| Load balancing | ALB/NLB across multiple AZs |
| Compute | ASG across AZs, ELB health checks, golden AMIs |
| Database | RDS/Aurora Multi-AZ, read replicas for scaling, Aurora Global for cross-Region |
| Storage | S3 (multi-AZ by default), EFS, snapshots, replication |
| Messaging | SQS buffers, DLQs, FIFO when order matters |

**Exam keywords:** "highly available", "fault tolerant", "RTO/RPO", "minimal downtime", "automatic failover".

---

