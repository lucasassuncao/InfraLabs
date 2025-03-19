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
├── README.md
├── kafka
│   └── docker-compose.yml
├── kong
│   └── docker-compose.yml
├── lamp
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── wordpress
├── mysql
│   └── docker-compose.yml
└── rabbitmq
    └── docker-compose.yml
```

- **kafka:** Sets up a Kafka environment using Docker. This setup includes Kafka brokers, Zookeeper and Kafdrop to allow you to test message streaming and event-driven architectures.
- **kong:** Sets up a Kong API Gateway using Docker. This setup includes Kong and Konga to help you manage APIs, handle rate limiting, authentication, and other API-related functionalities.
- **lamp:** Sets up a classic LAMP (Linux, Apache, MySQL, PHP) stack using Docker. This is for running WordPress locally for example.
- **mysql:** Sets up a MySQL + PHPMyAdmin environment using Docker. It's ideal for local testing with databases that don't require a complex setup.
- **rabbitmq:** Sets up RabbitMQ, a widely used message broker, to help you test and work with messaging queues in a Dockerized environment.

## How to Use

### Starting an Environment

To start any environment, navigate to the corresponding directory and run the following command:

```bash
docker-compose -f <file_name>.yml up