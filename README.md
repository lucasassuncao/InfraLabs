# DevOps/SRE Local Stacks

A collection of Docker environments for studying and experimenting with DevOps/SRE tools.
Each technology has its own isolated `docker-compose.yml`. Start and stop any stack individually or by category using `make`.

## Requirements

- Docker 24+
- Docker Compose v2 (`docker compose`)
- Make
- ~8 GB free RAM to run everything simultaneously (recommended: start by category)

---

## Directory structure

```
devops-stacks/
├── Makefile
├── make/
│   ├── observability.mk
│   ├── databases.mk
│   ├── messaging.mk
│   ├── infra.mk
│   ├── security.mk
│   ├── web.mk
│   └── utils.mk
├── observability/
│   ├── prometheus-stack/     # Prometheus + Grafana + Loki + Alertmanager + cAdvisor
│   ├── lgtm/                 # Loki + Grafana + Tempo + Mimir
│   ├── elk/                  # Elasticsearch + Logstash + Kibana + Filebeat
│   ├── splunk/               # Splunk Enterprise + Universal Forwarder
│   └── otel/                 # OTel Collector + Jaeger + Zipkin
├── databases/
│   ├── postgresql/           # PostgreSQL + pgAdmin
│   ├── mysql/                # MySQL + phpMyAdmin
│   ├── mariadb/              # MariaDB + phpMyAdmin
│   ├── redis/                # Redis + RedisInsight
│   ├── mongodb/              # MongoDB + Mongo Express
│   ├── cassandra/            # Cassandra
│   ├── minio/                # MinIO (S3-compatible object storage)
│   ├── elasticsearch/        # Elasticsearch standalone + Dejavu UI
│   └── meilisearch/          # Meilisearch
├── messaging/
│   ├── kafka/                # Kafka + Zookeeper + Kafka UI
│   ├── rabbitmq/             # RabbitMQ
│   └── nats/                 # NATS + JetStream + Prometheus exporter
├── infra/
│   ├── traefik/              # Traefik (reverse proxy)
│   ├── consul/               # Consul (service discovery + KV store)
│   ├── vault/                # HashiCorp Vault (secrets management)
│   ├── kong/                 # Kong API Gateway + Konga UI
│   ├── keycloak/             # Keycloak (IAM + SSO)
│   ├── portainer/            # Portainer CE (Docker UI)
│   ├── nginx/                # NGINX (reverse proxy / load balancer)
│   ├── uptime-kuma/          # Uptime Kuma (uptime monitoring)
│   ├── unleash/              # Unleash (feature flags)
├── security/
│   └── owasp-zap/            # OWASP ZAP (web security scanner)
└── web/
    ├── lamp/                 # Apache + PHP + MySQL + phpMyAdmin
    ├── lemp/                 # NGINX + PHP-FPM + MySQL + phpMyAdmin
    ├── mailpit/              # Mailpit (SMTP catcher)
    └── hugo/                 # Hugo (static site generator + live reload)
```

---

## Commands

```bash
# List all available targets
make help

# Print all service URLs and credentials
make urls

# Show running containers
make ps

# Health check all containers
make health

# Tail logs for a stack
make logs STACK=observability/elk

# Start/stop by category
make up-observability
make up-databases
make up-messaging
make up-infra
make up-security
make up-web

# Start/stop a specific technology
make up-postgresql
make up-kafka
make up-vault

# Start/stop everything
make up-all
make down-all

# Restart everything
make restart-all

# Pull latest images for all stacks
make pull-all

# Remove all containers, volumes, and networks
make nuke
```

---

## Stacks

### Observability

#### Prometheus Stack

Main observability stack based on Prometheus.

```bash
make up-prometheus-stack
```

| Service | URL | Credentials |
|---|---|---|
| Grafana | http://localhost:3000 | admin / admin |
| Prometheus | http://localhost:9090 | — |
| Alertmanager | http://localhost:9093 | — |
| Loki | http://localhost:3100 | — |
| cAdvisor | http://localhost:8080 | — |

#### LGTM

Grafana open-source stack: Loki + Grafana + Tempo + Mimir.

```bash
make up-lgtm
```

| Service | URL | Credentials |
|---|---|---|
| Grafana | http://localhost:3001 | admin / admin |
| Loki | http://localhost:3101 | — |
| Tempo | http://localhost:3200 | — |
| Tempo OTLP gRPC | localhost:4319 | — |
| Tempo OTLP HTTP | localhost:4320 | — |
| Mimir | http://localhost:9009 | — |

#### ELK Stack

Elasticsearch + Logstash + Kibana + Filebeat.

```bash
make up-elk
```

| Service | URL | Credentials |
|---|---|---|
| Kibana | http://localhost:5601 | — |
| Elasticsearch | http://localhost:9200 | — |
| Logstash TCP | localhost:5000 | — |
| Logstash Beats | localhost:5044 | — |

> Elasticsearch requires ~1.5 GB of RAM. Adjust `ES_JAVA_OPTS` in `observability/elk/docker-compose.yml` if needed.

Send a log via TCP:

```bash
echo '{"app":"test","level":"info","message":"hello elk"}' | nc localhost 5000
```

#### Splunk

Splunk Enterprise + Universal Forwarder.

```bash
make up-splunk
```

| Service | URL | Credentials |
|---|---|---|
| Splunk Web | http://localhost:8000 | admin / changeme123! |
| HEC | http://localhost:8088 | token: splunk-hec-token-00000000 |

> First boot may take ~2 minutes to fully initialize.

Send an event via HEC:

```bash
curl -X POST http://localhost:8088/services/collector/event \
  -H 'Authorization: Splunk splunk-hec-token-00000000' \
  -H 'Content-Type: application/json' \
  -d '{"event": "hello from curl", "sourcetype": "manual"}'
```

#### OTel

OpenTelemetry Collector + Jaeger + Zipkin.

```bash
make up-otel
```

| Service | URL | Credentials |
|---|---|---|
| Jaeger UI | http://localhost:16686 | — |
| Zipkin UI | http://localhost:9411 | — |
| OTel OTLP gRPC | localhost:4317 | — |
| OTel OTLP HTTP | localhost:4318 | — |
| zPages (debug) | http://localhost:55679/debug/tracez | — |

Send a trace via OTLP HTTP:

```bash
curl -X POST http://localhost:4318/v1/traces \
  -H 'Content-Type: application/json' \
  -d @trace-payload.json
```

---

### Databases

```bash
make up-databases        # start all
make up-postgresql
make up-mysql
make up-mariadb
make up-redis
make up-mongodb
make up-cassandra
make up-minio
make up-elasticsearch
make up-meilisearch
```

| Service | Address | Credentials |
|---|---|---|
| PostgreSQL | localhost:5432 | admin / admin |
| pgAdmin | http://localhost:5050 | admin@admin.com / admin |
| MySQL | localhost:3306 | admin / admin |
| phpMyAdmin (MySQL) | http://localhost:5051 | admin / admin |
| MariaDB | localhost:3307 | admin / admin |
| phpMyAdmin (MariaDB) | http://localhost:5052 | admin / admin |
| Redis | localhost:6379 | password: admin |
| RedisInsight | http://localhost:5540 | — |
| MongoDB | localhost:27017 | admin / admin |
| Mongo Express | http://localhost:8082 | admin / admin |
| Cassandra CQL | localhost:9042 | — |
| MinIO S3 API | http://localhost:9000 | admin / admin123 |
| MinIO Console | http://localhost:9001 | admin / admin123 |
| Elasticsearch | http://localhost:9201 | — |
| Dejavu UI | http://localhost:1358 | — |
| Meilisearch | http://localhost:7700 | masterkey |

Connect to Cassandra via CQL:

```bash
docker exec -it cassandra cqlsh
```

---

### Messaging

```bash
make up-messaging        # start all
make up-kafka
make up-rabbitmq
make up-nats
```

| Service | Address | Credentials |
|---|---|---|
| Kafka | localhost:9092 | — |
| Zookeeper | localhost:2181 | — |
| Kafka UI | http://localhost:8081 | — |
| RabbitMQ AMQP | localhost:5672 | — |
| RabbitMQ Management | http://localhost:15672 | admin / admin |
| NATS | localhost:4222 | — |
| NATS Monitoring | http://localhost:8222 | — |
| NATS Metrics | http://localhost:7777/metrics | — |

---

### Infra

```bash
make up-infra            # start all
make up-traefik
make up-consul
make up-vault
make up-kong
make up-keycloak
make up-portainer
make up-nginx
make up-uptime-kuma
make up-unleash
```

| Service | URL | Credentials |
|---|---|---|
| Traefik Dashboard | http://localhost:8083 | — |
| Consul UI | http://localhost:8500 | — |
| Vault | http://localhost:8200 | token: root |
| Kong Proxy | http://localhost:8000 | — |
| Kong Admin API | http://localhost:8001 | — |
| Konga (Kong UI) | http://localhost:1337 | — |
| Keycloak | http://localhost:8180 | admin / admin |
| Portainer | http://localhost:9010 | set on first access |
| NGINX | http://localhost:8091 | — |
| Uptime Kuma | http://localhost:3002 | set on first access |
| Unleash UI | http://localhost:4242 | admin / unleash4all |
| Unleash API token | — | default:development.unleash-insecure-api-token |

**Uptime Kuma:** on startup, an init container runs `init/setup.py` which automatically creates monitors for all lab services. Target services must be running before the script executes.

**Vault:** running in dev mode with token `root`. Data is not persisted between restarts. To enable persistence, edit `infra/vault/docker-compose.yml`.

---

### Security

```bash
make up-security         # start all
make up-owasp-zap
```

| Service | URL | Credentials |
|---|---|---|
| OWASP ZAP Proxy/API | http://localhost:8093 | apikey: zapkey |
| ZAP API UI | http://localhost:8093/UI | — |

Start a scan via API:

```bash
# Spider scan against a target
curl "http://localhost:8093/JSON/spider/action/scan/?apikey=zapkey&url=http://target"

# Active scan
curl "http://localhost:8093/JSON/ascan/action/scan/?apikey=zapkey&url=http://target"
```

---

### Web

```bash
make up-web              # start all
make up-lamp
make up-lemp
make up-mailpit
make up-hugo
```

| Service | URL | Credentials |
|---|---|---|
| LAMP (Apache/PHP) | http://localhost:8090 | — |
| LAMP phpMyAdmin | http://localhost:5053 | admin / admin |
| LAMP MySQL | localhost:3308 | admin / admin |
| LEMP (NGINX/PHP-FPM) | http://localhost:8092 | — |
| LEMP phpMyAdmin | http://localhost:5054 | admin / admin |
| LEMP MySQL | localhost:3309 | admin / admin |
| Mailpit UI | http://localhost:8025 | — |
| Mailpit SMTP | localhost:1025 | — |
| Hugo dev server | http://localhost:1313 | — |

**LAMP vs LEMP:** LAMP runs Apache + PHP in a single container; LEMP runs NGINX and PHP-FPM in separate containers communicating via Unix socket.

**Mailpit:** captures all emails sent to `localhost:1025` without forwarding to real mail servers. Useful for testing email delivery in local applications.

**Hugo:** live reload is enabled. Edit files under `web/hugo/site/content/` and changes appear automatically at http://localhost:1313.

---

## General notes

**Ports:** each stack uses distinct ports to allow simultaneous execution without conflicts. Run `make urls` for the full list.

**Volumes:** data is persisted in named Docker volumes. To wipe everything clean:

```bash
make nuke
```

**Logs:**

```bash
make logs STACK=observability/elk
make logs STACK=databases/postgresql
make logs STACK=infra/vault
```

**Configuration files:** located at `<category>/<technology>/config/`. Edit and re-run `make up-<technology>` to apply changes.
