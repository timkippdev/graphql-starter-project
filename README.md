# GraphQL Starter Project

This starter project was derived from the [graphql-php](https://github.com/webonyx/graphql-php) "Getting Started" [documentation](http://webonyx.github.io/graphql-php/getting-started/) example.

# Development Setup using Docker

**This assumes you have [Docker](https://docs.docker.com/v17.09/engine/installation/) installed and running on your machine**

## Starting your Docker container
```
docker-compose up -d
```

## Executing a GraphQL Query
There are multiple ways to do this, but here are a couple to get started:

1) Use GraphiQL, either [web-based](https://github.com/graphql/graphiql) or a [standalone application](https://github.com/skevy/graphiql-app).
2) Use either cURL or a REST client to fire a POST request to http://localhost:8080/

#### GraphiQL Query Example
```
query {
  echo(message: "Hello World")
}
```

#### cURL / REST Payload Example

1) cURL
```bash
curl http://localhost:8080 -d '{"query": "query { echo(message: \"Hello World\") }" }'
```

2) REST Client

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