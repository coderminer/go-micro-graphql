## Rate limit
The GraphQL API v4 limit is different from the REST API v3's limit of 5,000 requests per hour for authenticated requests.

Why are the API rate limits different? With GraphQL, one GraphQL call can replace multiple REST calls. A single complex GraphQL call could be the equivalent of thousands of REST requests. While a single GraphQL call would fall well below the 5,000/hour REST API v3 limit, the query might be just as expensive for GitHub's servers to compute.

To accurately represent the server cost of a query, the GraphQL API v4 calculates a call's rate limit score based on a normalized scale of points. A query's score factors in first and last arguments on a parent connection and its children.

The formula uses the first and last arguments on a parent connection and its children to pre-calculate the potential load on GitHub's systems, such as MySQL, ElasticSearch, and Git.
Each new connection has its own point value. Points are combined with other points from the call into an overall rate limit score.
The GraphQL API v4 rate limit is 5,000 points per hour. Note that 5,000 points per hour is not the same as 5,000 calls per hour: the GraphQL API v4 and REST API v3 use different rate limits.

Note: The current formula and rate limit are subject to change as we observe how developers use the GraphQL API v4.