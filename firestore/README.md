# Firestore

Firestore is a serverless fully managed document database that provides virtually unlimited scalability

## SLAs and other metrics


Firestore promises >= 99.999% availability for multi-region setups and >= 99.99% availability for single region setups

SLA agreement -> https://cloud.google.com/firestore/sla


### Recovery point objective

You can enable Point in time recovery for firestore and bring down the RPO to 1 minute -> https://firebase.google.com/docs/firestore/disaster-recovery

here's what they state:

```
Enable PITR to read documents from a point in time up to seven days in the past. You can read data at a granularity level of 1 minute and surgically write back into your database with a recovery time objective (maximum time for recovery) of 0. The recovery point objective (maximum possible data loss) is 1 minute. For more details, see Point in time recovery.

If you don't need to restore an entire database, PITR reads can recover only the data required. PITR reads also provide a lower recovery time objective and lower recovery point objective than backups.
```
