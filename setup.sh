#!/usr/bin/env bash

# 1. Check for gcloud CLI
if ! command -v gcloud &> /dev/null; then
    echo "❌ Error: 'gcloud' CLI not found."
    echo "Please install it first: brew install --cask google-cloud-sdk"
    return 1
fi

# 2. Pre-install components (Foreground & Quiet)
echo "box_check: Verifying gcloud components (beta, pubsub, firestore)..."
gcloud components install beta pubsub-emulator cloud-firestore-emulator --quiet

# 3. Virtual Env Setup
VENV_DIR=".venv"
if [ ! -d "$VENV_DIR" ]; then 
    echo "🚀 Creating virtual environment..."
    python3 -m venv "$VENV_DIR"
fi
source "$VENV_DIR/bin/activate"

# 4. Install Python Dependencies
echo "📥 Installing Python libraries..."
pip install --upgrade pip
pip install google-cloud-storage google-cloud-pubsub google-cloud-bigquery google-cloud-firestore functions-framework

# 5. Export Emulator Environment Variables
export STORAGE_EMULATOR_HOST="http://localhost:4443"
export PUBSUB_EMULATOR_HOST="localhost:8085"
export BIGQUERY_EMULATOR_HOST="localhost:9050"
export FIRESTORE_EMULATOR_HOST="localhost:8080"
export GOOGLE_CLOUD_PROJECT="local-lab"

# 6. Start Docker-based Emulators
echo "🐳 Starting Docker containers (GCS & BigQuery)..."
# Kill existing ones if they are hanging around to avoid port conflicts
docker rm -f gcs-emu bq-emu >/dev/null 2>&1
docker run -d --rm --name gcs-emu -p 4443:4443 fsouza/fake-gcs-server -scheme http >/dev/null 2>&1
docker run -d --rm --name bq-emu -p 9050:9050 ghcr.io/goccy/bigquery-emulator:latest --project=$GOOGLE_CLOUD_PROJECT >/dev/null 2>&1

# 7. Start gcloud Emulators in Background
echo "🚀 Starting gcloud emulators (Pub/Sub & Firestore)..."
# We use 'nohup' or simple backgrounding now that components are definitely installed
gcloud beta emulators pubsub start --host-port=$PUBSUB_EMULATOR_HOST > /dev/null 2>&1 &
gcloud beta emulators firestore start --host-port=$FIRESTORE_EMULATOR_HOST > /dev/null 2>&1 &

echo ""
echo "🎉 Setup complete!"
echo "💡 Emulators are running in the background."
echo "💡 To stop them later, run: killall gcloud"