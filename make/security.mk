# ============================================================
#  Security
# ============================================================
.PHONY: up-security up-owasp-zap \
        down-security down-owasp-zap

# -- UP -------------------------------------------------------

up-security:
	@echo "$(CYAN)>> Starting all Security tools...$(RESET)"
	docker compose -f security/owasp-zap/docker-compose.yml up -d

up-owasp-zap:
	@echo "$(CYAN)>> Starting OWASP ZAP...$(RESET)"
	docker compose -f security/owasp-zap/docker-compose.yml up -d
	@echo "$(GREEN)ok ZAP Proxy/API: http://localhost:8093  (apikey: zapkey)$(RESET)"
	@echo "$(YELLOW)  API docs: http://localhost:8093/UI$(RESET)"

# -- DOWN -----------------------------------------------------

down-security:
	docker compose -f security/owasp-zap/docker-compose.yml down

down-owasp-zap:
	docker compose -f security/owasp-zap/docker-compose.yml down
