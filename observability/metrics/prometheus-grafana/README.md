# Prometheus with Grafana - Docker Setup

This is a simple guide to run Prometheus and Grafana for monitoring and visualization using Docker Compose.

## Requirements

- Docker  
- Docker Compose  

## Default Credentials

**Prometheus:**  
- URL: http://localhost:9090  

**Grafana:**  
- URL: http://localhost:3000  
- Username: `admin`  
- Password: `admin`  

## How to Use

1. **Start the services:**

    ```bash
    docker-compose up -d
    ```

2. **Access Prometheus:**

Open your browser and go to: [http://localhost:9090](http://localhost:9090)

3. **Access Grafana:**

    - Open your browser and go to: [http://localhost:3000](http://localhost:3000)  
    - Log in with the credentials mentioned above.  
    - You can add Prometheus as a data source and start importing dashboards.

4. **Stop the services:**

    ```bash
    docker-compose down
    ```

## Data Persistence

Prometheus configuration is mounted from the local `./prometheus` directory.  
Grafana data is not persisted by default in this setup. For persistent storage, consider mounting a volume to `/var/lib/grafana`.

## Security

This setup is intended for local development. For production environments, consider:

1. Changing the default Grafana admin password (`GF_SECURITY_ADMIN_PASSWORD`)  
2. Persisting Grafana data using volumes  
3. Storing secrets and credentials securely (e.g., Docker secrets or environment variables)  
4. Restricting access to exposed ports  
5. Enabling authentication for Prometheus (via reverse proxy)  
6. Using HTTPS for secure access to the interfaces  
