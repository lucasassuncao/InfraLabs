# OTEL LGTM (Grafana + OpenTelemetry) - Docker Setup

This is a simple guide to run the OTEL LGTM stack using Docker Compose. It includes Grafana and OpenTelemetry collectors in one container.

## Requirements

- Docker
- Docker Compose

## Default Credentials
**Grafana:**
- URL: http://localhost:3000
- Username: `admin`
- Password: `admin`

**Exposed Ports:**
- 3000: Grafana Web Interface
- 4317: OpenTelemetry Collector (OTLP gRPC)
- 4318: OpenTelemetry Collector (OTLP HTTP)

## How to Use

1. **Start the service:**

    ```bash
    docker-compose up -d
    ```

2. **Access Grafana:**

    - Open your browser and go to: http://localhost:3000
    - Log in with the credentials mentioned above.
    - Send data using OpenTelemetry SDKs:
        - gRPC Endpoint: http://localhost:4317
        - HTTP Endpoint: http://localhost:4318

3. Stop the service:

    ```bash
    docker-compose down
    ```

## Data Persistence

This setup does not persist data by default. If you need to mount local configuration files or retain data, uncomment and configure the volumes section in the docker-compose.yml file.

## Security

This setup is intended for local development. For production environments, consider:

- Changing the default Grafana admin password (`GF_SECURITY_ADMIN_PASSWORD`)
- Storing credentials and secrets securely
- Restricting access to exposed ports
- Persisting data using Docker volumes
- Enabling HTTPS and authentication for OpenTelemetry endpoints