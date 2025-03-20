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

```
.
├── README.md
├── elk
│   ├── README.md
│   ├── docker-compose.yml
│   └── logstash.conf
├── kafka
│   └── docker-compose.yml
├── kong
│   └── docker-compose.yml
├── lamp
│   ├── Dockerfile
│   └── docker-compose.yml
├── mysql
│   └── docker-compose.yml
├── otel-lgtm
│   └── docker-compose.yml
├── rabbitmq
│   └── docker-compose.yml
├── splunk
│   ├── README.md
│   └── docker-compose.yml
└── vault
    └── docker-compose.yml

```

- **elk:** Sets up an ELK (ElasticSearch, Logstash and Kibana) stack.
- **kafka:** Sets up a Kafka. This setup includes Kafka brokers, Zookeeper and Kafdrop.
- **kong:** Sets up a Kong API Gateway. This setup includes Kong and Konga.
- **lamp:** Sets up a classic LAMP (Linux, Apache, MySQL, PHP) stack.
- **mysql:** Sets up a MySQL + PHPMyAdmin.
- **otel-lgtm:** Sets up a LGTM (Loki, Grafana, Tempo and Mimir) stack along with OpenTelemetry (OTel).
- **rabbitmq:** Sets up RabbitMQ.
- **splunk:** Sets up a Splunk instance (without forwarders).
- **vault:** Sets up Hashicorp Vault

## How to Use

### Starting an Environment

To start any environment, navigate to the corresponding directory and run the following command:

```bash
docker-compose -f <file_name>.yml up -d
```