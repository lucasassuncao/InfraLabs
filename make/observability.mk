# ============================================================
#  Observability
# ============================================================
.PHONY: up-observability up-prometheus-stack up-lgtm up-elk up-splunk up-otel up-alloy \
        down-observability down-prometheus-stack down-lgtm down-elk down-splunk down-otel down-alloy

# -- UP -------------------------------------------------------

up-observability:
	@echo "$(CYAN)>> Starting all Observability stacks...$(RESET)"
	docker compose -f observability/prometheus-stack/docker-compose.yml up -d
	docker compose -f observability/lgtm/docker-compose.yml up -d
	docker compose -f observability/elk/docker-compose.yml up -d
	docker compose -f observability/splunk/docker-compose.yml up -d
	docker compose -f observability/otel/docker-compose.yml up -d
	docker compose -f observability/alloy/docker-compose.yml up -d

up-prometheus-stack:
	@echo "$(CYAN)>> Starting Prometheus Stack...$(RESET)"
	docker compose -f observability/prometheus-stack/docker-compose.yml up -d
	@echo "$(GREEN)ok Grafana:       http://localhost:3000  (admin/admin)$(RESET)"
	@echo "$(GREEN)ok Prometheus:    http://localhost:9090$(RESET)"
	@echo "$(GREEN)ok Alertmanager:  http://localhost:9093$(RESET)"
	@echo "$(GREEN)ok Loki:          http://localhost:3100$(RESET)"

up-lgtm:
	@echo "$(CYAN)>> Starting LGTM stack...$(RESET)"
	docker compose -f observability/lgtm/docker-compose.yml up -d
	@echo "$(GREEN)ok Grafana:  http://localhost:3001  (admin/admin)$(RESET)"
	@echo "$(GREEN)ok Tempo:    http://localhost:3200$(RESET)"
	@echo "$(GREEN)ok Mimir:    http://localhost:9009$(RESET)"
	@echo "$(GREEN)ok Loki:     http://localhost:3101$(RESET)"

up-elk:
	@echo "$(CYAN)>> Starting ELK stack... (may take ~60s for Elasticsearch)$(RESET)"
	docker compose -f observability/elk/docker-compose.yml up -d
	@echo "$(GREEN)ok Kibana:           http://localhost:5601$(RESET)"
	@echo "$(GREEN)ok Elasticsearch:    http://localhost:9200$(RESET)"
	@echo "$(GREEN)ok Logstash TCP:     localhost:5000$(RESET)"

up-splunk:
	@echo "$(CYAN)>> Starting Splunk stack... (may take ~2min on first boot)$(RESET)"
	docker compose -f observability/splunk/docker-compose.yml up -d
	@echo "$(GREEN)ok Splunk Web:    http://localhost:8000  (admin/changeme123!)$(RESET)"
	@echo "$(GREEN)ok HEC endpoint:  http://localhost:8088/services/collector$(RESET)"
	@echo "$(YELLOW)!! Splunk takes ~2min to fully initialize$(RESET)"

up-otel:
	@echo "$(CYAN)>> Starting OTel stack...$(RESET)"
	docker compose -f observability/otel/docker-compose.yml up -d
	@echo "$(GREEN)ok Jaeger:          http://localhost:16686$(RESET)"
	@echo "$(GREEN)ok Zipkin:          http://localhost:9411$(RESET)"
	@echo "$(GREEN)ok OTel Collector:  grpc://localhost:4317 | http://localhost:4318$(RESET)"
	@echo "$(GREEN)ok zPages (debug):  http://localhost:55679/debug/tracez$(RESET)"

up-alloy:
	@echo "$(CYAN)>> Starting Grafana Alloy...$(RESET)"
	docker compose -f observability/alloy/docker-compose.yml up -d
	@echo "$(GREEN)ok Alloy UI:        http://localhost:12345$(RESET)"
	@echo "$(GREEN)ok OTLP gRPC:       localhost:4321$(RESET)"
	@echo "$(GREEN)ok OTLP HTTP:       localhost:4322$(RESET)"

# -- DOWN -----------------------------------------------------

down-observability:
	docker compose -f observability/prometheus-stack/docker-compose.yml down
	docker compose -f observability/lgtm/docker-compose.yml down
	docker compose -f observability/elk/docker-compose.yml down
	docker compose -f observability/splunk/docker-compose.yml down
	docker compose -f observability/otel/docker-compose.yml down
	docker compose -f observability/alloy/docker-compose.yml down

down-prometheus-stack:
	docker compose -f observability/prometheus-stack/docker-compose.yml down

down-lgtm:
	docker compose -f observability/lgtm/docker-compose.yml down

down-elk:
	docker compose -f observability/elk/docker-compose.yml down

down-splunk:
	docker compose -f observability/splunk/docker-compose.yml down

down-otel:
	docker compose -f observability/otel/docker-compose.yml down

down-alloy:
	docker compose -f observability/alloy/docker-compose.yml down
