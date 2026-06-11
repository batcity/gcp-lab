# GCP Lab: Local Emulator Environment

Learn and test GCP services completely locally using official and open-source emulators.

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