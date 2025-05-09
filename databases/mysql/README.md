# MySQL with phpMyAdmin - Docker Setup

This is a simple guide to run a MySQL instance with phpMyAdmin web interface using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**MySQL:**
- Root User:
  - Username: `root`
  - Password: `root`
- Application User:
  - Username: `admin`
  - Password: `pass123`
- Default Database: `lab_mysql`
- Port: `3306`

**phpMyAdmin:**
- URL: http://localhost:8080
- Login with MySQL credentials:
  - Username: `root`
  - Password: `root`

## How to Use

1. **Start the services:**

   ```bash
   docker-compose up -d
   ```

2. **Access phpMyAdmin:**
   
   - Open your browser and go to: http://localhost:8080

3. **Connect to MySQL from your application:**

   ```
   Host: localhost
   Port: 3306
   Database: lab_mysql
   Username: admin
   Password: pass123
   ```

4. **Stop the services:**

   ```bash
   docker-compose down
   ```

## Data Persistence

MySQL data is persisted in a Docker volume called `mysql_data`. This ensures your databases, tables, and data remain intact even if you stop or remove the containers.

## Security

This setup is intended for local development. For production environments, consider:

1. Using stronger passwords than the defaults
2. Storing sensitive information in environment variables or Docker secrets
3. Restricting network access to the database
4. Implementing regular data backups
5. Disabling root access or restricting it to localhost only
6. Setting up proper user permissions for database access
