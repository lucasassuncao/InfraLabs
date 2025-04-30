# Redis with RedisInsight - Docker Setup

This is a simple guide to run a Redis instance along with RedisInsight using Docker Compose.

## Requirements

- Docker  
- Docker Compose  

## Default Credentials

**Redis:**  
- Port: `6379`  
- Password: `secret`  

**RedisInsight:**  
- URL: http://localhost:5540  
- On first access, you'll need to manually connect to Redis using the following:
  - Host: `redis`
  - Port: `6379`
  - Password: `secret`

## How to Use

1. **Start the services:**

    ```bash
    docker-compose up -d
    ```

2. **Access RedisInsight:**

    - Open your browser and go to: [http://localhost:5540](http://localhost:5540)  
    - Connect to the Redis server using:

      - Host: `redis`  
      - Port: `6379`  
      - Password: `secret`

3. **Stop the services:**

    ```bash
    docker-compose down
    ```

## Data Persistence

RedisInsight data is stored in a Docker volume named `redis-insight`. This ensures that your RedisInsight settings and history persist even after stopping or removing the container.

## Security

This setup is intended for local development. For production environments, consider:

1. Changing the default password (`REDIS_PASSWORD`)  
2. Storing sensitive credentials using environment variables or Docker secrets  
3. Restricting access to exposed ports  
4. Using Docker private networks for container communication  
5. Enabling Redis authentication and TLS encryption  
