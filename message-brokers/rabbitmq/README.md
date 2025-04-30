# RabbitMQ - Docker Setup

This is a simple guide to run a RabbitMQ instance with the Management Plugin using Docker Compose.

## Requirements

- Docker  
- Docker Compose  

## Default Credentials

**RabbitMQ Web Management Interface:**  
- URL: http://localhost:15672  
- Username: `user`  
- Password: `password`  

**Exposed Ports:**  
- 5672: AMQP Protocol Port  
- 15672: Web Management Interface

## How to Use

1. **Start the service:**

    ```bash
    docker-compose up -d
    ```

2. **Access RabbitMQ Web Interface:**

    - Open your browser and go to: [http://localhost:15672](http://localhost:15672)  
    - Log in with the credentials mentioned above.

3. **Stop the service:**

    ```bash
    docker-compose down
    ```

## Data Persistence

RabbitMQ data is persisted in a Docker volume called `rabbitmq_data`. This ensures your RabbitMQ configurations, queues, and messages remain intact even if you stop or remove the container.

## Security

This setup is intended for local development. For production environments, consider:

1. Changing the default credentials (`RABBITMQ_DEFAULT_USER` and `RABBITMQ_DEFAULT_PASS`)  
2. Storing credentials securely using environment variables or Docker secrets  
3. Restricting access to exposed ports  
4. Using TLS/SSL for secure communication  
5. Configuring appropriate permissions and user roles within RabbitMQ  
