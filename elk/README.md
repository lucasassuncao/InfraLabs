# ELK Stack (Elasticsearch, Logstash, Kibana) - Docker Setup

This guide demonstrates how to set up the ELK Stack (Elasticsearch, Logstash, and Kibana) using Docker Compose for centralized logging and data analysis.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**Kibana Web Interface:**
- URL: http://localhost:5601
- Username: elastic
- Password: changeme (as defined in the ELASTIC_PASSWORD environment variable)

**Exposed Ports:**
- 9200: Elasticsearch REST API
- 5044: Logstash Beats input
- 9600: Logstash Monitoring API
- 5601: Kibana Web Interface

## How to Use

1. **Start the services:**

   ```bash
   docker-compose up -d
   ```

2. **Access Kibana Web Interface:**

   - Open your browser and go to: http://localhost:5601
   - Log in using the username elastic and the password changeme (or the password you define in the environment variable).

3. **Interact with the ELK Stack:**

   - Elasticsearch: You can interact with Elasticsearch via REST API on port 9200.
   - Logstash: Logstash will receive data from Beats (e.g., Filebeat) on port 5044.
   - Kibana: Kibana provides a user-friendly interface for visualizing and analyzing data stored in Elasticsearch.

4. **Stop the services:**

   ```bash
   docker-compose down
   ```

## Data Persistence

Elasticsearch data is persisted in a Docker volume called `esdata`. This ensures that your Elasticsearch indices and data remain intact even if you stop or remove the containers.

## Security

This setup is intended for local development. For production environments, consider:

- Changing the default password (`changeme`) for the elastic user
- Enabling SSL/TLS for encrypted communication with Elasticsearch and Kibana
- Configuring access control and user authentication for Kibana and Elasticsearch
- Implementing proper network security to restrict access to Elasticsearch and Kibana
- Setting up backup strategies for Elasticsearch data