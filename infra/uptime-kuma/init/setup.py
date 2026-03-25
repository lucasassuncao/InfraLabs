#!/usr/bin/env python3
"""
Uptime Kuma — Auto-setup
Creates the admin account and registers all lab monitors.
Idempotent: skips monitors that already exist.
"""
from uptime_kuma_api import UptimeKumaApi, MonitorType
import time
import sys

KUMA_URL = "http://uptime-kuma:3001"
USER     = "admin"
PASSWORD = "admin123"
HOST     = "host.docker.internal"
INTERVAL = 60  # seconds


# ── Connection ────────────────────────────────────────────────
def connect(retries: int = 30, delay: int = 3) -> UptimeKumaApi:
    api = UptimeKumaApi(KUMA_URL)
    for i in range(retries):
        try:
            api.connect()
            print("Connected to Uptime Kuma.")
            return api
        except Exception:
            print(f"  Waiting for Uptime Kuma... ({i + 1}/{retries})")
            time.sleep(delay)
    print("Could not connect to Uptime Kuma.")
    sys.exit(1)


api = connect()

# ── Admin account ─────────────────────────────────────────────
try:
    api.setup(USER, PASSWORD)
    print("Admin account created.")
except Exception:
    api.login(USER, PASSWORD)
    print("Logged in.")

# ── Existing monitors (avoid duplicates) ──────────────────────
existing = {m["name"] for m in api.get_monitors()}


# ── Monitor list ──────────────────────────────────────────────
def http(name, path="", port=None):
    url = f"http://{HOST}:{port}{path}" if port else f"http://{HOST}{path}"
    return {"type": MonitorType.HTTP, "name": name, "url": url}

def tcp(name, port):
    return {"type": MonitorType.PORT, "name": name, "hostname": HOST, "port": port}


MONITORS = [
    # ── Observability ──────────────────────────────────────────
    http("Grafana",                 port=3000),
    http("Prometheus",              port=9090),
    http("Alertmanager",            port=9093),
    http("Grafana LGTM",            port=3001),
    http("Kibana",                  port=5601),
    http("Elasticsearch (ELK)",     port=9200),
    http("Jaeger",                  port=16686),
    http("Zipkin",                  port=9411),
    http("OTel Health",             port=13133, path="/"),

    # ── Databases ─────────────────────────────────────────────
    tcp ("PostgreSQL",              port=5432),
    tcp ("MySQL",                   port=3306),
    tcp ("MariaDB",                 port=3307),
    tcp ("Redis",                   port=6379),
    tcp ("MongoDB",                 port=27017),
    tcp ("Cassandra",               port=9042),
    http("pgAdmin",                 port=5050),
    http("RedisInsight",            port=5540),
    http("Mongo Express",           port=8082),
    http("MinIO Console",           port=9001),
    http("Elasticsearch Standalone",port=9201),
    http("Meilisearch",             port=7700, path="/health"),

    # ── Messaging ─────────────────────────────────────────────
    tcp ("Kafka",                   port=9092),
    http("Kafka UI",                port=8081),
    http("RabbitMQ",                port=15672),
    tcp ("NATS",                    port=4222),
    http("NATS Monitoring",         port=8222),

    # ── Infra ─────────────────────────────────────────────────
    http("Traefik Dashboard",       port=8083),
    http("Consul",                  port=8500),
    http("Vault",                   port=8200),
    http("Kong Proxy",              port=8000),
    http("Kong Admin",              port=8001),
    http("Keycloak",                port=8180),
    http("Portainer",               port=9010),
    http("NGINX",                   port=8091),
    http("Unleash",                 port=4242, path="/health"),

    # ── Security ──────────────────────────────────────────────
    http("OWASP ZAP",               port=8093),

    # ── Web ───────────────────────────────────────────────────
    http("LAMP",                    port=8090),
    http("LEMP",                    port=8092),
    http("Mailpit",                 port=8025),
    http("Hugo",                    port=1313),
]


# ── Register monitors ─────────────────────────────────────────
added   = 0
skipped = 0
errors  = 0

print(f"\nRegistering {len(MONITORS)} monitors...\n")

for m in MONITORS:
    if m["name"] in existing:
        print(f"  --  Already exists: {m['name']}")
        skipped += 1
        continue
    try:
        api.add_monitor(**m, interval=INTERVAL)
        print(f"  OK  Added:          {m['name']}")
        added += 1
    except Exception as e:
        print(f"  !!  Error ({m['name']}): {e}")
        errors += 1

print(f"\n{'─' * 40}")
print(f"  Added:    {added}")
print(f"  Skipped:  {skipped}")
print(f"  Errors:   {errors}")
print(f"{'─' * 40}")
print(f"\nAccess http://localhost:3002  (admin / admin123)\n")

api.disconnect()
