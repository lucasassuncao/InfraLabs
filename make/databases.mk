# ============================================================
#  Databases
# ============================================================
.PHONY: up-databases up-postgresql up-mysql up-mariadb up-redis up-mongodb \
        up-cassandra up-minio up-elasticsearch up-meilisearch \
        down-databases down-postgresql down-mysql down-mariadb down-redis down-mongodb \
        down-cassandra down-minio down-elasticsearch down-meilisearch

# -- UP -------------------------------------------------------

up-databases:
	@echo "$(CYAN)>> Starting all Databases...$(RESET)"
	docker compose -f databases/postgresql/docker-compose.yml up -d
	docker compose -f databases/mysql/docker-compose.yml up -d
	docker compose -f databases/mariadb/docker-compose.yml up -d
	docker compose -f databases/redis/docker-compose.yml up -d
	docker compose -f databases/mongodb/docker-compose.yml up -d
	docker compose -f databases/cassandra/docker-compose.yml up -d
	docker compose -f databases/minio/docker-compose.yml up -d
	docker compose -f databases/elasticsearch/docker-compose.yml up -d
	docker compose -f databases/meilisearch/docker-compose.yml up -d

up-postgresql:
	@echo "$(CYAN)>> Starting PostgreSQL...$(RESET)"
	docker compose -f databases/postgresql/docker-compose.yml up -d
	@echo "$(GREEN)ok pgAdmin:     http://localhost:5050  (admin@admin.com/admin)$(RESET)"
	@echo "$(GREEN)ok PostgreSQL:  localhost:5432  (admin/admin)$(RESET)"

up-mysql:
	@echo "$(CYAN)>> Starting MySQL...$(RESET)"
	docker compose -f databases/mysql/docker-compose.yml up -d
	@echo "$(GREEN)ok MySQL:       localhost:3306  (admin/admin)$(RESET)"
	@echo "$(GREEN)ok phpMyAdmin:  http://localhost:5051$(RESET)"

up-mariadb:
	@echo "$(CYAN)>> Starting MariaDB...$(RESET)"
	docker compose -f databases/mariadb/docker-compose.yml up -d
	@echo "$(GREEN)ok MariaDB:     localhost:3307  (admin/admin)$(RESET)"
	@echo "$(GREEN)ok phpMyAdmin:  http://localhost:5052$(RESET)"

up-redis:
	@echo "$(CYAN)>> Starting Redis...$(RESET)"
	docker compose -f databases/redis/docker-compose.yml up -d
	@echo "$(GREEN)ok Redis:         localhost:6379  (password: admin)$(RESET)"
	@echo "$(GREEN)ok RedisInsight:  http://localhost:5540$(RESET)"

up-mongodb:
	@echo "$(CYAN)>> Starting MongoDB...$(RESET)"
	docker compose -f databases/mongodb/docker-compose.yml up -d
	@echo "$(GREEN)ok MongoDB:       localhost:27017  (admin/admin)$(RESET)"
	@echo "$(GREEN)ok Mongo Express: http://localhost:8082  (admin/admin)$(RESET)"

up-cassandra:
	@echo "$(CYAN)>> Starting Cassandra...$(RESET)"
	docker compose -f databases/cassandra/docker-compose.yml up -d
	@echo "$(GREEN)ok Cassandra CQL:  localhost:9042$(RESET)"
	@echo "$(YELLOW)  Connect: docker exec -it cassandra cqlsh$(RESET)"

up-minio:
	@echo "$(CYAN)>> Starting MinIO...$(RESET)"
	docker compose -f databases/minio/docker-compose.yml up -d
	@echo "$(GREEN)ok MinIO S3 API:  http://localhost:9000  (admin/admin123)$(RESET)"
	@echo "$(GREEN)ok MinIO Console: http://localhost:9001  (admin/admin123)$(RESET)"

up-elasticsearch:
	@echo "$(CYAN)>> Starting Elasticsearch standalone...$(RESET)"
	docker compose -f databases/elasticsearch/docker-compose.yml up -d
	@echo "$(GREEN)ok Elasticsearch: http://localhost:9201$(RESET)"
	@echo "$(GREEN)ok Dejavu UI:     http://localhost:1358$(RESET)"

up-meilisearch:
	@echo "$(CYAN)>> Starting Meilisearch...$(RESET)"
	docker compose -f databases/meilisearch/docker-compose.yml up -d
	@echo "$(GREEN)ok Meilisearch UI/API: http://localhost:7700  (masterkey)$(RESET)"

# -- DOWN -----------------------------------------------------

down-databases:
	docker compose -f databases/postgresql/docker-compose.yml down
	docker compose -f databases/mysql/docker-compose.yml down
	docker compose -f databases/mariadb/docker-compose.yml down
	docker compose -f databases/redis/docker-compose.yml down
	docker compose -f databases/mongodb/docker-compose.yml down
	docker compose -f databases/cassandra/docker-compose.yml down
	docker compose -f databases/minio/docker-compose.yml down
	docker compose -f databases/elasticsearch/docker-compose.yml down
	docker compose -f databases/meilisearch/docker-compose.yml down

down-postgresql:
	docker compose -f databases/postgresql/docker-compose.yml down

down-mysql:
	docker compose -f databases/mysql/docker-compose.yml down

down-mariadb:
	docker compose -f databases/mariadb/docker-compose.yml down

down-redis:
	docker compose -f databases/redis/docker-compose.yml down

down-mongodb:
	docker compose -f databases/mongodb/docker-compose.yml down

down-cassandra:
	docker compose -f databases/cassandra/docker-compose.yml down

down-minio:
	docker compose -f databases/minio/docker-compose.yml down

down-elasticsearch:
	docker compose -f databases/elasticsearch/docker-compose.yml down

down-meilisearch:
	docker compose -f databases/meilisearch/docker-compose.yml down
