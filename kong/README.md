# Kong API Gateway - Docker Setup

This guide demonstrates how to set up Kong API Gateway along with Konga (a management UI) and a PostgreSQL database using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**Konga Web Interface:**
- URL: http://localhost:1337
- Username: `admin`
- Password: `admin`

**Exposed Ports:**
- 8000: Kong Proxy Port (HTTP)
- 8443: Kong Proxy Port (HTTPS)
- 8001: Kong Admin Port (HTTP)
- 8444: Kong Admin Port (HTTPS)
- 1337: Konga Web Interface

## How to Use

1. **Start the services:**

```bash
docker-compose up -d
```

2. **Access Konga Web Interface:**

Open your browser and go to: http://localhost:1337
Log in with the credentials mentioned above.

3. **Interact with Kong API Gateway:**

You can now use Kong for API management via the exposed proxy ports (8000 for HTTP and 8443 for HTTPS).

4. **Stop the services:**

```bash
docker-compose down
```

## Data Persistence

Kong Database is persisted in a Docker volume called `kong-db-data`.
This ensures that your Kong database remains intact even if you stop or remove the containers.

## Security

This setup is intended for local development. For production environments, consider:

- Changing the default Konga admin credentials (`admin` / `admin`)
- Securing access to Kong Admin ports (8001 and 8444) by restricting access to trusted IPs
- Enabling SSL/TLS for Kong and Konga
- Using environment variables or Docker secrets to securely store sensitive information such as passwords
- Setting up proper user roles and access control within Kong and Konga