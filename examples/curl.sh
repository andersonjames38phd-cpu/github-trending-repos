#!/usr/bin/env bash
# GitHub Trending Repos - curl examples
# Replace YOUR_TOKEN with an Apify API token (https://console.apify.com/account/integrations).

set -euo pipefail

ACTOR="Turboextract~github-trending-repos"
TOKEN="${APIFY_TOKEN:-YOUR_TOKEN}"

# 1. Weekly trending in Python, TypeScript and Rust (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "since": "weekly",
    "languages": [
      "Python",
      "TypeScript",
      "Rust"
    ]
  }'

# 2. Today's AI agent repos with owner details (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "since": "daily",
    "keywords": [
      "agent",
      "llm"
    ],
    "includeDetails": true,
    "githubToken": "YOUR_GITHUB_TOKEN"
  }'

# 3. Monthly trending across all languages (wait and get the dataset items in one call)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/run-sync-get-dataset-items?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "since": "monthly",
    "maxResults": 25
  }'
