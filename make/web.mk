# ============================================================
#  Web
# ============================================================
.PHONY: up-web up-lamp up-lemp up-mailpit up-hugo \
        down-web down-lamp down-lemp down-mailpit down-hugo

# -- UP -------------------------------------------------------

up-web:
	@echo "$(CYAN)>> Starting all Web stacks...$(RESET)"
	docker compose -f web/lamp/docker-compose.yml up -d
	docker compose -f web/lemp/docker-compose.yml up -d
	docker compose -f web/mailpit/docker-compose.yml up -d
	docker compose -f web/hugo/docker-compose.yml up -d

up-lamp:
	@echo "$(CYAN)>> Starting LAMP stack...$(RESET)"
	docker compose -f web/lamp/docker-compose.yml up -d
	@echo "$(GREEN)ok Apache/PHP:  http://localhost:8090$(RESET)"
	@echo "$(GREEN)ok phpMyAdmin:  http://localhost:5053$(RESET)"
	@echo "$(GREEN)ok MySQL:       localhost:3308  (admin/admin)$(RESET)"

up-lemp:
	@echo "$(CYAN)>> Starting LEMP stack...$(RESET)"
	docker compose -f web/lemp/docker-compose.yml up -d
	@echo "$(GREEN)ok NGINX/PHP:   http://localhost:8092$(RESET)"
	@echo "$(GREEN)ok phpMyAdmin:  http://localhost:5054$(RESET)"
	@echo "$(GREEN)ok MySQL:       localhost:3309  (admin/admin)$(RESET)"

up-mailpit:
	@echo "$(CYAN)>> Starting Mailpit...$(RESET)"
	docker compose -f web/mailpit/docker-compose.yml up -d
	@echo "$(GREEN)ok Mailpit UI:  http://localhost:8025$(RESET)"
	@echo "$(GREEN)ok SMTP:        localhost:1025$(RESET)"

up-hugo:
	@echo "$(CYAN)>> Starting Hugo...$(RESET)"
	docker compose -f web/hugo/docker-compose.yml up -d
	@echo "$(GREEN)ok Hugo dev server: http://localhost:1313  (live reload)$(RESET)"
	@echo "$(YELLOW)  Edit files in web/hugo/site/content/$(RESET)"

# -- DOWN -----------------------------------------------------

down-web:
	docker compose -f web/lamp/docker-compose.yml down
	docker compose -f web/lemp/docker-compose.yml down
	docker compose -f web/mailpit/docker-compose.yml down
	docker compose -f web/hugo/docker-compose.yml down

down-lamp:
	docker compose -f web/lamp/docker-compose.yml down

down-lemp:
	docker compose -f web/lemp/docker-compose.yml down

down-mailpit:
	docker compose -f web/mailpit/docker-compose.yml down

down-hugo:
	docker compose -f web/hugo/docker-compose.yml down
