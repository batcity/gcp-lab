# GCP Lab

This repository contains **Google Cloud Platform (GCP) features and advanced concepts** for learning and testing GCP services locally using emulators. Each concept is organized into domain-specific modules containing an example script and a dedicated guide.

## Table of Contents

### 📊 BigQuery Master Class (The 5 Pillars)
* **[01. Architecture](./bigquery/01_Architecture/README.md):** Under the Hood (Decoupled Compute/Storage, Columnar Storage, Slots vs. On-Demand Pricing, Dry Runs)
* **[02. Performance & Cost Optimization](./bigquery/02_Optimization/README.md):** Advanced Scaling (Partitioning & Clustering, Materialized Views, Query Plan Analysis, BI Engine)
* **[03. Analytical Data Modeling](./bigquery/03_Data_Modeling/README.md):** NoSQL Patterns in SQL (Nested & Repeated Fields, STRUCTs/ARRAYs, UNNEST, Slowly Changing Dimensions Type 2)
* **[04. Security & Multi-Tenancy](./bigquery/04_Security_MultiTenancy/README.md):** Enterprise Governance (Row/Column-Level Security, Authorized Views, Dataset-per-Tenant Isolation)
* **[05. Ingestion & Advanced Analytics](./bigquery/05_Ingestion_Analytics/README.md):** Data Pipelines & AI (Storage Write API, Federated/External Queries, BigQuery ML)

### 🗄️ Storage & Databases
- [Cloud Storage (GCS)](./gcs/README.md)
- [Cloud Firestore](./firestore/README.md)

### 📨 Messaging & Integration
- [Cloud Pub/Sub](./pubsub/README.md)

### Serverless Compute
- [Cloud Functions](./cloud_functions/README.md)
- [Cloud run](./cloud_run/README.md)

## Prerequisites

Before running the setup, ensure you have the following installed on your machine:

* **Google Cloud CLI (gcloud)**
    * *macOS:* `brew install --cask google-cloud-sdk`
    * *Others:* See [Google Cloud SDK Installation Guide](https://cloud.google.com/sdk/docs/install)
* **Docker** (Ensure the Docker Desktop/Daemon is running)

## Setup & Execution

The provided setup script automatically verifies your `gcloud` components, configures a Python virtual environment, installs required dependencies, and boots up all emulators.

1. use the setup script to configure your environment variables and start the background services:
   ```bash
   . ./setup.sh
   ```

2. Run any of the example scripts (e.g., BigQuery):
    ```bash
    python bigquery/bigquery_example.py
    ```


## Service Architecture & Management

The environment spins up five local service mockups across specific ports:

| Service | Technology Used | Local Endpoint |
| --- | --- | --- |
| **BigQuery** | `bigquery-emulator` (Docker) | `http://localhost:9050` |
| **Cloud Storage (GCS)** | `fake-gcs-server` (Docker) | `http://localhost:4443` |
| **Cloud Firestore** | Official gcloud Emulator | `http://localhost:8080` |
| **Cloud Pub/Sub** | Official gcloud Emulator | `http://localhost:8085` |

### Stopping the Emulators

Because the emulators and Docker containers run in the background, you can tear everything down by running:

```bash
# Stop gcloud background processes
killall gcloud

# Stop Docker containers
docker stop gcs-emu bq-emu

```