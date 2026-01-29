# GCP Lab:

Learn GCP services locally using emulators.

## Prerequisites
This lab requires the **Google Cloud CLI** and **Docker**.

### 1. Install gcloud CLI
**macOS (Homebrew):**
```bash
brew install --cask google-cloud-sdk
```

### 2. Install Emulator Components
After installing gcloud, run:
```bash
gcloud components install beta pubsub-emulator cloud-firestore-emulator
```

## Setup
1. Run: `. ./setup.sh`
2. This will start Docker containers and gcloud emulators in the background.
