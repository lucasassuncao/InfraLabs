# ============================================================
#  DevOps/SRE Local Stacks - Master Makefile
#  Usage: make <target>
# ============================================================

# -- Stack lists (used by batch targets) ----------------------
OBSERVABILITY_STACKS := observability/prometheus-stack observability/lgtm observability/elk observability/splunk observability/otel observability/alloy
DATABASES_STACKS     := databases/postgresql databases/mysql databases/mariadb databases/redis databases/mongodb databases/cassandra databases/minio databases/elasticsearch databases/meilisearch
MESSAGING_STACKS     := messaging/kafka messaging/rabbitmq messaging/nats
INFRA_STACKS         := infra/traefik infra/consul infra/vault infra/kong infra/keycloak infra/portainer infra/nginx infra/uptime-kuma infra/unleash
SECURITY_STACKS      := security/owasp-zap
WEB_STACKS           := web/lamp web/lemp web/mailpit web/hugo
ALL_STACKS           := $(OBSERVABILITY_STACKS) $(DATABASES_STACKS) $(MESSAGING_STACKS) $(INFRA_STACKS) $(SECURITY_STACKS) $(WEB_STACKS)

# -- Shell (cross-platform: sh on Linux, Gow sh on Windows) ---
SHELL := sh

# -- Colors ----------------------------------------------------
CYAN   := $(shell printf '\033[0;36m')
GREEN  := $(shell printf '\033[0;32m')
YELLOW := $(shell printf '\033[0;33m')
RED    := $(shell printf '\033[0;31m')
RESET  := $(shell printf '\033[0m')

.DEFAULT_GOAL := help

# -- Category makefiles ----------------------------------------
include make/observability.mk
include make/databases.mk
include make/messaging.mk
include make/infra.mk
include make/security.mk
include make/web.mk
include make/utils.mk

# ============================================================
#  HELP
# ============================================================
.PHONY: help
help:
	@echo ""
	@echo "$(CYAN)+======================================================╗$(RESET)"
	@echo "$(CYAN)|         DevOps/SRE Local Stacks - Makefile          |$(RESET)"
	@echo "$(CYAN)+======================================================╝$(RESET)"
	@echo ""
	@echo "$(GREEN)-- Observability --------------------------------------$(RESET)"
	@echo "  make up-observability      Start ALL observability stacks"
	@echo "  make up-prometheus-stack   Prometheus + Grafana + Loki + Alertmanager"
	@echo "  make up-lgtm               Loki + Grafana + Tempo + Mimir"
	@echo "  make up-elk                Elasticsearch + Logstash + Kibana + Filebeat"
	@echo "  make up-splunk             Splunk Enterprise + Universal Forwarder"
	@echo "  make up-otel               OTel Collector + Jaeger + Zipkin"
	@echo "  make up-alloy              Grafana Alloy (OpenTelemetry pipeline)"
	@echo ""
	@echo "$(GREEN)-- Databases -------------------------------------------$(RESET)"
	@echo "  make up-databases          Start ALL databases"
	@echo "  make up-postgresql         PostgreSQL + pgAdmin"
	@echo "  make up-mysql              MySQL + phpMyAdmin"
	@echo "  make up-mariadb            MariaDB + phpMyAdmin"
	@echo "  make up-redis              Redis + RedisInsight"
	@echo "  make up-mongodb            MongoDB + Mongo Express"
	@echo "  make up-cassandra          Cassandra 4.1"
	@echo "  make up-minio              MinIO (S3-compatible)"
	@echo "  make up-elasticsearch      Elasticsearch standalone + Dejavu UI"
	@echo "  make up-meilisearch        Meilisearch (search engine)"
	@echo ""
	@echo "$(GREEN)-- Messaging -------------------------------------------$(RESET)"
	@echo "  make up-messaging          Start ALL messaging brokers"
	@echo "  make up-kafka              Kafka + Zookeeper + Kafka UI"
	@echo "  make up-rabbitmq           RabbitMQ"
	@echo "  make up-nats               NATS + JetStream + Prometheus exporter"
	@echo ""
	@echo "$(GREEN)-- Infra ------------------------------------------------$(RESET)"
	@echo "  make up-infra              Start ALL infra tools"
	@echo "  make up-traefik            Traefik (reverse proxy)"
	@echo "  make up-consul             Consul (service discovery)"
	@echo "  make up-vault              Vault (secrets manager)"
	@echo "  make up-kong               Kong API Gateway + Konga UI"
	@echo "  make up-keycloak           Keycloak + PostgreSQL"
	@echo "  make up-portainer          Portainer CE (Docker UI)"
	@echo "  make up-nginx              NGINX (reverse proxy / load balancer)"
	@echo "  make up-uptime-kuma        Uptime Kuma (uptime monitoring)"
	@echo "  make up-unleash            Unleash (feature flag management)"

	@echo ""
	@echo "$(GREEN)-- Security --------------------------------------------$(RESET)"
	@echo "  make up-security           Start ALL security tools"
	@echo "  make up-owasp-zap          OWASP ZAP (web security scanner)"
	@echo ""
	@echo "$(GREEN)-- Web -------------------------------------------------$(RESET)"
	@echo "  make up-web                Start ALL web stacks"
	@echo "  make up-lamp               Apache + PHP + MySQL + phpMyAdmin"
	@echo "  make up-lemp               NGINX + PHP-FPM + MySQL + phpMyAdmin"
	@echo "  make up-mailpit            Mailpit (SMTP email catcher)"
	@echo "  make up-hugo               Hugo (static site generator + live reload)"
	@echo ""
	@echo "$(GREEN)-- Batch operations ------------------------------------$(RESET)"
	@echo "  make up-all                Start ALL stacks"
	@echo "  make down-all              Stop ALL stacks"
	@echo "  make restart-all           Restart ALL stacks"
	@echo "  make pull-all              Pull latest images for all stacks"
	@echo "  make ps                    Show all running containers"
	@echo "  make logs STACK=<path>     Tail logs (e.g. STACK=observability/elk)"
	@echo ""
	@echo "$(GREEN)-- Utilities -------------------------------------------$(RESET)"
	@echo "  make nuke                  Stop + remove ALL containers, volumes, networks"
	@echo "  make urls                  Print all service URLs"
	@echo "  make health                Check health of all containers"
	@echo ""

# ============================================================
#  BATCH
# ============================================================
.PHONY: up-all down-all restart-all pull-all

up-all:
	@echo "$(CYAN)>> Starting ALL stacks...$(RESET)"
	@for stack in $(ALL_STACKS); do \
		echo "$(YELLOW)  → $$stack$(RESET)"; \
		docker compose -f $$stack/docker-compose.yml up -d; \
	done
	@echo "$(GREEN)ok All stacks started. Run 'make urls' to see endpoints.$(RESET)"

down-all:
	@echo "$(RED)▼ Stopping ALL stacks...$(RESET)"
	@for stack in $(ALL_STACKS); do \
		docker compose -f $$stack/docker-compose.yml down; \
	done

restart-all:
	@for stack in $(ALL_STACKS); do \
		docker compose -f $$stack/docker-compose.yml down; \
	done
	@for stack in $(ALL_STACKS); do \
		echo "$(YELLOW)  → $$stack$(RESET)"; \
		docker compose -f $$stack/docker-compose.yml up -d; \
	done

pull-all:
	@echo "$(CYAN)↓ Pulling latest images for all stacks...$(RESET)"
	@for stack in $(ALL_STACKS); do \
		docker compose -f $$stack/docker-compose.yml pull; \
	done
