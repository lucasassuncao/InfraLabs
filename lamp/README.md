# LAMP Stack with WordPress - Docker Setup

This is a simple guide to run a LAMP (Linux, Apache, MySQL, PHP) stack with WordPress and phpMyAdmin using Docker Compose.

## Requirements

- Docker
- Docker Compose
- A Dockerfile in the same directory as your docker-compose.yml file

## Default Credentials

**MySQL:**
- Root User:
  - Username: root
  - Password: root
- WordPress User:
  - Username: wp_user
  - Password: wp_pass
- Default Database: wordpress
- Port: 3306

**phpMyAdmin:**
- URL: http://localhost:8081
- Login with MySQL credentials:
  - Username: root
  - Password: root

**WordPress:**
- URL: http://localhost:8080
- Initial setup will be required on first visit

## How to Use

1. **Ensure you have a proper Dockerfile** in the same directory, as the setup requires a custom build for the PHP Apache service.

2. **Make sure you have a WordPress directory** in the same location as your docker-compose.yml file.

3. **Start the services:**

```bash
docker-compose up -d
```

4. **Access WordPress:**
   
   Open your browser and go to: http://localhost:8080
   
   Follow the WordPress installation wizard to complete the setup.

5. **Access phpMyAdmin:**
   
   Open your browser and go to: http://localhost:8081

6. **Stop the services:**

```bash
docker-compose down
```

## Data Persistence

- **Database data** is persisted in a Docker volume called `db_data`. This ensures your MySQL data remains intact even if you stop or remove the containers.
- **WordPress files** are stored in the `./wordpress` directory on your host machine, mapped to `/var/www/html` in the container.

## Security

This setup is intended for local development. For production environments, consider:

1. Using stronger passwords than the defaults
2. Storing sensitive information in environment variables or Docker secrets
3. Implementing proper web server security configurations
4. Setting up SSL/TLS for encrypted connections
5. Implementing regular data backups
6. Removing phpMyAdmin or securing it with additional authentication
7. Updating to the latest stable versions of all components
