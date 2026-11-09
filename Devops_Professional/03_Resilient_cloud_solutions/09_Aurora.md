## Aurora Replicas - Auto Scaling

![Image](../DPI/aurora_replicas_auto_scaling.png)

## Global Aurora

Aurora Cross Region Read Replicas:
 
 - Useful for disaster recovery
 
 - Simple to put in place

Aurora Global Database (recommended):
 
 - 1 Primary Region (read / write)
 
 - Up to 10 secondary (read-only) regions, replication lag is less than 1 second
 
 - Up to 16 Read Replicas per secondary region
 
 - Helps for decreasing latency
 
 - Promoting another region (for disaster recovery) has an RTO of < 1 minute
 
 - Typical cross-region replication takes less than 1 second

![Image](../DPI/global_aurora.png)

## Amazon Aurora – Unplanned Failover

![Image](../DPI/aurora_uf.png)

## Amazon Aurora – Global Application

![Image](../DPI/aurora_ga.png)
