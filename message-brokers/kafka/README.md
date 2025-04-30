# Kafka with Kafdrop - Docker Setup

This guide demonstrates how to set up a Kafka environment with Zookeeper and Kafdrop using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**Kafdrop Web Interface:**
- URL: http://localhost:9000
- No authentication by default (accessible without login)

**Exposed Ports:**
- 9092: Kafka Broker
- 9000: Kafdrop Web Interface for Kafka monitoring
- 2181: Zookeeper client port

## How to Use

1. **Start the services:**

   ```bash
   docker-compose up -d
   ```

2. **Access Kafdrop Web Interface:**

   - Open your browser and go to: http://localhost:9000. Here, you can monitor Kafka topics, consumer groups, and other Kafka metrics.

3. **Connect to Kafka:**

   - Kafka broker is accessible on port 9092. You can use any Kafka client to connect to the broker using the address kafka:9092.

4. **Stop the services:**

   ```bash
   docker-compose down
   ```

## Data Persistence
Kafka and Zookeeper data are not persisted in this configuration. You may want to add volumes to store Kafka logs and Zookeeper data persistently if using this setup in a production environment.

## Security

This setup is intended for local development. For production environments, consider:

- Securing Kafka with SSL/TLS encryption and SASL authentication
- Configuring proper ACLs (Access Control Lists) for Kafka
- Restricting access to the Zookeeper client port (2181) and Kafka broker (9092)
- Configuring Kafdrop access control, if needed