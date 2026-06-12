import os

from google.cloud import firestore
from google.auth.credentials import AnonymousCredentials

def get_client():
    
    client = firestore.Client(os.environ.get("GOOGLE_CLOUD_PROJECT"))
    return client


if __name__ == "__main__":
    
    db = get_client()
    
    db.collection("users").document("gundam").set({
        "first": "Mobile",
        "last": "Gundam",
        "born": 1815
    })
    
    # this block retrieves all docs in the collection users
    collection = db.collection("users")
    for doc in collection.stream():
        print(f"ID: {doc.id} => Data: {doc.to_dict()}")
