# Infra Labs

This project contains multiple `docker-compose.yml` files to spin up different local environments for testing purposes.
Each `docker-compose.yml` file defines a specific environment configuration with various services that you can easily start, test, and stop using Docker Compose.

## Prerequisites

Before you begin, make sure you have the following installed on your local machine:

- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Docker Compose**: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Project Structure

The project contains multiple `docker-compose.yml` files, each corresponding to a different environment. You can find them in the project root directory or in specific subdirectories. 

For example:

- elk: Deploys an ELK stack (Elasticsearch, Logstash, and Kibana).
- kafka: Deploys Kafka with brokers, Zookeeper, and Kafdrop.
- kong: Deploys Kong API Gateway with Konga.
- lamp: Deploys a LAMP stack (Linux, Apache, MySQL, PHP).
- mariadb: Deploys MariaDB with phpMyAdmin.
- mysql: Deploys MySQL with phpMyAdmin.
- otel-lgtm: Deploys an LGTM stack (Loki, Grafana, Tempo, Mimir) with OpenTelemetry.
- postgresql: Deploys PostgreSQL with pgAdmin.
- prometheus-grafana: Deploys Grafana with Prometheus as a data source.
- rabbitmq: Deploys RabbitMQ.
- splunk: Deploys Splunk (without forwarders).
- vault: Deploys HashiCorp Vault.

## How to Use

### Starting an Environment

To start any environment, navigate to the corresponding directory and run the following command:

```bash
docker-compose -f <file_name>.yml up -d
```