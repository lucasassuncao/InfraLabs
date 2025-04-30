# PostgreSQL with pgAdmin - Docker Setup

This is a simple guide to run a PostgreSQL instance with pgAdmin web interface using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**PostgreSQL:**
- Username: admin
- Password: admin
- Default Database: mydatabase
- Port: 5432

**pgAdmin:**
- URL: http://localhost:5050
- Login credentials:
  - Email: admin@admin.com
  - Password: admin

## How to Use

1. **Start the services:**

```bash
docker-compose up -d
```

2. **Access pgAdmin:**
   
   Open your browser and go to: http://localhost:5050
   
   Log in with the pgAdmin credentials mentioned above.

3. **Connect to PostgreSQL via pgAdmin:**
   
   After logging into pgAdmin:
   
   a. Right-click on "Servers" in the left panel and select "Create" > "Server"
   
   b. In the "General" tab, give your connection a name (e.g., "Local PostgreSQL")
   
   c. In the "Connection" tab, enter:
      - Host name/address: postgres
      - Port: 5432
      - Maintenance database: mydatabase
      - Username: admin
      - Password: admin

4. **Connect to PostgreSQL from your application:**

```
Host: localhost
Port: 5432
Database: mydatabase
Username: admin
Password: admin
```

5. **Stop the services:**

```bash
docker-compose down
```

## Data Persistence

PostgreSQL data is persisted in a Docker volume called `postgres_data`. This ensures your databases, tables, and data remain intact even if you stop or remove the containers.

## Security

This setup is intended for local development. For production environments, consider:

1. Using stronger passwords than the defaults
2. Storing sensitive information in environment variables or Docker secrets
3. Restricting network access to the database
4. Implementing regular data backups
5. Setting up proper user permissions for database access
6. Configuring SSL for encrypted connections
