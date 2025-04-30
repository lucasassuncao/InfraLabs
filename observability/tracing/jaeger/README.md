# Jaeger - Docker Setup

This guide demonstrates how to set up a Jaeger distributed tracing environment using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Configuration

**Jaeger All-in-One:**
- UI Port: `16686` (Web Interface)
- UDP Port: `6831` (Jaeger Thrift format)
- UDP Port: `6832` (Jaeger Thrift compact format)
- HTTP Port: `14268` (Direct HTTP collector)
- HTTP Port: `14250` (Model handler)
- HTTP Port: `9411` (Zipkin compatibility)
- HTTP Port: `5778` (Configurations)
- HTTP Port: `14269` (Admin)

**Environment Variables:**
- COLLECTOR_ZIPKIN_HOST_PORT: `9411`
- COLLECTOR_OTLP_ENABLED: `true`

## How to Use

1. **Start the services:**

   ```bash
   docker-compose up -d
   ```

2. **Access the services:**

   - **Jaeger UI Web Interface:**
     - Open your browser and go to http://localhost:16686
     - The UI allows you to search and analyze traces, view dependency graphs, and more.

   - **Sending Traces:**
     - Configure your applications to send traces to:
       - UDP: localhost:6831 (Jaeger Thrift)
       - HTTP: localhost:14268 (Direct)
       - HTTP: localhost:9411 (Zipkin compatibility)

3. **Stop the services:**

   ```bash
   docker-compose down
   ```

## Data Persistence

Jaeger data is not persisted in this configuration. For production environments, consider configuring a storage backend like Elasticsearch, Cassandra, or PostgreSQL.

## Security

This setup is intended for development or testing environments. For production, consider:

- Configuring proper authentication and authorization.
- Setting up TLS for secure communication.
- Implementing sampling strategies to control the volume of traces.
- Adding network isolation and securing service-to-service communication.
