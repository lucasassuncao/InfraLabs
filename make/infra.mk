# ============================================================
#  Infra
# ============================================================
.PHONY: up-infra up-traefik up-consul up-vault up-kong up-keycloak \
        up-portainer up-nginx up-uptime-kuma up-unleash \
        down-infra down-traefik down-consul down-vault down-kong down-keycloak \
        down-portainer down-nginx down-uptime-kuma down-unleash

# -- UP -------------------------------------------------------

up-infra:
	@echo "$(CYAN)>> Starting all Infra tools...$(RESET)"
	docker compose -f infra/traefik/docker-compose.yml up -d
	docker compose -f infra/consul/docker-compose.yml up -d
	docker compose -f infra/vault/docker-compose.yml up -d
	docker compose -f infra/kong/docker-compose.yml up -d
	docker compose -f infra/keycloak/docker-compose.yml up -d
	docker compose -f infra/portainer/docker-compose.yml up -d
	docker compose -f infra/nginx/docker-compose.yml up -d
	docker compose -f infra/uptime-kuma/docker-compose.yml up -d
	docker compose -f infra/unleash/docker-compose.yml up -d

up-traefik:
	@echo "$(CYAN)>> Starting Traefik...$(RESET)"
	docker compose -f infra/traefik/docker-compose.yml up -d
	@echo "$(GREEN)ok Traefik Dashboard:  http://localhost:8083$(RESET)"

up-consul:
	@echo "$(CYAN)>> Starting Consul...$(RESET)"
	docker compose -f infra/consul/docker-compose.yml up -d
	@echo "$(GREEN)ok Consul UI:  http://localhost:8500$(RESET)"

up-vault:
	@echo "$(CYAN)>> Starting Vault...$(RESET)"
	docker compose -f infra/vault/docker-compose.yml up -d
	@echo "$(GREEN)ok Vault:  http://localhost:8200  (token: root)$(RESET)"

up-kong:
	@echo "$(CYAN)>> Starting Kong...$(RESET)"
	docker compose -f infra/kong/docker-compose.yml up -d
	@echo "$(GREEN)ok Kong (proxy):  http://localhost:8000$(RESET)"
	@echo "$(GREEN)ok Kong (admin):  http://localhost:8001$(RESET)"
	@echo "$(GREEN)ok Konga UI:      http://localhost:1337$(RESET)"

up-keycloak:
	@echo "$(CYAN)>> Starting Keycloak...$(RESET)"
	docker compose -f infra/keycloak/docker-compose.yml up -d
	@echo "$(GREEN)ok Keycloak:  http://localhost:8180  (admin/admin)$(RESET)"

up-portainer:
	@echo "$(CYAN)>> Starting Portainer...$(RESET)"
	docker compose -f infra/portainer/docker-compose.yml up -d
	@echo "$(GREEN)ok Portainer: http://localhost:9010  (set password on first access)$(RESET)"

up-nginx:
	@echo "$(CYAN)>> Starting NGINX...$(RESET)"
	docker compose -f infra/nginx/docker-compose.yml up -d
	@echo "$(GREEN)ok NGINX: http://localhost:8091$(RESET)"

up-uptime-kuma:
	@echo "$(CYAN)>> Starting Uptime Kuma...$(RESET)"
	docker compose -f infra/uptime-kuma/docker-compose.yml up -d
	@echo "$(GREEN)ok Uptime Kuma: http://localhost:3002  (admin/admin123)$(RESET)"

up-unleash:
	@echo "$(CYAN)>> Starting Unleash...$(RESET)"
	docker compose -f infra/unleash/docker-compose.yml up -d
	@echo "$(GREEN)ok Unleash UI:  http://localhost:4242  (admin/unleash4all)$(RESET)"
	@echo "$(GREEN)ok API token:   default:development.unleash-insecure-api-token$(RESET)"

# -- DOWN -----------------------------------------------------

down-infra:
	docker compose -f infra/traefik/docker-compose.yml down
	docker compose -f infra/consul/docker-compose.yml down
	docker compose -f infra/vault/docker-compose.yml down
	docker compose -f infra/kong/docker-compose.yml down
	docker compose -f infra/keycloak/docker-compose.yml down
	docker compose -f infra/portainer/docker-compose.yml down
	docker compose -f infra/nginx/docker-compose.yml down
	docker compose -f infra/uptime-kuma/docker-compose.yml down
	docker compose -f infra/unleash/docker-compose.yml down

down-traefik:
	docker compose -f infra/traefik/docker-compose.yml down

down-consul:
	docker compose -f infra/consul/docker-compose.yml down

down-vault:
	docker compose -f infra/vault/docker-compose.yml down

down-kong:
	docker compose -f infra/kong/docker-compose.yml down

down-keycloak:
	docker compose -f infra/keycloak/docker-compose.yml down

down-portainer:
	docker compose -f infra/portainer/docker-compose.yml down

down-nginx:
	docker compose -f infra/nginx/docker-compose.yml down

down-uptime-kuma:
	docker compose -f infra/uptime-kuma/docker-compose.yml down

down-unleash:
	docker compose -f infra/unleash/docker-compose.yml down

