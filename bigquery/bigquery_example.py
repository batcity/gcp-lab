from google.cloud import bigquery

client = bigquery.Client(project="local-lab")

query = """
SELECT 1 AS id, 'hello bigquery' AS msg
"""

job = client.query(query)
for row in job:
    print(row.id, row.msg)