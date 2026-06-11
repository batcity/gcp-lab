from google.cloud import bigquery
from google.auth.credentials import AnonymousCredentials

client = bigquery.Client(
    project="local-lab",
    credentials=AnonymousCredentials(),
    client_options={
        "api_endpoint": "http://localhost:9050"
    },
)

query = """
SELECT 1 AS id, 'hello bigquery' AS msg
"""

job = client.query(query)
for row in job:
    print(row.id, row.msg)
