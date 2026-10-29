
## High-Performing Architectures

**Core question:** *"What is the bottleneck, and which service removes it?"*

**Mental model: walk the request path from user to data**

| Stage | Bottleneck | Fix |
|---|---|---|
| User distance | Latency | CloudFront, Global Accelerator, nearer Regions |
| Compute | CPU/memory | Right instance family, Auto Scaling, Lambda, Fargate |
| Storage | IOPS/throughput | gp3/io2, instance store, EFS modes, FSx for Lustre |
| Database | Slow reads | Read replicas, ElastiCache, DAX, Aurora |
| Network | Node-to-node speed | Placement groups, enhanced networking |
| Data ingest | Volume/speed | Kinesis, S3 Transfer Acceleration, multipart upload |

**Principles:**

- Match the service to the **access pattern** (random vs sequential, read vs write heavy, latency vs throughput).
- Cache close to the consumer.
- Scale out before scaling up.
- Measure first (CloudWatch, Performance Insights, X-Ray), then change.

**Exam keywords:** "lowest latency", "high throughput", "high IOPS", "real-time", "improve read performance".

---