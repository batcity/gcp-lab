import os
import google.cloud.pubsub_v1 as pubsub


publisher = pubsub.PublisherClient()

topic_name = 'projects/test-projact-id/topics/test-topic'
publisher.delete_topic(topic=topic_name)

publisher.create_topic(name=topic_name)

print("list of current available topics:")
print(publisher.list_topics)