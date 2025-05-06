# Grafana - Docker Setup

This guide demonstrates how to set up **Grafana** for data visualization and monitoring using Docker Compose.

## Requirements

- Docker  
- Docker Compose

## Default Credentials

**Grafana Web Interface:**

- URL: http://localhost:3000  
- Username: `admin`  
- Password: `admin`

**Exposed Ports:**

- `3000`: Grafana Web Interface (UI)

## How to Use

1. **Start the service:**

    ```bash
    docker-compose up -d
    ```

2. **Access Grafana Web Interface:**

    - Open your browser and go to: [http://localhost:3000](http://localhost:3000)
    - Log in using the default credentials:
      - Username: `admin`
      - Password: `admin`
    - On the first login, Grafana may ask you to change your password.

3. **Using Grafana:**

    - Add a data source (e.g., Prometheus, InfluxDB, PostgreSQL)
    - Create dashboards and panels to visualize metrics and logs
    - Configure alerts and notifications if desired

4. **Stop the service:**

    ```bash
    docker-compose down
    ```

## Data Persistence

Grafana data is persisted in a Docker volume named `grafana_data`. This ensures that dashboards, settings, and configurations remain intact even if you stop or remove the container.

## Security

This setup is intended for local development. For production environments, consider:

- Changing the default `admin` password
- Enabling HTTPS and reverse proxy support
- Integrating with authentication providers (OAuth, LDAP, etc.)
- Creating non-admin users for regular access
- Setting up role-based access control
