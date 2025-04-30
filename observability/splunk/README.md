# Splunk Enterprise - Docker Setup

This is a simple guide to run a Splunk Enterprise instance using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**Splunk Web Interface:**
- URL: http://localhost:8000
- Username: `admin`
- Password: `changeme`

**Exposed Ports:**
- 8000: Web Interface
- 8088: HTTP Event Collector (HEC)
- 8089: Management API
- 9997: Splunk Forwarder Data Receiver

## How to Use

1. **Start the service:**

    ```bash
    docker-compose up -d
    ```

2. **Access Splunk Web Interface:**
   
   - Open your browser and go to: http://localhost:8000
   - Log in with the credentials mentioned above.

3. **Send data to Splunk:**

    - **Using HTTP Event Collector (HEC):** 
     Configure HEC token in Splunk Web interface, then send data to `http://localhost:8088/services/collector`
   
   - **Using Splunk Forwarders:** 
     Configure Splunk Forwarders to send data to your host on port 9997

4. **Stop the service:**

    ```bash
    docker-compose down
    ```

## Data Persistence

Splunk data is persisted in a Docker volume called `splunk_data`. This ensures your Splunk configurations, indexes, and data remain intact even if you stop or remove the container.

## Security

This setup is intended for local development. For production environments, consider:

1. Changing the default password (`SPLUNK_PASSWORD`) immediately
2. Using a stronger password than the default
3. Storing sensitive information in environment variables or Docker secrets
4. Implementing proper network security to restrict access to Splunk ports
5. Setting up SSL/TLS for encrypted connections
6. Configuring appropriate user roles and access controls within Splunk
7. Setting up regular backups of your Splunk data
8. Implementing proper audit logging
