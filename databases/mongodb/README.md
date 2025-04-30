# MongoDB with MongoDB Express - Docker Setup

This is a simple guide to run a MongoDB instance with Mongo Express web interface using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**MongoDB:**
- Username: admin
- Password: senha123
- Port: 27017

**Mongo Express (Web Interface):**
- URL: http://localhost:8081
- Username: admin
- Password: senha123

## How to Use

1. **Start the services:**

```bash
docker-compose up -d
```

2. **Access the web interface:**
   
   Open your browser and go to: http://localhost:8081

3. **To connect to MongoDB directly:**

```bash
# Via terminal
mongo -u admin -p senha123 --authenticationDatabase admin localhost:27017

# Or using the connection string
mongodb://admin:senha123@localhost:27017/admin
```

4. **To stop the services:**

```bash
docker-compose down
```

5. **To stop the services and remove volumes (CAUTION: this will delete your data!):**

```bash
docker-compose down -v
```

## Data Persistence

MongoDB data is persisted in a Docker volume called `mongodb_data`. This means your data will remain even if you stop the containers.

## Security

This is a local development environment. For production environments:

1. Change the default passwords
2. Consider using environment variables or Docker secrets
3. Configure appropriate networks and restrict access
4. Set up automatic data backup
