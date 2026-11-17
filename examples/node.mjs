// GitHub Trending Repos - Node.js example
// npm install apify-client
// APIFY_TOKEN=your_token node node.mjs
import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });

// Today's AI agent repos with owner details
const run = await client.actor('Turboextract/github-trending-repos').call({
    "since": "daily",
    "keywords": [
        "agent",
        "llm"
    ],
    "includeDetails": true,
    "githubToken": "YOUR_GITHUB_TOKEN"
});

const { items } = await client.dataset(run.defaultDatasetId).listItems();
for (const item of items) {
    console.log(item.rank, item.fullName, item.starsInPeriod, item.language);
}
