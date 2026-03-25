# ============================================================
#  Messaging
# ============================================================
.PHONY: up-messaging up-kafka up-rabbitmq up-nats \
        down-messaging down-kafka down-rabbitmq down-nats

# ── UP ───────────────────────────────────────────────────────

up-messaging:
	@echo "$(CYAN)▶ Starting all Messaging brokers...$(RESET)"
	docker compose -f messaging/kafka/docker-compose.yml up -d
	docker compose -f messaging/rabbitmq/docker-compose.yml up -d
	docker compose -f messaging/nats/docker-compose.yml up -d

up-kafka:
	@echo "$(CYAN)▶ Starting Kafka...$(RESET)"
	docker compose -f messaging/kafka/docker-compose.yml up -d
	@echo "$(GREEN)✔ Kafka UI:   http://localhost:8081$(RESET)"
	@echo "$(GREEN)✔ Kafka:      localhost:9092$(RESET)"
	@echo "$(GREEN)✔ Zookeeper:  localhost:2181$(RESET)"

up-rabbitmq:
	@echo "$(CYAN)▶ Starting RabbitMQ...$(RESET)"
	docker compose -f messaging/rabbitmq/docker-compose.yml up -d
	@echo "$(GREEN)✔ RabbitMQ:  http://localhost:15672  (admin/admin)$(RESET)"

up-nats:
	@echo "$(CYAN)▶ Starting NATS...$(RESET)"
	docker compose -f messaging/nats/docker-compose.yml up -d
	@echo "$(GREEN)✔ NATS client:     localhost:4222$(RESET)"
	@echo "$(GREEN)✔ NATS monitoring: http://localhost:8222$(RESET)"
	@echo "$(GREEN)✔ NATS metrics:    http://localhost:7777/metrics$(RESET)"

# ── DOWN ─────────────────────────────────────────────────────

down-messaging:
	docker compose -f messaging/kafka/docker-compose.yml down
	docker compose -f messaging/rabbitmq/docker-compose.yml down
	docker compose -f messaging/nats/docker-compose.yml down

down-kafka:
	docker compose -f messaging/kafka/docker-compose.yml down

down-rabbitmq:
	docker compose -f messaging/rabbitmq/docker-compose.yml down

down-nats:
	docker compose -f messaging/nats/docker-compose.yml down
