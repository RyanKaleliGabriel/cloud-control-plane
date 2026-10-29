## Cost-Optimized Architectures

**Core question:** *"Am I paying for capacity I'm not using, or a pricier option than the workload needs?"*

**Mental model: four levers**

| Lever | Meaning | Tools |
|---|---|---|
| Right-size | Match resources to real usage | Compute Optimizer, Cost Explorer, Trusted Advisor |
| Pricing model | Commit or use spare capacity | Savings Plans, Reserved, Spot, On-Demand |
| Storage tiering | Move cold data to cheaper classes | S3 lifecycle, Intelligent-Tiering, Glacier |
| Eliminate waste | Stop paying for idle | Auto Scaling, scheduled stop/start, serverless, delete unused EBS/EIPs |

**Principles:**

- Steady baseline → Reserved/Savings Plans. Interruptible, stateless → Spot. Unpredictable → On-Demand or serverless.
- Data transfer is a hidden cost (NAT Gateway, cross-AZ, internet egress). Gateway endpoints are free.
- Tag everything so cost can be attributed.
- Use the cheapest option that still meets the requirement, not the cheapest option overall.

**Exam keywords:** "most cost-effective", "minimize cost", "infrequently accessed", "fault-tolerant batch", "unpredictable workload".



**Plan**

Every instance has a price. Read through each and note down how to optimize.