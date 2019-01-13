# GraphQL Starter Project

This starter project was derived from the [graphql-php](https://github.com/webonyx/graphql-php) "Getting Started" [documentation](http://webonyx.github.io/graphql-php/getting-started/) example.

# Project Installation

Install with Composer
```composer
composer create-project timkippdev/graphql-starter-project --prefer-dist
```

# Development Setup using Docker (optional)

**This assumes you have [Docker](https://docs.docker.com/v17.09/engine/installation/) installed and running on your machine**

## Starting your Docker container
```
docker-compose up -d
```

If you need to run any composer commands, you use run them against the _composer_ container:
```bash
docker-compose run --rm composer <insert command here>
```

If you need to log into your Docker container, run the following command and you will be launched into a shell inside the container:
```bash
docker exec -it graphql-starter-project bash
```

# Executing a GraphQL Query
There are multiple ways to do this, but here are a couple to get started:

1) Use GraphiQL, either [web-based](https://github.com/graphql/graphiql) or a [standalone application](https://github.com/skevy/graphiql-app).
2) Use either cURL or a REST client to fire a POST request

For either method you chose above, you will POST your request to http://localhost:8080/, if Docker was used, or the URL you have set up for your local development

### GraphiQL Query Example
```
query {
  echo(message: "Hello World")
}
```

### cURL / REST Payload Example

1) cURL example
```bash
curl http://localhost:8080 -d '{"query": "query { echo(message: \"Hello World\") }" }'
```

2) REST Client example

> Content-Type: application/json  
> Method: POST  
> Payload (below):  
```json
{ "query": "query { echo(message: \"Hello World\") }" }
```

### Expected Result
In either way you choose to execute your query, you should see a similar response to the following:
```json
{
  "data": {
    "echo": "Hello World"
  }
}
```