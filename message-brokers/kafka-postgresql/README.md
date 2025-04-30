# Kafka with PostgreSQL - Docker Setup

This guide demonstrates how to set up a Kafka environment, along with PostgreSQL and pgAdmin for database management, using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**PostgreSQL:**
- User: `admin`
- Password: `admin`
- Database: `postgres`
- Port: `5432`

**pgAdmin:**
- Email: `admin@admin.com`
- Password: `admin`
- Port: `5050`

**Kafka:**
- Port: `9092` (Kafka Broker)
- Healthcheck: Configured to test Kafka availability every 30 seconds

**Kafka UI:**
- Port: `8080`
- KAFKA_CLUSTERS_0_NAME: `local`
- KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS: `kafka:9092`

## How to Use

1. **Start the services:**

   ```bash
   docker-compose up -d
   ```

2. **Access the services:**

   - **pgAdmin Web Interface:**
     - Open your browser and go to http://localhost:5050.
     - Log in with the email admin@admin.com and password admin.

   - **Kafka UI Web Interface:**
     - Open your browser and go to http://localhost:8080.
     - Kafka UI provides a web interface to manage Kafka topics, consumer groups, etc.

   - **PostgreSQL:**
     - You can connect to the PostgreSQL database using any SQL client, like pgAdmin, or any other Postgres client using the credentials mentioned above.

4. **Stop the services:**

   ```bash
   docker-compose down
   ```

## Data Persistence
PostgreSQL data is not persisted in this configuration. You can add a volume for PostgreSQL if needed:

```yaml
volumes:
  postgres-data:
    driver: local
```

## Security

This setup is intended for development or testing environments. For production, consider:

- Securing PostgreSQL with SSL.
- Configuring proper ACLs for Kafka.
- Using authentication and authorization for pgAdmin and Kafka UI.
- Adding network isolation and securing service-to-service communication.