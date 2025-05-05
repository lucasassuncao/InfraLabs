# Keycloak - Docker Setup

This guide demonstrates how to set up Keycloak with a PostgreSQL database using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**Keycloak Web Interface:**
- URL: http://localhost:8080
- Username: `admin`
- Password: `admin`

**Exposed Ports:**
- 8080: Keycloak Web Interface (UI)

## How to Use

1. **Start the services:**

   ```bash
   docker-compose up -d
   ```

2. **Access Keycloak Web Interface:**

   - Open your browser and go to: http://localhost:8080
   - Log in using the default credentials:
     - Username: admin
     - Password: admin

3. **Using Keycloak:**
   - After logging in, you can create realms, clients, users, and roles.
   - You can configure identity and access management (IAM) policies for your applications.

4. **Stop the services:**

   ```bash
   docker-compose down
   ```

## Data Persistence

PostgreSQL data is persisted in a Docker volume named `postgres_data`. This ensures that your Keycloak database remains intact even if you stop or remove the containers.

## Security

This setup is intended for local development. For production environments, consider:

- Changing the default admin credentials to secure values
- Using production mode (start instead of start-dev)
- Configuring HTTPS and reverse proxy for secure access
- Setting up user roles and access control policies
- Using external storage or cloud-managed databases