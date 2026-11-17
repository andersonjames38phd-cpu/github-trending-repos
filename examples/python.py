"""GitHub Trending Repos - Python example.

pip install apify-client
export APIFY_TOKEN=your_token
"""
import os

from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])

# Weekly trending in Python, TypeScript and Rust
run = client.actor("Turboextract/github-trending-repos").call(run_input={
    "since": "weekly",
    "languages": [
        "Python",
        "TypeScript",
        "Rust"
    ]
})

# Stream every item
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item.get("rank"), item.get("fullName"), item.get("starsInPeriod"), item.get("language"))

# Or fetch one page of items
page = client.dataset(run["defaultDatasetId"]).list_items(limit=100)
print(f"{page.total} items in dataset")
